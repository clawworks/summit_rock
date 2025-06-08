import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common_widgets/close_panel_button.dart';

Future<T?> showDynamicHeightModal<T>({
  required BuildContext context,
  required List<Widget> children,
  bool showSnackBarResult = true,
  bool showCloseIcon = true,
  bool isDismissible = false,
  bool isScrollControlled = true,
  bool enableDrag = true,
  double barrierOpacity = 0.4,
  double bottomPadding = 150,
  double topRadius = 10,
  String? title,
}) async {
  T? result;
  result = await showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: !showCloseIcon ? 12.0 : 0.0,
                      left: 16.0,
                    ),
                    child: Text(
                      title ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (showCloseIcon)
                    ClosePanelButton(onTap: () {
                      context.pop();
                    }),
                ],
              ),
              for (Widget widget in children) widget,
              SizedBox(height: bottomPadding),
            ],
          ),
        ),
      );
    },
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(topRadius)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    barrierColor: Colors.black.withOpacity(barrierOpacity),
    isScrollControlled: isScrollControlled,
    enableDrag: enableDrag,
    useRootNavigator: false,
    isDismissible: isDismissible,
  );

  return result;
}
