
import 'package:flutter/material.dart';
import 'package:mp_player/accountscreen/account_screen.dart';
import 'package:mp_player/detailscreen/detail_screen.dart';
import 'package:mp_player/homescreen/home_screen.dart';
import 'package:mp_player/introscreen/intro_screen.dart';
import 'package:mp_player/provider/music_provider.dart';
import 'package:mp_player/queuescreen/queue_screen.dart';
import 'package:mp_player/splashscreen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SongProvider(),
        ),

      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/intro': (context) => IntroScreen(),
          '/home': (context) => HomeScreen(),
          '/ac': (context) => AccountScreen(),
          '/queue': (context) => QueueScreen(),
          '/detail': (context) => DetailScreen(),
        });

  }
}