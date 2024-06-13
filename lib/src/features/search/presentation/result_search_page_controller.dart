import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'result_search_page_controller.g.dart';

@riverpod
class SearchPattern extends _$SearchPattern {
  @override
  String build() {
    return '';
  }

  void setPattern(String value) {
    state = value;
  }
}
