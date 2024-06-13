import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:summit_rock/src/features/results/application/result_service.dart';

part 'settings_controller.g.dart';

@riverpod
class SettingsController extends _$SettingsController {
  @override
  FutureOr<void> build() async {
    // Nothing to do
  }

  Future<void> deleteAllHistory() async {
    ref.read(resultServiceProvider).deleteAllResults();
  }
}
