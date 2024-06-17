import 'package:flutter/material.dart';
import '../../provider/music_provider.dart';


Padding sliderText(SongProvider songProvider) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text('${songProvider.sliderValue ~/ 60}:',style: const TextStyle(color: Colors.black),),
            Text((songProvider.sliderValue.toInt() % 60)
                .toString()
                .padLeft(2, '0'),style: const TextStyle(color: Colors.black),),
          ],
        ),
        Row(
          children: [
            Text('${songProvider.maxDuration ~/ 60}:',style: const TextStyle(color: Colors.black),),
            Text((songProvider.maxDuration.toInt() % 60).toString()..padRight(2, '0'),style: const TextStyle(color: Colors.black),),
          ],
        ),
      ],
    ),
  );
}