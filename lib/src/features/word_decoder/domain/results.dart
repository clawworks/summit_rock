import 'combination.dart';

class Results {
  Results({
    required this.uuid,
    required this.outsideCombinations,
    required this.insideCombinations,
  });

  String uuid;
  List<Combination> outsideCombinations;
  List<Combination> insideCombinations;
}
