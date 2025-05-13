import 'dart:math';

import 'package:flutter/cupertino.dart' hide Route;
import 'package:flutter/material.dart' hide Route;
import 'package:flutter_markdown/flutter_markdown.dart' as fmd;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:audio_session/audio_session.dart';
import 'package:apptours/app/home/controllers/hex_color.dart';
import 'package:apptours/app/home/controllers/routes_controller.dart';
import 'package:apptours/app/home/controllers/single_place_controller.dart';
import 'package:apptours/app/main/ui/apptours.dart';
import 'package:apptours/app/places/ui/expandable_text.dart';
import 'package:apptours/core/model/place.dart';
import 'package:apptours/core/model/route.dart';
import 'package:apptours/core/services/api_service.dart';
import 'package:apptours/core/theme/default/theme.dart';
import 'package:apptours/core/ui/route_item.dart';
import 'package:apptours/generated/l10n.dart';
import 'package:just_audio/just_audio.dart' as ja;

import '../../../core/ui/map/common.dart';

class PlaceScreen extends StatefulWidget {
  const PlaceScreen({
    required this.place,
    this.canBackToRoute = false,
    super.key,
  });

  final Place place;
  final bool canBackToRoute;

  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> with WidgetsBindingObserver {
  late final _routesStore = RoutesByPlaceListStore(widget.place.pk);
  final _placeStore = SinglePlaceStore();

  Place? place;
  int _current = 0;

  final _player = ja.AudioPlayer();

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _placeStore.load(widget.place.pk).then((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        place = _placeStore.data!;
        print("deeesc ${_placeStore.data?.description}");
        _init();
        setState(() {});
      });
    });

    _routesStore.load(null);
  }

  String getText() {
    var audio = place!.audio_transcript != null ? place!.audio_transcript! : "";
    if (isExpanded) {
      return "$audio [read less](https://www.google.com)";
    } else {
      return "${audio.substring(0, min(audio.length, 100))}... [read more](https://www.google.com)";
    }
  }

  void _onRoutePicked(Route route) {
    ApiService()
        .fetchRouteById(id: route.pk)
        .then((route) => Navigator.of(context, rootNavigator: true).pushNamed(AppRoute.route, arguments: route));
  }

  void _onStartRoute(Route route) {
    ApiService()
        .fetchRouteById(id: route.pk)
        .then((route) => Navigator.of(context, rootNavigator: true).pushNamed(AppRoute.map, arguments: route));
  }

  Stream<PositionData> get _positionDataStream => Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
      _player.positionStream,
      _player.bufferedPositionStream,
      _player.durationStream,
      (position, bufferedPosition, duration) => PositionData(position, bufferedPosition, duration ?? Duration.zero));

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    _player.playbackEventStream.listen((event) {}, onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    // Try to load audio from a source and catch any errors.
    try {
      // // AAC example: https://dl.espressif.com/dl/audio/ff-16b-2c-44100hz.aac
      // await _player.setAudioSource(AudioSource.uri(Uri.parse(
      //     "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3")));
      setAudio();
    } on PlayerException catch (e) {
      print("Error loading audio source: $e");
    }
  }

  void setAudio() {
    //player.setSourceUrl(route.places?[_currentIndex].audio ?? "");
    _player.setAudioSource(AudioSource.uri(Uri.parse(place?.audio ?? "")));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Observer(
              builder: (context) {
                if (_placeStore.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (place == null) {
                  return const Center(child: Text('Error loading place data'));
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          height: 330,
                          child: Stack(
                            children: [
                              if (place!.images?.isEmpty ?? true)
                                Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    _placeStore.data?.main_image ?? "",
                                  ),
                                )
                              else
                                Positioned.fill(
                                  child: CarouselSlider(
                                    disableGesture: false,
                                    options: CarouselOptions(
                                      viewportFraction: 1,
                                      scrollPhysics: const AlwaysScrollableScrollPhysics(),
                                      height: 330,
                                      autoPlay: place!.images!.length > 1,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          _current = index;
                                        });
                                      },
                                    ),
                                    items: place!.images!.map((i) {
                                      return SizedBox(
                                        width: MediaQuery.sizeOf(context).width,
                                        child: Image(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            i,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              IgnorePointer(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [Colors.black.withOpacity(.60), Colors.transparent],
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Spacer(),
                                      if (place!.images?.isNotEmpty ?? false)
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: place!.images!.asMap().entries.map((entry) {
                                            return Container(
                                              width: 10,
                                              height: 10,
                                              margin: const EdgeInsets.symmetric(horizontal: 4),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white.withOpacity(_current == entry.key ? 0.9 : 0.4)),
                                            );
                                          }).toList(),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 32),
                              Text(
                                _placeStore.data?.name ?? '',
                                style: const TextStyle(
                                  color: AppColors.text,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                  spacing: 8,
                                  children: [
                                    TextButton.icon(
                                      onPressed: null,
                                      icon: const Icon(
                                        Icons.location_on_outlined,
                                        color: AppColors.iconsGreen,
                                        size: 16,
                                      ),
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                        padding: const EdgeInsets.symmetric(horizontal: 9.5, vertical: 7.5),
                                        backgroundColor: AppColors.greyLight,
                                      ),
                                      label: Text(
                                        _placeStore.data?.address ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    if (_placeStore.data?.category != null)
                                      TextButton(
                                        onPressed: null,
                                        style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
                                          backgroundColor: HexColor(_placeStore.data?.category?.bg_color ?? "#ffffff"),
                                        ),
                                        child: Text(
                                          (_placeStore.data?.category?.name ?? "").toUpperCase(),
                                          style: TextStyle(
                                            color: HexColor(_placeStore.data?.category?.text_color ?? "#000000"),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    TextButton.icon(
                                      onPressed: null,
                                      icon: const Icon(
                                        Icons.watch_later_outlined,
                                        color: AppColors.dark,
                                        size: 12,
                                      ),
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                        padding: const EdgeInsets.symmetric(horizontal: 9.5, vertical: 7.5),
                                        backgroundColor: AppColors.greyLight,
                                      ),
                                      label: Text(
                                        '${_placeStore.data?.working_hours_from?.substring(0, 5)} - '
                                        '${_placeStore.data?.working_hours_until?.substring(0, 5)}',
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // const SizedBox(height: 40),
                              const SizedBox(height: 20),
                              Flexible(
                                child: fmd.MarkdownBody(
                                  data: _placeStore.data?.description ?? "",
                                  softLineBreak: true,
                                ),
                              ),
                              if (widget.canBackToRoute)
                                const SizedBox(height: 100),

                              if (!widget.canBackToRoute)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 48),
                                    const Text(
                                      "Audioguide",
                                      style: TextStyle(
                                        color: AppColors.text,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    Container(
                                      decoration: BoxDecoration(shape: BoxShape.rectangle, color: HexColor("#FAFAFB")),
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              const SizedBox(height: 20),
                                              StreamBuilder<ja.PlayerState>(
                                                stream: _player.playerStateStream,
                                                builder: (context, snapshot) {
                                                  final playerState = snapshot.data;
                                                  final processingState = playerState?.processingState;
                                                  final playing = playerState?.playing;
                                                  if (processingState == ProcessingState.loading ||
                                                      processingState == ProcessingState.buffering) {
                                                    return Container(
                                                      margin: const EdgeInsets.all(8.0),
                                                      width: 48.0,
                                                      height: 48.0,
                                                      child: const CircularProgressIndicator(),
                                                    );
                                                  } else if (playing != true) {
                                                    return Container(
                                                      width: 48,
                                                      height: 48,
                                                      decoration: const BoxDecoration(
                                                          shape: BoxShape.circle, color: AppColors.dark),
                                                      child: IconButton(
                                                        icon: const Icon(
                                                          Icons.play_arrow,
                                                          color: Colors.white,
                                                        ),
                                                        iconSize: 24.0,
                                                        onPressed: _player.play,
                                                      ),
                                                    );
                                                  } else if (processingState != ProcessingState.completed) {
                                                    return Container(
                                                      width: 48,
                                                      height: 48,
                                                      decoration: const BoxDecoration(
                                                          shape: BoxShape.circle, color: AppColors.dark),
                                                      child: IconButton(
                                                        icon: const Icon(
                                                          Icons.pause,
                                                          color: Colors.white,
                                                        ),
                                                        iconSize: 24.0,
                                                        onPressed: _player.pause,
                                                      ),
                                                    );
                                                  } else {
                                                    return IconButton(
                                                      icon: const Icon(Icons.replay),
                                                      iconSize: 36.0,
                                                      onPressed: () => _player.seek(Duration.zero),
                                                    );
                                                  }
                                                },
                                              ),
                                              Expanded(
                                                child: StreamBuilder<PositionData>(
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
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 24),
                                          MarkdownBody(
                                            softLineBreak: true,
                                            // shrinkWrap: true,
                                            fitContent: false,
                                            data: getText(),
                                            onTapLink: (text, href, title) {
                                              isExpanded = !isExpanded;
                                              setState(() {});
                                            },
                                            // style: const TextStyle(color: AppColors.secondary, fontSize: 14),
                                            // overflow: TextOverflow.ellipsis,
                                          ),
                                          // ExpandableText(
                                          //   (place!.audio_transcript != null ? place!.audio_transcript! : ""),
                                          // ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              if (!widget.canBackToRoute)
                                Observer(builder: (context) {
                                  if (_routesStore.isLoading) {
                                    return const Center(child: CircularProgressIndicator());
                                  }
                                  if (_routesStore.data.isNotEmpty) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(height: 48),
                                        Text(
                                          '${s.label_tours_including_this_place}:',
                                          style: const TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(height: 24),
                                        SizedBox(
                                          height: 385,
                                          child: OverflowBox(
                                            maxWidth: MediaQuery.of(context).size.width,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: ListView.separated(
                                                shrinkWrap: true,
                                                scrollDirection: Axis.horizontal,
                                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                                separatorBuilder: (context, _) => const SizedBox(width: 20),
                                                itemCount: _routesStore.data.length,
                                                itemBuilder: (context, index) {
                                                  final route = _routesStore.data[index];
                                                  return GestureDetector(
                                                    onTap: () {
                                                      _onRoutePicked(route);
                                                    },
                                                    child: SizedBox(
                                                      width: 290,
                                                      child: RouteItem(
                                                        route: route,
                                                        showStartButton: true,
                                                        onStartRoute: () {
                                                          _onStartRoute(route);
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  return Container();
                                }),
                              SizedBox(height: 10 + MediaQuery.of(context).systemGestureInsets.bottom),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
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
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: Navigator.of(context, rootNavigator: true).pop,
                              iconSize: 24,
                              icon: const Icon(CupertinoIcons.arrow_left, color: Colors.white),
                            ),
                          ),
                        ),
                        Text(
                          _placeStore.data?.name ?? '',
                          style: const TextStyle(
                            color: AppColors.light,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (widget.canBackToRoute)
              Observer(
                builder: (context) {
                  if (_placeStore.isLoaded) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: AppColors.light,
                            padding:
                                EdgeInsets.fromLTRB(20, 16, 20, 20 + MediaQuery.of(context).systemGestureInsets.bottom),
                            child: InkWell(
                              onTap: Navigator.of(context, rootNavigator: true).pop,
                              child: Container(
                                height: 54,
                                width: MediaQuery.sizeOf(context).width,
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                decoration: BoxDecoration(
                                  color: AppColors.accentGreen,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      CupertinoIcons.arrow_left,
                                      color: AppColors.textGreen,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      s.label_back_to_tour,
                                      style: const TextStyle(
                                        color: AppColors.textGreen,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
          ],
        ),
      ),
    );
  }
}
