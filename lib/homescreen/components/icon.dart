import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../provider/music_provider.dart';

Row icons(SongProvider songProvider) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Icon(
        Icons.loop,
        color: Colors.black,
        size: 27,
      ),
      IconButton(
        onPressed: () {
          songProvider.previousAudio();
        },
        icon: const Icon(
          Icons.skip_previous_rounded,
          color: Colors.black,
          size: 40,
        ),
      ),
      IconButton(
        onPressed: () {
          songProvider.togglePlayPause();
        },
        icon: Icon(
          songProvider.isPlaying
              ? CupertinoIcons.pause_circle_fill
              : CupertinoIcons.play_circle_fill,
          color: Colors.black,
          size: 85,
        ),
      ),
      IconButton(
        onPressed: () {
          songProvider.nextAudio();
        },
        icon: const Icon(
          Icons.skip_next_rounded,
          color: Colors.black,
          size: 40,
        ),
      ),
      const Icon(
        Icons.queue_music,
        color: Colors.black,
        size: 30,
      ),
    ],
  );
}