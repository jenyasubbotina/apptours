import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:apptours/app/home/controllers/hex_color.dart';
import 'package:apptours/core/theme/default/theme.dart';

class PlayerWidget extends StatefulWidget {
  final AudioPlayer player;
  final VoidCallback onPrevTap;
  final VoidCallback onNextTap;
  final int maxPlaces;
  final int currentIndex;

  const PlayerWidget({
    required this.player,
    required this.onNextTap,
    required this.onPrevTap,
    required this.maxPlaces,
    required this.currentIndex,
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _PlayerWidgetState();
  }
}

class _PlayerWidgetState extends State<PlayerWidget> {
  PlayerState? _playerState;
  //Duration? _duration;
  //Duration? _position;

  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateChangeSubscription;

  bool get _isPlaying => _playerState?.playing == true;

  bool get _isPaused => _playerState?.processingState == true;

  String get _durationText => player.duration?.inMinutes.toString().split('.').first ?? '';

  String get _positionText => player.position.toString().split('.').first ?? '';

  AudioPlayer get player => widget.player;

  @override
  void initState() {
    super.initState();
    // Use initial values from player
    _playerState = player.playerState;
    // player.duration?.then(
    //       (value) => setState(() {
    //     _duration = value;
    //   }),
    // );

    // player.getCurrentPosition().then(
    //       (value) => setState(() {
    //         _position = value;
    //       }),
    //     );
    _initStreams();
  }

  @override
  void setState(VoidCallback fn) {
    // Subscriptions only can be closed asynchronously,
    // therefore events can occur after widget has been disposed.
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerStateChangeSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Slider(
        //   activeColor: AppColors.accentGreen,
        //   onChanged: (value) {
        //     final duration = player.duration;
        //     if (duration == null) {
        //       return;
        //     }
        //     final position = value * duration.inMilliseconds;
        //     player.seek(Duration(milliseconds: position.round()));
        //   },
        //   value: (player.duration != null &&
        //           player.position.inMilliseconds > 0 &&
        //           player.position.inMilliseconds <
        //               player.duration!.inMilliseconds)
        //       ? player.position.inMilliseconds / player.duration!.inMilliseconds
        //       : 0.0,
        // ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 54,
              width: 54,
              child: FilledButton(
                onPressed: widget.onPrevTap,
                style: FilledButton.styleFrom(
                  backgroundColor: widget.currentIndex < 1
                      ? HexColor("#F5F7F7")
                      : AppColors.dark15,
                  shape: const CircleBorder(),
                ),
                child: Icon(
                  Icons.skip_previous,
                  size: 30,
                  color: widget.currentIndex < 1
                      ? HexColor("#F5F7F7")
                      : const IconThemeData.fallback().color,
                ),
              ),
            ),
            const SizedBox(width: 32),
            SizedBox(
              height: 64,
              width: 64,
              child: FilledButton(
                onPressed: _isPlaying ? _pause : _play,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.dark,
                  shape: const CircleBorder(),
                ),
                child: _isPlaying
                    ? const Icon(
                        Icons.pause,
                        color: Colors.white,
                        size: 32,
                      )
                    : const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 32,
                      ),
              ),
            ),
            const SizedBox(width: 32),
            SizedBox(
              height: 54,
              width: 54,
              child: FilledButton(
                onPressed: widget.onNextTap,
                style: FilledButton.styleFrom(
                  backgroundColor: widget.currentIndex >= (widget.maxPlaces-1)
                      ? HexColor("#F5F7F7")
                      : AppColors.dark15,
                  shape: const CircleBorder(),
                ),
                child: Icon(
                  Icons.skip_next,
                  size: 30,
                  color: widget.currentIndex >= (widget.maxPlaces-1)
                      ? HexColor("#F5F7F7")
                      : const IconThemeData.fallback().color,
                ),
              ),
            ),
          ],
        ),
        Text(
        '$_positionText / $_durationText',
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }

  void _initStreams() {
    // player.
    // _durationSubscription = player.listen((duration) {
    //   setState(() => _duration = duration);
    // });

    // _positionSubscription = player.onPositionChanged.listen(
    //   (p) => setState(() => _position = p),
    // );

    // _playerCompleteSubscription = player.onPlayerComplete.listen((event) {
    //   setState(() {
    //     _playerState = PlayerState.stopped;
    //     _position = Duration.zero;
    //   });
    // });
    //
    // _playerStateChangeSubscription =
    //     player.onPlayerStateChanged.listen((state) {
    //   setState(() {
    //     _playerState = state;
    //   });
    // });
  }

  Future<void> _play() async {
    await player.play();
    setState(() => _playerState = PlayerState(true, ProcessingState.ready));
  }

  Future<void> _pause() async {
    await player.pause();
    setState(() => _playerState = PlayerState(false, ProcessingState.idle));
  }

  Future<void> _stop() async {
    await player.stop();
    setState(() {
      // _playerState = PlayerState.stopped;
      // _position = Duration.zero;
    });
  }
}
