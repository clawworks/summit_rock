import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    required this.title,
    this.value,
    this.onTap,
    this.onLongPress,
    this.selected,
    this.topDivider = false,
    this.bottomDivider = true,
    this.roundTop = false,
    this.roundBottom = false,
    this.showArrow = false,
    this.hideSplash = false,
    Key? key,
  })  : assert(value == null || selected == null),
        // assert((showArrow == false && selected != null) || (showArrow == true && selected == null)),
        super(key: key);

  final String title;
  final String? value;
  final bool? selected;
  final bool topDivider;
  final bool bottomDivider;
  final bool roundTop;
  final bool roundBottom;
  final bool showArrow;
  final bool hideSplash;
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
                        if (value != null)
                          Expanded(
                            child: Text(
                              value ?? '',
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                          ),
                        if (selected == true)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(
                              CupertinoIcons.check_mark,
                              size: 18.0,
                              color: Theme.of(context).colorScheme.onSurface,
                              // color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        if (showArrow)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(
                              CupertinoIcons.chevron_right,
                              size: 18.0,
                              color: Theme.of(context).colorScheme.onSurface,
                              // color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
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
