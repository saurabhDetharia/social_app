import 'package:flutter/cupertino.dart';
import 'package:social_app/values/values.dart';

class BackgroundSquareWidget extends StatelessWidget {
  const BackgroundSquareWidget({
    required this.size,
    this.angle = 0,
    super.key,
  });

  final Size size;
  final double angle;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Opacity(
        opacity: 0.4,
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: radius152,
            border: Border.all(
              width: 1,
              color: appSecondaryColorLight,
              strokeAlign: -1,
            ),
            gradient: const LinearGradient(
              colors: [
                appGradientPrimaryColorLight,
                appGradientSecondaryColorLight,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
