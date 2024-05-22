import 'package:flutter/material.dart';

class SummitHeader extends StatelessWidget {
  const SummitHeader({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool darkMode = brightness == Brightness.dark;
    String imageName = darkMode
        ? 'assets/images/ScoringTechLogoLight.png'
        : 'assets/images/ScoringTechLogoDark.png';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 60.0,
            vertical: 20.0,
          ),
          // child: Image.asset(
          //   imageName,
          //   height: 30.0,
          // ),
        ),
        Text(
          'Summit Rock',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
