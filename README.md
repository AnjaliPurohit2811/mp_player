# mp_player

### 1. Set Up Your Flutter Environment
If you haven't already, set up Flutter on your machine:

- Download and install Flutter from [flutter.dev](https://flutter.dev/docs/get-started/install).
- Ensure you have an editor like Visual Studio Code or Android Studio set up with Flutter and Dart plugins.

### 2. Create a New Flutter Project
Open your terminal or command prompt and run:

```bash
flutter create audio_app
cd audio_app
```

### 3. Add Necessary Dependencies
You will need a package to handle audio playback. One of the most popular packages for this purpose is `assets_audio_player`. Add it to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  provider: ^6.1.2
  assets_audio_player: ^3.1.1
  salomon_bottom_bar: ^3.3.2
```

Run `flutter pub get` to install the new dependencies.

### 4. Implementing the User Interface

Open the `lib/main.dart` file and set up a basic UI. For simplicity, we will create a single screen with play, pause, and stop buttons

```dart
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AudioProvider(),
      child: MaterialApp(
        title: 'Audio App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AudioPlayerScreen(),
      ),
    );
  }
}

class AudioPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Audio App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => audioProvider.play(),
              child: Text('Play'),
            ),
            ElevatedButton(
              onPressed: () => audioProvider.pause(),
              child: Text('Pause'),
            ),
            ElevatedButton(
              onPressed: () => audioProvider.stop(),
              child: Text('Stop'),
            ),
          ],
        ),
      ),
    );
  }
}

class AudioProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void play() async {
    try {
      await _audioPlayer.setUrl('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');
      _audioPlayer.play();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  void pause() {
    _audioPlayer.pause();
  }

  void stop() {
    _audioPlayer.stop();
  }
}
```

### Example for Adding a Playlist

You can enhance the `AudioProvider` to manage a playlist:

```dart
class AudioProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<String> _playlist = [
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
  ];
  int _currentIndex = 0;

  void play() async {
    try {
      await _audioPlayer.setUrl(_playlist[_currentIndex]);
      _audioPlayer.play();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  void pause() {
    _audioPlayer.pause();
  }

  void stop() {
    _audioPlayer.stop();
  }

  void next() {
    if (_currentIndex < _playlist.length - 1) {
      _currentIndex++;
      play();
    }
  }

  void previous() {
    if (_currentIndex > 0) {
      _currentIndex--;
      play();
    }
  }
}
```

Update the `AudioPlayerScreen` to include buttons for next and previous:

```dart
ElevatedButton(
  onPressed: () => audioProvider.previous(),
  child: Text('Previous'),
),
ElevatedButton(
  onPressed: () => audioProvider.next(),
  child: Text('Next'),
),
```

### ScreenShort

<p align='center'>
  <img src='https://github.com/AnjaliPurohit2811/mp_player/assets/143180602/c5a879fd-9ea6-4791-96c9-8ae652892d13' width=240>

  <img src='https://github.com/AnjaliPurohit2811/mp_player/assets/143180602/b8850601-af38-43cf-a50d-9e059fcf0c46' width=240>

  <img src='https://github.com/AnjaliPurohit2811/mp_player/assets/143180602/27bf1a93-04e8-4497-8d06-0ee6f902da9f' width=240>

  <img src='https://github.com/AnjaliPurohit2811/mp_player/assets/143180602/c8167d6b-8837-46ab-81d2-84235801d32f' width=240>

  <img src='https://github.com/AnjaliPurohit2811/mp_player/assets/143180602/c0051234-671f-4e27-a447-f99a8fb25afe' width=240>

  <img src='https://github.com/AnjaliPurohit2811/mp_player/assets/143180602/26c2a4c1-d797-4531-bd8c-d1cb794720c8' width=240>

</p>

### Video


https://github.com/AnjaliPurohit2811/mp_player/assets/143180602/78c80b12-236c-4035-ad84-a2f6b86b7df3

