import 'package:hooks_riverpod/hooks_riverpod.dart';

final pSignInController =
    NotifierProvider.autoDispose<SignInController, void>(() {
  return SignInController();
});

class SignInController extends AutoDisposeNotifier<void> {
  @override
  void build() {
    // Nothing to do
  }
}
