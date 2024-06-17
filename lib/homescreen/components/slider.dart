import 'package:flutter/material.dart';


import '../../provider/music_provider.dart';

SliderTheme slider(BuildContext context, SongProvider songProvider) {
  return SliderTheme(
    data: SliderTheme.of(context).copyWith(
      trackHeight: 2,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
    ),
    child: Slider(
      activeColor: Colors.black,
      value: songProvider.sliderValue,
      max: songProvider.maxDuration > 0
          ? songProvider.maxDuration
          : 1.0,
      onChanged: (value) {
        if (songProvider.maxDuration > 0) {
          songProvider.seek(value);
        }
      },
    ),
  );
}