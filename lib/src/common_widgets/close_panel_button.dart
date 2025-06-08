import 'package:flutter/material.dart';

class ClosePanelButton extends StatelessWidget {
  const ClosePanelButton({required this.onTap, super.key});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        width: 62,
        height: 62,
        child: Center(
          child: SizedBox(
            width: 30,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              // backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
              child: Icon(
                Icons.close_rounded,
                color: Theme.of(context).unselectedWidgetColor,
                // color: Theme.of(context).colorScheme.onSurfaceVariant,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
