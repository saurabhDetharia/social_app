import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/gen/assets.gen.dart';
import 'package:social_app/models/intro_slider/intro_slider_model.dart';
import 'package:social_app/modules/dashboard/dashboard_screen.dart';
import 'package:social_app/modules/intro/providers/intro_slider_provider.dart';
import 'package:social_app/modules/intro/widgets/intro_slide.dart';
import 'package:social_app/modules/intro/widgets/slide_indicators.dart';
import 'package:social_app/modules/widgets/widgets.dart';
import 'package:social_app/utils/extensions/extensions.dart';
import 'package:social_app/values/values.dart';

final sliderData = [
  IntroSliderModel(
    path: Assets.images.slider1.path,
    header: 'Welcome to',
    title: 'social app',
  ),
  IntroSliderModel(
    path: Assets.images.slider2.path,
    header: 'Welcome to',
    title: 'social app 2',
  ),
  IntroSliderModel(
    path: Assets.images.slider3.path,
    header: 'Welcome to',
    title: 'social app 3',
  ),
];

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Background square
          const AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            top: -124,
            left: -250,
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

          // Slider
          SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 500,
                  child: Consumer(
                    builder: (
                      BuildContext context,
                      WidgetRef ref,
                      Widget? child,
                    ) {
                      return PageView.builder(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (newPageIndex) {
                          ref
                              .read(introSliderCurrentIndexProvider.notifier)
                              .state = newPageIndex;
                        },
                        itemBuilder: (itemBuilderCtx, index) {
                          final slideData = sliderData[index];

                          return IntroSlideWidget(
                            title: slideData.title,
                            header: slideData.header,
                            imagePath: slideData.path,
                            key: ObjectKey(slideData),
                          );
                        },
                        itemCount: sliderData.length,
                      );
                    },
                  ),
                ),

                // Space 10 px
                10.v,

                // Current slider indicators
                const SlideIndicatorsWidget(),
              ],
            ),
          ),

          // Next button
          Positioned(
            bottom: -45,
            right: -58,
            child: SquareButtonWidget(
              showBorder: true,
              size: const Size(206, 212),
              borderRadius: radius79,
              child: Text(
                nextButton,
                style: const TextStyle(
                  color: appFontSecondaryColorLight,
                  fontSize: 24,
                ),
              ),
              onTap: () {
                if (_pageController.page != null) {
                  if (_pageController.page! < 2) {
                    _pageController.animateToPage(
                      ((_pageController.page ?? 0) + 1).toInt(),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOutExpo,
                    );
                  } else {
                    context.pushAndRemoveUntil(
                      const DashboardScreen(),
                      (_) => false,
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
