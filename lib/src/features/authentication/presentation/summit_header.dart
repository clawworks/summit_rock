import 'package:flutter/material.dart';
import 'package:summit_rock/src/utilities/summit_icons.dart';

class SummitHeader extends StatelessWidget {
  const SummitHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 60.0,
            vertical: 20.0,
          ),
          child: Icon(
            Summit.summitrocklogo,
            size: 180.0,
          ),
        ),
        // Text(
        //   'Summit Rock',
        //   style: Theme.of(context).textTheme.displayMedium?.copyWith(
        //         fontWeight: FontWeight.w700,
        //       ),
        //   textAlign: TextAlign.center,
        // ),
      ],
    );
  }
}
