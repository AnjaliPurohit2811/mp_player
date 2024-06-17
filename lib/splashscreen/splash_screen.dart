import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mp_player/introscreen/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () { Navigator.pushNamed(context, '/intro'); });
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  'asset/img/splash.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 250 , left: 15),
                child: Container(
                  height: 300,
                  width: 400,
                  child: Image.asset('asset/img/l.png'),
                ),
              )
            ],
          ),
        ));
  }
}
