import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';

class SettingToggleTile extends StatelessWidget {
  const SettingToggleTile({
    required this.title,
    required this.selected,
    required this.onChanged,
    this.onTap,
    this.onLongPress,
    this.topDivider = false,
    this.bottomDivider = true,
    this.roundTop = false,
    this.roundBottom = false,
    this.hideSplash = false,
    Key? key,
  }) :
        // assert((showArrow == false && selected != null) || (showArrow == true && selected == null)),
        super(key: key);

  final String title;
  final bool selected;
  final bool topDivider;
  final bool bottomDivider;
  final bool roundTop;
  final bool roundBottom;
  final bool hideSplash;
  final Function(bool value) onChanged;
  final Function()? onTap;
  final Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashFactory: hideSplash ? NoSplash.splashFactory : null,
      highlightColor: hideSplash ? Colors.transparent : null,
      onLongPress: onLongPress,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(roundTop ? borderRadius : 0.0),
        bottom: Radius.circular(roundBottom ? borderRadius : 0.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (topDivider) const Divider(thickness: 0.35, height: 0.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              20.0,
              14.0,
              16.0,
              14.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Switch.adaptive(
                          value: selected,
                          onChanged: onChanged,
                        ),
                        // if (selected == true)
                        //   Padding(
                        //     padding: const EdgeInsets.only(left: 8.0),
                        //     child: Icon(
                        //       CupertinoIcons.check_mark,
                        //       size: 18.0,
                        //       color: Theme.of(context).colorScheme.onSurface,
                        //       // color: Theme.of(context).colorScheme.secondary,
                        //     ),
                        //   ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (bottomDivider && !roundBottom)
            const Divider(thickness: 0.45, height: 0.0),
        ],
      ),
    );
  }
}
