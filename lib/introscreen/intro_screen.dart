import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mp_player/homescreen/home_screen.dart';
import 'package:mp_player/utils/music.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.only(top: 350, left: 30),
                child: Text(
                  "Discover the Cuteness of\n         Musical Magic",
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              InkWell(onTap: () {
                Navigator.of(context)
                    .pushNamed('/home',);
              },
                child: Padding(
                  padding: const EdgeInsets.only(top: 650 , left: 90),
                  child: Container(
                    height: 60,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Center(
                      child: Text('Getting Started' , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
