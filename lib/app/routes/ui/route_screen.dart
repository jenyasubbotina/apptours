import 'package:flutter/cupertino.dart' hide Route;
import 'package:flutter/material.dart' hide Route;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:apptours/app/main/ui/apptours.dart';
import 'package:apptours/core/model/route.dart';
import 'package:apptours/core/services/api_service.dart';
import 'package:apptours/core/theme/default/theme.dart';
import 'package:apptours/core/ui/like_button.dart';
import 'package:apptours/core/ui/route_complexity.dart';
import 'package:apptours/generated/assets/assets.gen.dart';
import 'package:apptours/generated/l10n.dart';
import 'package:apptours/main.dart';
import 'package:apptours/core/ui/map/marker_icon.dart';

import '../../../core/utils/map_utils.dart';

class RouteScreen extends StatefulWidget {
  const RouteScreen({required this.route, super.key});

  final Route route;

  @override
  State<StatefulWidget> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  final _service = di.get<ApiService>();

  Route get route => widget.route;
  GoogleMapController? controller;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Map<MarkerId, Marker> pllynes = <MarkerId, Marker>{};

  Future<void> add() async {
    var points = _createPoints();
    int markerIdCounter = 0;
    var places = route.places ?? [];
    for (int i = 0; i < places.length; i++) {
      var markerId = MarkerId(markerIdCounter.toString());
      Marker m;
      var icon = await MarkerIcon.circleCanvasWithText(
        size: const Size(30, 30),
        text: "",
        fontSize: 40,
        circleColor: AppColors.dark,
      );
      m = Marker(
        markerId: markerId,
        icon: icon,
        position: LatLng(
          points[i].latitude,
          points[i].longitude,
        ),
      );
      markers[markerId] = m;
      markerIdCounter++;
    }
    print("MAARKER $markers");
    setState(() {});

    print(route.gpx_data?.tracks.length);
    print(route.gpx_data?.tracks.first.segments.first);
    var polylines = route.gpx_data?.tracks[0].segments[0].points ?? [];
    int pllynesCounter = 0;
    for (int i = 0; i < polylines.length; i++) {
      var markerId = MarkerId("${pllynesCounter}f");
      Marker m;
      var icon = await MarkerIcon.circleCanvasWithText(
        size: const Size(5, 5),
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
      );
      pllynes[markerId] = m;
      pllynesCounter++;
    }
    print("hhire ${pllynes.values}");
    setState(() {});
  }

  List<LatLng> _createPoints() {
    final List<LatLng> points = <LatLng>[];
    var places = route.places ?? [];
    for (var element in places) {
      points.add(LatLng(element.location.latitude, element.location.longitude));
    }
    return points;
  }

  @override
  void initState() {
    super.initState();
    add();
  }

  Future<bool> Function(bool liked) get _onLikeClick =>
      (liked) async => _service.updateLikedRoute(id: widget.route.pk, liked: liked);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 330,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            route.image,
                          ),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black.withOpacity(.60), Colors.transparent],
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          Text(
                            route.name,
                            style: const TextStyle(
                              color: AppColors.text,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 30,
                            child: OverflowBox(
                              maxWidth: MediaQuery.of(context).size.width,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                shrinkWrap: true,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.greyLight,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: SvgPicture.asset(
                                            Assets.icons.clock.path,
                                            color: AppColors.dark,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          s.text_hrs(route.duration_fast.substring(0, 2)),
                                          style: const TextStyle(
                                            color: AppColors.dark,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.greyLight,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: SvgPicture.asset(
                                            Assets.icons.flag.path,
                                            color: AppColors.dark,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          s.text_km(route.length ~/ 1000),
                                          style: const TextStyle(
                                            color: AppColors.dark,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 25),
                                  RouteComplexity(route.difficulty),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Flexible(
                            child: MarkdownBody(
                              data: route.description,
                              softLineBreak: true,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            '${s.label_location}:',
                            style: const TextStyle(
                              color: AppColors.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 250,
                            child: GoogleMap(
                              onMapCreated: (GoogleMapController x) {
                                // here save the value
                                controller = x;
                                controller?.moveCamera(CameraUpdate.newLatLngBounds(
                                  MapUtils.boundsFromLatLngList(_createPoints()),
                                  20.0,
                                ));
                                //controller.setMapStyle(MAP_STYLE);
                              },
                              scrollGesturesEnabled: true,
                              zoomGesturesEnabled: true,
                              zoomControlsEnabled: true,
                              markers: Set<Marker>.of({...markers.values, ...pllynes.values}),
                              initialCameraPosition: CameraPosition(
                                target: (LatLng(route.gpx_data!.tracks[0].segments[0].points[0][0],
                                    route.gpx_data!.tracks[0].segments[0].points[0][1])),
                                zoom: 12,
                              ),
                            ),
                          ),
                          SizedBox(height: 54 + 40 + MediaQuery.of(context).systemGestureInsets.bottom),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: Navigator.of(context, rootNavigator: true).pop,
                          iconSize: 24,
                          icon: const Icon(CupertinoIcons.arrow_left, color: Colors.white),
                        ),
                        Text(
                          route.name,
                          style: const TextStyle(
                            color: AppColors.light,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        LikeButton.white(
                          liked: route.liked,
                          onPressed: _onLikeClick,
                          refetchRoutes: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: AppColors.light,
                    padding: EdgeInsets.fromLTRB(20, 16, 20, 20 + MediaQuery.of(context).systemGestureInsets.bottom),
                    child: InkWell(
                      onTap: () => Navigator.of(context, rootNavigator: true).pushNamed(AppRoute.map, arguments: route),
                      child: Container(
                        height: 54,
                        width: MediaQuery.sizeOf(context).width,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                          color: AppColors.accentGreen,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              s.label_start_this_tour,
                              style: const TextStyle(
                                color: AppColors.textGreen,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Icon(
                              CupertinoIcons.arrow_right,
                              color: AppColors.textGreen,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
