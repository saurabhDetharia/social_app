import 'package:flutter/material.dart';

extension SizedBoxExtension on int {
  /// To provide vertical space
  Widget get v => SizedBox(
        height: toDouble(),
      );

  /// To provide horizontal space
  Widget get h => SizedBox(
        width: toDouble(),
      );
}
