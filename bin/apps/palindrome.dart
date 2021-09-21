bool isPalindrom(String words) {
  return _isPalindromeRecursive(words, 0);
}

bool _isPalindromeRecursive(String value, int i) {
  value = value.toLowerCase();
  if (i < value.length / 2) {
    int indexAwal = i;
    int indexAkhir = value.length - i - 1;

    if (value[indexAwal] != value[indexAkhir]) {
      return false;
    } else {
      return _isPalindromeRecursive(value, i + 1);
    }
  } else {
    return true;
  }
}
