extension StringExtension on String {
  String capitalizeFirst() {
    if (isEmpty) {
      return this;
    }
    final firstChar = this[0].toUpperCase();
    final remainingChars = substring(1).toLowerCase();
    return '$firstChar$remainingChars';
  }
}
