enum DecodeMethod {
  forward,
  reverse;

  @override
  String toString() {
    switch (this) {
      case DecodeMethod.forward:
        return 'Forward';
      case DecodeMethod.reverse:
        return 'Reverse';
    }
  }
}
