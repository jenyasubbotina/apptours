import 'dart:math';

import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:audio_session/audio_session.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:location/location.dart' hide LocationAccuracy;
import 'package:apptours/core/theme/default/theme.dart';
import 'package:apptours/core/ui/route_complexity.dart';
import 'package:rxdart/rxdart.dart';
import 'package:apptours/core/utils/map_utils.dart';
import 'package:apptours/generated/l10n.dart';
import 'package:apptours/app/home/controllers/hex_color.dart';
import 'package:apptours/app/main/ui/apptours.dart';
import 'package:apptours/core/model/place.dart';
import 'package:just_audio/just_audio.dart' as ja;
import '../../../app/home/controllers/restaurants_controller.dart';
import '../../../main.dart';
import 'common.dart';
import 'marker_icon.dart';
import 'package:apptours/core/model/route.dart' as model;

class MapScreen extends StatefulWidget {
  const MapScreen({required this.route, super.key});

  final model.Route route;

  @override
  State<StatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin, WidgetsBindingObserver {
  model.Route get route => widget.route;
  final _store = di.get<RestaurantsListStore>();

  bool _showPin = false;

  @override
  bool get wantKeepAlive => true;

  GoogleMapController? controller;
  late Position userCurrentLocation;

  late LatLngBounds bounds;

  List<Place> restaurants = List.empty();

  List<Marker> googleMarkers = List.empty();

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Map<MarkerId, Marker> pllynes = <MarkerId, Marker>{};
  Map<MarkerId, Marker> rest = <MarkerId, Marker>{};
  MarkerId? selectedMarker;
  LatLng? markerPosition;
  late BitmapDescriptor tapped;
  late Duration duration;

  late LatLng userLocation;
  late bool _serviceEnabled;

  double currentZoom = 12;

  final _player = ja.AudioPlayer();
  BitmapDescriptor? defaultIcon;
  BitmapDescriptor? pressedDefaultIcon;

  var _currentIndex = 0;
  late Place _choosedMarker;

  Stream<PositionData> get _positionDataStream => Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
      _player.positionStream,
      _player.bufferedPositionStream,
      _player.durationStream,
      (position, bufferedPosition, duration) => PositionData(position, bufferedPosition, duration ?? Duration.zero));

  @override
  void initState() {
    super.initState();
    _store.load(null).then((_) {
      restaurants = _store.data;
      addRestaurants();
    });
    _addMarkers();
    _getLocation();

    List<String> timeParts = route.duration_slow.split(':');
    duration = Duration(hours: int.parse(timeParts[0]), minutes: int.parse(timeParts[1]), seconds: int.parse(timeParts[2]));

    _init();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    _player.playbackEventStream.listen((event) {}, onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    try {
      setAudioIndex();
    } on PlayerException catch (e) {
      print("Error loading audio source: $e");
    }
  }

  AlertDialog alert = AlertDialog(
    title: Text("Clicked"),
    content: Text("This is my message."),
  );

  void setAudioIndex() {
    _player.setAudioSource(AudioSource.uri(Uri.parse(route.places?[_currentIndex].audio ?? "")));
  }

  void setAudioUrl(String url) {
    _player.setAudioSource(AudioSource.uri(Uri.parse(url)));
    _player.play();
  }

  @override
  void dispose() {
    super.dispose();
    _player.stop();
    _player.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _player.stop();
    }
  }

  Future<void> moveToCurrentLocation() async {
    var location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    userCurrentLocation = location;
    setState(() {
      controller?.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(
            userCurrentLocation.latitude,
            userCurrentLocation.longitude,
          ),
        ),
      );
    });
  }

  final Set<Polyline> _polyline = {};

  Future<void> _addMarkers() async {
    var points = _createPoints();
    int markerIdCounter = 0;
    var places = route.places ?? [];
    for (int i = 0; i < places.length; i++) {
      var markerId = MarkerId(markerIdCounter.toString());
      Marker m;
      var icon = await MarkerIcon.pictureAssetWithCenterText(
          assetPath: _currentIndex >= i ? "assets/images/pin_selected.png" : "assets/images/pin_not_selected.png",
          size: const Size(120, 120),
          text: "${i + 1}",
          fontSize: 40,
          fontColor: _currentIndex >= i ? AppColors.dark : Colors.white,
          fontWeight: FontWeight.bold);
      m = Marker(
        markerId: markerId,
        icon: icon,
        position: LatLng(
          points[i].latitude,
          points[i].longitude,
        ),
        onTap: () {
          _showPin = true;
          setState(() {
            _choosedMarker = places[i];
          });
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) {
          //     return alert;
          //   },
          // );
        },
      );
      markers[markerId] = m;
      markerIdCounter++;
    }
    setState(() {});
    print("MAARKER $markers");

    var polylines = route.gpx_data?.tracks[0].segments[0].points ?? [];
    int pllynesCounter = 0;
    for (int i = 0; i < polylines.length; i++) {
      var markerId = MarkerId("${pllynesCounter}f");
      Marker m;
      var icon = await MarkerIcon.circleCanvasWithText(
        size: const Size(15, 5),
        circleColor: AppColors.dark,
        text: '',
      );
      m = Marker(
          markerId: markerId,
          icon: icon,
          position: LatLng(
            polylines[i][0],
            polylines[i][1],
          ),
          onTap: () {
            var min1 = 1.0;
            var el = markers.values.first;
            markers.values.forEach((element) {
              var first = LatLng(
                polylines[i][0],
                polylines[i][1],
              );
              var second = element.position;
              var dst = sqrt((first.latitude - second.latitude) *
                      (first.latitude - second.latitude) +
                  (first.longitude - second.longitude) *
                      (first.longitude - second.longitude));
              if (dst < min1) {
                min1 = dst;
                el = element;
              }
            });
            if (min1 <= 0.008 && min1 > 0) {
              el.onTap!();
            }
          });
      pllynes[markerId] = m;
      pllynesCounter++;
    }
    setState(() {});
  }

  Future<void> addRestaurants() async {
    var points = restaurants.toList();
    int markerIdCounter = 546;
    for (int i = 0; i < points.length; i++) {
      var markerId = MarkerId(markerIdCounter.toString());
      Marker m;
      var icon = await MarkerIcon.pictureAssetWithCenterText(
          assetPath: "assets/images/pin_rest.png", size: const Size(130, 140), text: "");
      m = Marker(
        markerId: markerId,
        icon: icon,
        position: LatLng(points[i].location.latitude, points[i].location.longitude),
        onTap: () {
          _showPin = true;
          setState(() {
            _choosedMarker = points[i];
          });
        },
      );
      rest[markerId] = m;
      markerIdCounter++;
    }
    setState(() {});
    print("REEEST $rest");
  }

  List<LatLng> _createPoints() {
    final List<LatLng> points = <LatLng>[];
    var places = route.places ?? [];
    for (var element in places) {
      points.add(LatLng(element.location.latitude, element.location.longitude));
    }
    return points;
  }

  Future<void> _getLocation() async {
    Location location = Location();

    var permissionGranted = await location.hasPermission();
    _serviceEnabled = await location.serviceEnabled();

    if (permissionGranted != PermissionStatus.granted || !_serviceEnabled) {
      permissionGranted = await location.requestPermission();
      _serviceEnabled = await location.requestService();
    } else {
      // TODO откомментировать
      // LocationData currentPosition = await location.getLocation();
      // userLocation = LatLng(currentPosition.latitude!, currentPosition.longitude!);
      // controller?.animateCamera(
      //   CameraUpdate.newCameraPosition(
      //     CameraPosition(
      //       bearing: 0,
      //       target: userLocation,
      //       zoom: 14.0,
      //     ),
      //   ),
      // );
    }
  }

  List<StepperData> _stepperData() {
    List<StepperData> list = [];
    print("heere ${route.places}");
    if (route.places != null && route.places?.isNotEmpty == true) {
      var i = 0;
      route.places?.forEach((element) {
        list.add(
          StepperData(
            title: StepperText(element.name),
            iconWidget: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: _currentIndex >= list.length ? AppColors.accentGreen : AppColors.dark,
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: Center(
                child: Text(
                  (i + 1).toString(),
                  style: TextStyle(
                      color: _currentIndex >= list.length ? AppColors.dark : Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        );
        i += 1;
      });
      return list;
    } else {
      return [
        StepperData(
          title: StepperText(
            "",
          ),
        )
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final s = S.of(context);

    return Scaffold(
      backgroundColor: AppColors.light,
      body: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Listener(
                onPointerMove: (e) {
                  _showPin = false;
                  setState(() {});
                },
                child: GoogleMap(
                  //  style: MAP_STYLE,
                  scrollGesturesEnabled: true,
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: true,
                  rotateGesturesEnabled: true,
                  onTap: (LatLng lt) {
                    _showPin = false;
                    setState(() {});
                  },
                  onMapCreated: (GoogleMapController x) {
                    // here save the value
                    controller = x;
                    //controller.setMapStyle(MAP_STYLE);
                  },
                  //polylines: Set<Polyline>.of(_polyline),
                  initialCameraPosition: CameraPosition(
                    target: LatLng(route.places?[_currentIndex].location.latitude ?? 0,
                        route.places?[_currentIndex].location.longitude ?? 0),
                    zoom: currentZoom,
                  ),
                  markers: Set<Marker>.of({...markers.values, ...pllynes.values, ...rest.values}),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  onCameraMove: (value) {
                    controller?.getVisibleRegion().then(
                          (value) => {
                            bounds = value,
                          },
                        );
                    currentZoom = value.zoom;
                  },
                ),
              ),
            ),

            if (_showPin)
              Align(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Container(
                    height: 105,
                    width: 258,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.network(
                          _choosedMarker.main_image ?? "",
                          fit: BoxFit.cover,
                          width: 85,
                          height: 102,
                        ),
                        Flexible(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _choosedMarker.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: HexColor("#D9DCE1"),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(3.0),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      MapUtils.openMap(
                                          _choosedMarker.location.latitude, _choosedMarker.location.longitude);
                                    },
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.pin_drop,
                                          size: 14,
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          "Show directions",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 14,
                                ),
                                SizedBox(
                                  height: 24,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          setAudioUrl(_choosedMarker.audio ?? "");
                                        },
                                        style: TextButton.styleFrom(backgroundColor: AppColors.accentGreen),
                                        child: const Text(
                                          "Listen",
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context, rootNavigator: true)
                                              .pushNamed(AppRoute.place, arguments: [_choosedMarker, true]);
                                        },
                                        style: TextButton.styleFrom(backgroundColor: AppColors.dark),
                                        child: const Text(
                                          "More info",
                                          style: TextStyle(fontSize: 13, color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            // back & 1 of 5 completed
            Positioned(
              left: 20,
              right: 20,
              top: MediaQuery.of(context).padding.top + 28,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: AppColors.light,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: Navigator.of(context, rootNavigator: true).pop,
                        icon: const Icon(
                          CupertinoIcons.arrow_left,
                          color: AppColors.dark,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: AppColors.light,
                      borderRadius: BorderRadius.circular(42),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.accentGreen,
                          ),
                          child: Center(
                            child: Text(
                              (_currentIndex + 1).toString(),
                              style: const TextStyle(
                                color: AppColors.textGreen,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          s.label_of_completed(route.places?.length ?? 0),
                          style: const TextStyle(
                            color: AppColors.dark,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // FindMe button
            Positioned(
              right: 10,
              bottom: 300,
              child: Container(
                width: 44,
                decoration: const BoxDecoration(
                  color: AppColors.light,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () async {
                    moveToCurrentLocation();
                  },
                  icon: const Icon(
                    CupertinoIcons.location_fill,
                    color: AppColors.iconsGreen,
                  ),
                ),
              ),
            ),
            // BottomSheet
            Positioned.fill(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowIndicator();
                  return true;
                },
                child: DraggableScrollableSheet(
                  snap: true,
                  snapSizes: const [.25, .45, .65],
                  minChildSize: .25,
                  maxChildSize: .65,
                  initialChildSize: .35,
                  builder: (BuildContext context, ScrollController scrollController) {
                    return ListView(
                      controller: scrollController,
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: SizedBox(
                            height: 62,
                            child: ListView.separated(
                              controller: ScrollController(),
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              itemCount: route.places?.length ?? 0,
                              separatorBuilder: (context, index) => const SizedBox(width: 10),
                              itemBuilder: (context, index) {
                                final img = route.places?[index].main_image;
                                if (img != null) {
                                  return Container(
                                    width: 100,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
                                    ),
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: 16,
                                      height: 16,
                                      decoration: const BoxDecoration(
                                        color: AppColors.light,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          (index + 1).toString(),
                                          style: const TextStyle(
                                            color: AppColors.text,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                          ),
                        ),
                        Container(
                          color: AppColors.light,
                          height: MediaQuery.of(context).size.height / 100 * 65 - 62 - 10,
                          child: Column(
                            children: [
                              Container(
                                height: 5,
                                width: 40,
                                margin: const EdgeInsets.only(top: 8),
                                decoration: BoxDecoration(
                                  color: AppColors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: ListView(
                                    shrinkWrap: true,
                                    // controller: scrollController,
                                    controller: ScrollController(),
                                    padding: EdgeInsets.zero,
                                    children: [
                                      Text(
                                        route.name,
                                        style: const TextStyle(
                                          color: AppColors.text,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          RouteComplexity(route.difficulty),
                                          const SizedBox(width: 24),
                                          Container(
                                            height: 30,
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: AppColors.dark.withOpacity(0.08),
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              s.text_hrs(route.duration_fast.substring(0, 2)),
                                              style: const TextStyle(
                                                color: AppColors.dark,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 14),
                                          Container(
                                            height: 30,
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: AppColors.dark.withOpacity(0.08),
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              s.text_km(route.length / 1000),
                                              style: const TextStyle(
                                                color: AppColors.dark,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      StreamBuilder<PositionData>(
                                        stream: _positionDataStream,
                                        builder: (context, snapshot) {
                                          final positionData = snapshot.data;
                                          return SeekBar(
                                            duration: positionData?.duration ?? Duration.zero,
                                            position: positionData?.position ?? Duration.zero,
                                            bufferedPosition: positionData?.bufferedPosition ?? Duration.zero,
                                            onChangeEnd: _player.seek,
                                          );
                                        },
                                      ),
                                      const SizedBox(height: 10),
                                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                        SizedBox(
                                          height: 54,
                                          width: 54,
                                          child: FilledButton(
                                            onPressed: () {
                                              if (_currentIndex > 0) {
                                                _currentIndex -= 1;
                                                setAudioIndex();
                                                setState(() {
                                                  _addMarkers();
                                                });
                                              }
                                            },
                                            style: FilledButton.styleFrom(
                                              backgroundColor:
                                                  _currentIndex < 1 ? HexColor("#F5F7F7") : AppColors.dark15,
                                              shape: const CircleBorder(),
                                            ),
                                            child: Icon(
                                              Icons.skip_previous,
                                              size: 30,
                                              color: _currentIndex < 1
                                                  ? HexColor("#F5F7F7")
                                                  : const IconThemeData.fallback().color,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Center(child: ControlButtons(_player)),
                                        ),
                                        SizedBox(
                                          height: 54,
                                          width: 54,
                                          child: FilledButton(
                                            onPressed: () {
                                              if (_currentIndex < (route.places?.length ?? 0)) {
                                                _currentIndex += 1;
                                                setAudioIndex();
                                                setState(() {
                                                  _addMarkers();
                                                });
                                              }
                                            },
                                            style: FilledButton.styleFrom(
                                              backgroundColor: _currentIndex >= (route.places!.length - 1)
                                                  ? HexColor("#F5F7F7")
                                                  : AppColors.dark15,
                                              shape: const CircleBorder(),
                                            ),
                                            child: Icon(
                                              Icons.skip_next,
                                              size: 30,
                                              color: _currentIndex >= (route.places!.length - 1)
                                                  ? HexColor("#F5F7F7")
                                                  : const IconThemeData.fallback().color,
                                            ),
                                          ),
                                        ),
                                      ]),
                                      const SizedBox(height: 20),
                                      Card(
                                        color: AppColors.card,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        borderOnForeground: false,
                                        child: ExpansionTile(
                                          initiallyExpanded: true,
                                          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                          title: Text(
                                            s.label_tour,
                                            style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                          children: [
                                            // 1 of 5 completed + 25 mins to finish
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    height: 46,
                                                    padding: const EdgeInsets.only(left: 10, right: 15),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.light,
                                                      borderRadius: BorderRadius.circular(42),
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Container(
                                                          width: 25,
                                                          height: 25,
                                                          decoration: const BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: AppColors.accentGreen,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              (_currentIndex + 1).toString(),
                                                              style: const TextStyle(
                                                                color: AppColors.textGreen,
                                                                fontSize: 16,
                                                                fontWeight: FontWeight.w800,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 8),
                                                        Expanded(
                                                          child: FittedBox(
                                                            fit: BoxFit.scaleDown,
                                                            child: Text(
                                                              s.label_of_completed(route.places?.length ?? 0),
                                                              style: const TextStyle(
                                                                color: AppColors.dark,
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.w500,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 16),
                                                Expanded(
                                                  child: Container(
                                                    height: 46,
                                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.light,
                                                      borderRadius: BorderRadius.circular(42),
                                                    ),
                                                    child: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: RichText(
                                                        text: TextSpan(children: [
                                                          TextSpan(
                                                            text:
                                                                '~${s.label_mins(((duration.inMinutes / route.places!.length * (route.places!.length - (_currentIndex + 1)))).toStringAsFixed(0))} ',
                                                            style: const TextStyle(
                                                              color: AppColors.dark,
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.w700,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: s.label_to_finish,
                                                            style: const TextStyle(
                                                              color: AppColors.dark,
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.w500,
                                                            ),
                                                          ),
                                                        ]),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 24),
                                            // Steps
                                            Container(
                                              padding: const EdgeInsets.fromLTRB(20, 20, 24, 20),
                                              decoration: BoxDecoration(
                                                color: AppColors.light,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    s.label_places_in_this_tour,
                                                    style: const TextStyle(
                                                      color: AppColors.primary,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                  ),
                                                  AnotherStepper(
                                                    stepperList: _stepperData(),
                                                    stepperDirection: Axis.vertical,
                                                    iconWidth: 32,
                                                    iconHeight: 32,
                                                    activeBarColor: AppColors.accentGreen,
                                                    inActiveBarColor: AppColors.dark,
                                                    inverted: false,
                                                    verticalGap: 12,
                                                    activeIndex: _currentIndex,
                                                    barThickness: 3,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ControlButtons extends StatelessWidget {
  final ja.AudioPlayer player;

  const ControlButtons(this.player, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Opens volume slider dialog
        IconButton(
          icon: const Icon(Icons.volume_up),
          onPressed: () {
            showSliderDialog(
              context: context,
              title: "Adjust volume",
              divisions: 10,
              min: 0.0,
              max: 1.0,
              value: player.volume,
              stream: player.volumeStream,
              onChanged: player.setVolume,
            );
          },
        ),

        StreamBuilder<ja.PlayerState>(
          stream: player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (processingState == ProcessingState.loading || processingState == ProcessingState.buffering) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                width: 64.0,
                height: 64.0,
                child: const CircularProgressIndicator(),
              );
            } else if (playing != true) {
              return IconButton(
                icon: const Icon(Icons.play_arrow),
                iconSize: 64.0,
                onPressed: player.play,
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                icon: const Icon(Icons.pause),
                iconSize: 64.0,
                onPressed: player.pause,
              );
            } else {
              return IconButton(
                icon: const Icon(Icons.replay),
                iconSize: 64.0,
                onPressed: () => player.seek(Duration.zero),
              );
            }
          },
        ),
        // Opens speed slider dialog
        StreamBuilder<double>(
          stream: player.speedStream,
          builder: (context, snapshot) => IconButton(
            icon: Text("${snapshot.data?.toStringAsFixed(1)}x", style: const TextStyle(fontWeight: FontWeight.bold)),
            onPressed: () {
              showSliderDialog(
                context: context,
                title: "Adjust speed",
                divisions: 10,
                min: 0.5,
                max: 1.5,
                value: player.speed,
                stream: player.speedStream,
                onChanged: player.setSpeed,
              );
            },
          ),
        ),
      ],
    );
  }
}
