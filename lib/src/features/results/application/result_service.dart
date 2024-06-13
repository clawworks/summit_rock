import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:summit_rock/src/features/authentication/data/auth_repository.dart';
import 'package:summit_rock/src/features/word_decoder/data/results_repository.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';

part 'result_service.g.dart';

@riverpod
List<String> combinedList(
  CombinedListRef ref, {
  required List<int> numbers,
  required Map<int, String> letterMap,
}) {
  List<String> numberStrings = numbers.map((e) => e.toString()).toList();
  for (final entry in letterMap.entries) {
    numberStrings.insert(entry.key, entry.value);
  }
  return numberStrings;
}

@riverpod
int getCrossAxisCount(GetCrossAxisCountRef ref, {int? length = 10}) {
  if (length == null) return 3;
  if (length < 4) return 5;
  if (length < 6) return 4;
  if (length < 10) return 3;
  return 2;
}

@riverpod
Stream<List<Result>> resultsListStream(ResultsListStreamRef ref) {
  final service = ref.watch(resultServiceProvider);
  return service.watchResults();
}

@riverpod
Stream<Result?> resultStream(ResultStreamRef ref, ResultId id) {
  final service = ref.watch(resultServiceProvider);
  return service.watchResult(id);
}

@riverpod
Future<Result?> result(ResultRef ref, ResultId id) {
  final service = ref.watch(resultServiceProvider);
  return service.fetchResult(id);
}

@riverpod
ResultService resultService(ResultServiceRef ref) {
  return ResultService(ref);
}

class ResultService {
  ResultService(this.ref);

  final Ref ref;

  AuthRepository get authRepository => ref.read(authRepositoryProvider);
  ResultsRepository get resultsRepository =>
      ref.read(resultsRepositoryProvider);

  Future<void> setResult(Result result) async {
    final user = authRepository.currentUser;
    if (user == null) {
      throw Exception('User cannot be null when setting Results');
    }
    await resultsRepository.setResult(user.uid, result);
  }

  Future<Result?> fetchResult(ResultId resultId) {
    final user = authRepository.currentUser;
    if (user == null) {
      throw Exception('User cannot be null when watching Results');
    }
    return resultsRepository.fetchResult(user.uid, resultId);
  }

  Stream<Result?> watchResult(ResultId resultId) {
    final user = authRepository.currentUser;
    if (user == null) {
      throw Exception('User cannot be null when watching Results');
    }
    return resultsRepository.watchResult(user.uid, resultId);
  }

  Stream<List<Result>> watchResults() {
    final user = authRepository.currentUser;
    if (user == null) {
      throw Exception('User cannot be null when watching Results');
    }
    return resultsRepository.watchResultsList(user.uid);
  }

  Future<void> deleteAllResults() async {
    final user = authRepository.currentUser;
    if (user == null) {
      throw Exception('User cannot be null when deleting Results');
    }
    return resultsRepository.deleteAllResults(user.uid);
  }
}
