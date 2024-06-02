import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
