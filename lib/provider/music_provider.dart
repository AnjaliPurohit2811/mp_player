import 'dart:developer';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:mp_player/utils/music.dart';


class SongProvider with ChangeNotifier {
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  double _sliderValue = 0.0;
  bool isFavorited = true;
  double _maxDuration = 0.0;
  bool _isPlaying = false;
  int songIndex = 0;
  double get sliderValue => _sliderValue;
  bool get isPlaying => _isPlaying;
  double get maxDuration => _maxDuration;

  void changeIndex(int index) {
    songIndex = index;
    notifyListeners();
  }

  void openAudio() async {
    await _assetsAudioPlayer.open(
      Audio(musicList[songIndex]['music']),
      autoStart: true,
      showNotification: true,
    );
    _isPlaying = true;
    notifyListeners();

    log(musicList[songIndex]['music']);

    _assetsAudioPlayer.currentPosition.listen((Duration position) {
      if (_maxDuration != 0.0) {
        _sliderValue = position.inSeconds.toDouble();
        notifyListeners();
      }
    });
    _assetsAudioPlayer.current.listen((Playing? playing) {
      if (playing != null) {
        final duration = playing.audio.duration;
        _maxDuration = duration.inSeconds.toDouble();
        notifyListeners();
      }
    });
  }
  void play() {
    _assetsAudioPlayer.play();
    _isPlaying = true;
    notifyListeners();
  }

  void pause() {
    _assetsAudioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void previousAudio() {
    if (songIndex > 0) {
      songIndex--;
    } else {
      songIndex = musicList.length - 1;
    }
    openAudio();
  }

  void togglePlayPause() {
    if (_isPlaying) {
      pause();
    } else {
      play();
    }
  }

  void nextAudio() {
    if (songIndex < musicList.length - 1) {
      songIndex++;
    } else {
      songIndex = 0;
    }
    openAudio();
  }

  void seek(double seconds) {
    _assetsAudioPlayer.seek(Duration(seconds: seconds.toInt()));
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  void toggleFavorite() {
    isFavorited = !isFavorited;
  }
  void ischangeIndex(int index) {
    songIndex = index;
    notifyListeners();
  }

  void isopenAudio() async {
    await _assetsAudioPlayer.open(
      Audio(musicList[songIndex]['music']),
      autoStart: true,
      showNotification: true,
    );
    _isPlaying = true;
    notifyListeners();
  }
}