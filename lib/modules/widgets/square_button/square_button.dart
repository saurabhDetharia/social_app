import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_app/modules/widgets/square_button/providers/square_button_provider.dart';
import 'package:social_app/values/app_colors.dart';

class SquareButtonWidget extends ConsumerWidget {
  const SquareButtonWidget({
    required this.size,
    required this.borderRadius,
    required this.child,
    required this.onTap,
    this.showBorder = false,
    super.key,
  });

  final Size size;
  final bool showBorder;
  final BorderRadius borderRadius;
  final Widget child;
  final Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPressed = ref.watch(buttonTapProvider);

    return GestureDetector(
      onTapDown: (details) {
        ref.read(buttonTapProvider.notifier).state = true;
      },
      onTap: () => onTap(),
      onTapUp: (details) {
        ref.read(buttonTapProvider.notifier).state = false;
      },
      onTapCancel: () {
        ref.read(buttonTapProvider.notifier).state = false;
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 150),
        curve: Curves.linearToEaseOut,
        scale: isPressed ? 0.9 : 1,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (showBorder) ...[
              // Square button
              Transform.rotate(
                angle: pi / 4,
                child: Container(
                  width: size.width + 12,
                  height: size.height + 12,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    border: Border.all(
                      color: appPrimaryColorLight,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ],

            // Square button
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: appPrimaryColorLight,
                ),
              ),
            ),

            // Child
            child,
          ],
        ),
      ),
    );
  }
}
