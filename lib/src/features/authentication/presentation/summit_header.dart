import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

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
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 60.0,
            vertical: 20.0,
          ),
          // child: Image.asset(
          //   imageName,
          //   height: 30.0,
          // ),
          //       VectorGraphic(
          //       loader: AssetBytesLoader('assets/icon_heart_blue.svg'),
          // colorFilter: ColorFilter.mode(Color(0xFF70ABE6), BlendMode.srcIn),
          // width: 300,
          // height: 300,
          // ),
          child: VectorGraphic(
            loader: AssetBytesLoader('assets/SummitRock-01.svg'),
            colorFilter: ColorFilter.mode(Color(0xFF70ABE6), BlendMode.srcIn),
            width: 60,
            height: 60,
          ),
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
