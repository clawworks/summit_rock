import 'package:flutter/material.dart';
import 'package:summit_rock/src/features/settings/presentation/setting_tile.dart';
import 'package:summit_rock/src/features/settings/presentation/settings_card.dart';
import 'package:summit_rock/src/utilities/show_custom_dialog.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SettingsCard(
                children: [
                  SettingTile(
                    title: 'Delete ALL History',
                    onTap: () async {
                      final bool? delete = await showCustomDialog(
                        context: context,
                        title: 'Delete ALL History?',
                        message: 'This action cannot be undone!',
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
