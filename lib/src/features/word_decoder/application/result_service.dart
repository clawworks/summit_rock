import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:summit_rock/src/features/authentication/data/auth_repository.dart';
import 'package:summit_rock/src/features/word_decoder/data/results_repository.dart';
import 'package:summit_rock/src/features/word_decoder/domain/result.dart';

part 'result_service.g.dart';

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
}
