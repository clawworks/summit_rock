import 'package:flutter/material.dart';

import '../common_widgets/custom_dialog.dart';
import '../routing/app_router.dart';

/// Prefer using [showCustomDialog] with BuildContext
/// Only use this in controllers or elsewhere where no context is available
///
Future<bool?> showCustomDialogNoContext({
  required String title,
  String? message,
  Widget? body,
  bool showCancel = true,
  String? cancelText,
  String? confirmText,
  Color? confirmColor,
  Color? cancelColor,
  EdgeInsets? padding,
}) async {
  BuildContext? context = rootNavigatorKey.currentContext;
  if (context != null) {
    return showCustomDialog(
      context: context,
      title: title,
      message: message,
      body: body,
      padding: padding,
      showCancel: showCancel,
      cancelText: cancelText,
      confirmText: confirmText,
      confirmColor: confirmColor,
      cancelColor: cancelColor,
    );
  }
  return null;
}

/// Prefer this method over [showCustomDialogNoContext]
/// Shows a [_CustomDialog] styled consistently
///
/// Returns a `bool` of Confirm == true or not
Future<bool?> showCustomDialog({
  required BuildContext context,
  required String title,
  String? message,
  Widget? body,
  bool showCancel = true,
  String? cancelText,
  String? confirmText,
  Color? confirmColor,
  Color? cancelColor,
  EdgeInsets? padding,
}) async {
  bool? confirmed = await showDialog(
    context: context,
    builder: (context) => CustomDialog(
      title: title,
      message: message,
      body: body,
      padding: padding,
      showCancel: showCancel,
      cancelText: cancelText,
      confirmText: confirmText,
      confirmColor: confirmColor,
      cancelColor: cancelColor,
    ),
  );
  return confirmed;
}
