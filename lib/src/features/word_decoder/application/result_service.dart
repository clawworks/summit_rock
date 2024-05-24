import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:summit_rock/src/features/authentication/data/auth_repository.dart';
import 'package:summit_rock/src/features/word_decoder/data/results_repository.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';

part 'result_service.g.dart';

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
}
