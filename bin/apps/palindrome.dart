bool isPalindrom(String words) {
  return _isPalindromeRecursive(words, 0);
}

bool _isPalindromeRecursive(String value, int i) {
  value = value.toLowerCase();
  if (i < value.length / 2) {
    int fristIndex = i;
    int lastIndex = value.length - i - 1;

    if (value[fristIndex] != value[lastIndex]) {
      return false;
    } else {
      return _isPalindromeRecursive(value, i + 1);
    }
  } else {
    return true;
  }
}
