import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:social_app/modules/intro/intro_screen.dart';
import 'package:social_app/modules/widgets/widgets.dart';
import 'package:social_app/utils/extensions/navigation_extension.dart';
import 'package:social_app/values/values.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// To redirect to app after some delay.
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(
      splashTimer,
      () {
        context.pushReplacement(
          const IntroScreen(),
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColorLight,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background square
          const Positioned(
            top: -124,
            left: -250,
            child: BackgroundSquareWidget(
              angle: pi / 4,
              size: Size(
                470,
                680,
              ),
            ),
          ),

          // Background square
          const Positioned(
            bottom: -124,
            right: -250,
            child: BackgroundSquareWidget(
              angle: -(pi * 3) / 4,
              size: Size(
                470,
                680,
              ),
            ),
          ),

          // Title
          Center(
            child: Hero(
              tag: 'app_title',
              child: Text(
                appTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 39,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
