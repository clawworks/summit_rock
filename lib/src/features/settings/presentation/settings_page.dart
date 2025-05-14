import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/features/settings/domain/summit_rock_year.dart';
import 'package:summit_rock/src/features/settings/presentation/setting_tile.dart';
import 'package:summit_rock/src/features/settings/presentation/setting_toggle_tile.dart';
import 'package:summit_rock/src/features/settings/presentation/settings_card.dart';
import 'package:summit_rock/src/features/settings/presentation/settings_controller.dart';
import 'package:summit_rock/src/routing/app_router.dart';
import 'package:summit_rock/src/utilities/show_custom_dialog.dart';

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
              _YearFilter(),
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
          value: ref.watch(yearSelectionProvider).toString(),
          showArrow: true,
          roundTop: true,
          roundBottom: true,
          bottomDivider: false,
          onTap: () {
            context.goNamed(AppRoute.yearSelection);
          },
        ),
      ],
    );
  }
}

class _YearFilter extends ConsumerWidget {
  const _YearFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(filterByYearProvider);
    return SettingsCard(
      children: [
        SettingToggleTile(
          title: 'Filter History by Year',
          selected: selected,
          bottomDivider: false,
          roundTop: true,
          roundBottom: true,
          onChanged: (value) {
            ref.read(filterByYearProvider.notifier).set(value);
          },
          onTap: () {
            ref.read(filterByYearProvider.notifier).set(!selected);
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
          roundTop: true,
          roundBottom: true,
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
