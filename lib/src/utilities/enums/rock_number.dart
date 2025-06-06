enum RockNumber {
  miniOne,
  miniTwo,
  miniThree,
  bigOne,
  bigTwo,
  bigThree;

  @override
  String toString() {
    switch (this) {
      case RockNumber.miniOne:
        return 'Mini Rock One';
      case RockNumber.miniTwo:
        return 'Mini Rock Two';
      case RockNumber.miniThree:
        return 'Mini Rock Three';
      case RockNumber.bigOne:
        return 'Big Rock One';
      case RockNumber.bigTwo:
        return 'Big Rock Two';
      case RockNumber.bigThree:
        return 'Big Rock Three';
    }
  }
}
