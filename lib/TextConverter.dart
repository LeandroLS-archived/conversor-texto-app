class TextConverter {
  static textToUpper(String str) {
    return str.toUpperCase();
  }

  static textToLower(String str) {
    return str.toLowerCase();
  }

  static textReversed(String str) {
    return str.split('').reversed.join();
  }
}