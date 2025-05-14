import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/features/settings/presentation/setting_tile.dart';
import 'package:summit_rock/src/features/settings/presentation/settings_card.dart';
import 'package:summit_rock/src/features/settings/presentation/settings_controller.dart';
import 'package:summit_rock/src/routing/app_router.dart';
import 'package:summit_rock/src/utilities/show_custom_dialog.dart';

enum SummitRockYear {
  twentyFour,
  twentyFive;

  @override
  String toString() {
    switch (this) {
      case twentyFour:
        return '2024';
      case twentyFive:
        return '2025';
    }
  }
}

final pYearSelection =
    NotifierProvider.autoDispose<YearSelection, SummitRockYear>(() {
  return YearSelection();
});

class YearSelection extends AutoDisposeNotifier<SummitRockYear> {
  @override
  SummitRockYear build() {
    return SummitRockYear.twentyFour;
  }

  void set(SummitRockYear year) {
    state = year;
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              _YearSelection(),
              _DeleteAll(),
            ],
          ),
        ),
      ),
    );
  }
}

class _YearSelection extends ConsumerWidget {
  const _YearSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SettingsCard(
      children: [
        SettingTile(
          title: 'Summit Rock Year',
          value: ref.watch(pYearSelection).toString(),
          showArrow: true,
          bottomDivider: false,
          onTap: () {
            context.goNamed(AppRoute.yearSelection);
          },
        ),
      ],
    );
  }
}

class _DeleteAll extends ConsumerWidget {
  const _DeleteAll({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SettingsCard(
      children: [
        SettingTile(
          title: 'Delete ALL History',
          onTap: () async {
            final bool? delete = await showCustomDialog(
              context: context,
              title: 'Delete ALL History?',
              message: 'This action cannot be undone!',
            );
            if (delete == true) {
              await ref
                  .read(settingsControllerProvider.notifier)
                  .deleteAllHistory();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Deleted All Results'),
                  ),
                );
                context.goNamed(AppRoute.home);
              }
            }
          },
        ),
      ],
    );
  }
}
