import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/modules/intro/intro_screen.dart';
import 'package:social_app/modules/intro/providers/intro_slider_provider.dart';
import 'package:social_app/values/values.dart';

class SlideIndicatorsWidget extends ConsumerWidget {
  const SlideIndicatorsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSliderIndicatorProvider =
        ref.watch(introSliderCurrentIndexProvider);

    return SizedBox(
      height: 12,
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (itemBuilderCtx, index) {
          return AnimatedContainer(
            curve: Curves.easeInOutExpo,
            duration: const Duration(milliseconds: 500),
            key: ValueKey('indicator_${index + 1}'),
            height: 12,
            width: 12,
            decoration: BoxDecoration(
              color: currentSliderIndicatorProvider == index
                  ? appFontPrimaryColorLight
                  : Colors.transparent,
              border: Border.all(
                color: appFontPrimaryColorLight,
              ),
              shape: BoxShape.circle,
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: sliderData.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }
}
