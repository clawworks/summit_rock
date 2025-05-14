import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:summit_rock/src/features/settings/presentation/setting_tile.dart';
import 'package:summit_rock/src/features/settings/presentation/settings_card.dart';
import 'package:summit_rock/src/features/settings/presentation/settings_page.dart'
    show SummitRockYear, pYearSelection;

class YearSelectionPage extends StatelessWidget {
  const YearSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Year'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              _YearSelection(),
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
          title: '2024',
          selected: ref.watch(pYearSelection) == SummitRockYear.twentyFour,
          onTap: () {
            ref.read(pYearSelection.notifier).set(SummitRockYear.twentyFour);
          },
        ),
        SettingTile(
          title: '2025',
          selected: ref.watch(pYearSelection) == SummitRockYear.twentyFive,
          bottomDivider: false,
          onTap: () {
            ref.read(pYearSelection.notifier).set(SummitRockYear.twentyFive);
          },
        ),
      ],
    );
  }
}
