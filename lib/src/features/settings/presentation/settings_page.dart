import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/features/settings/presentation/setting_tile.dart';
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
              _DeleteAll(),
            ],
          ),
        ),
      ),
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
