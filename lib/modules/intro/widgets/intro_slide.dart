import 'package:flutter/material.dart';
import 'package:social_app/utils/extensions/extensions.dart';
import 'package:social_app/values/values.dart';

class IntroSlideWidget extends StatelessWidget {
  const IntroSlideWidget({
    required this.imagePath,
    required this.header,
    required this.title,
    super.key,
  });

  final String imagePath;
  final String header;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        // Space 70px
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 70,
        ),

        // Welcome text
        Text(
          header,
          style: const TextStyle(
            color: appFontPrimaryColorLight,
            fontSize: 20,
          ),
        ),

        // App title
        Hero(
          tag: 'app_title',
          child: Material(
            type: MaterialType.transparency,
            child: Text(
              title,
              style: const TextStyle(
                color: appFontPrimaryColorLight,
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),

        // Space 18 px
        18.v,

        // Image
        Image.asset(
          imagePath,
        ),
      ],
    );
  }
}
