class Palindrome {
  static RegExp regexp = RegExp(r'[\da-zA-Z]');

  static bool isPalindrome(String text) {
    final mid = text.length ~/ 2;
    int first = 0;
    int last = text.length - 1;

    while (first < mid) {
      while (!text[first].contains(regexp)) first++;
      while (!text[last].contains(regexp)) last--;

      if (text[first].toLowerCase() != text[last].toLowerCase()) {
        return false;
      }

      first++;
      last--;
    }

    return true;
  }
}
