import 'dart:math';

import 'package:flutter/material.dart';
import 'package:social_app/modules/widgets/widgets.dart';

class HomeScreenBackgroundWidget extends StatelessWidget {
  const HomeScreenBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        // Background square
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          top: -50,
          left: -435,
          child: Hero(
            tag: 'backgroundSquare',
            child: BackgroundSquareWidget(
              angle: pi / 4,
              size: Size(
                470,
                680,
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          top: 20,
          left: -450,
          child: BackgroundSquareWidget(
            angle: pi / 4,
            size: Size(
              470,
              680,
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 500),
          top: 100,
          left: -470,
          child: BackgroundSquareWidget(
            angle: pi / 4,
            size: Size(
              470,
              680,
            ),
          ),
        ),
      ],
    );
  }
}
