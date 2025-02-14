extension NumberFormatExtension on int {
  String get counts {
    if (this > 100000) {
      return '${(this / 100000).toStringAsFixed(2)}M';
    } else if (this > 1000) {
      return '${(this / 1000).toStringAsFixed(2)}K';
    } else {
      return toString();
    }
  }
}
