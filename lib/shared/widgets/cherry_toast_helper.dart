import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';

enum ToastType { success, error, info, warning }

void showCherryToast({
  required BuildContext context,
  required String message,
  ToastType type = ToastType.success,
  bool autoDismiss = true,
  Duration animationDuration = const Duration(milliseconds: 1000),
  AnimationType animationType = AnimationType.fromRight,
}) {
  final toast = _getToast(
    message: message,
    type: type,
    autoDismiss: autoDismiss,
    animationDuration: animationDuration,
    animationType: animationType,
  );

  toast.show(context);
}

CherryToast _getToast({
  required String message,
  required ToastType type,
  required bool autoDismiss,
  required Duration animationDuration,
  required AnimationType animationType,
}) {
  switch (type) {
    case ToastType.success:
      return CherryToast.success(
        title: Text(message, style: const TextStyle(color: Colors.black)),
        animationType: animationType,
        animationDuration: animationDuration,
        autoDismiss: autoDismiss,
      );

    case ToastType.error:
      return CherryToast.error(
        description: Text(message, style: const TextStyle(color: Colors.black)),
        animationType: animationType,
        animationDuration: animationDuration,
        autoDismiss: autoDismiss,
      );

    case ToastType.info:
      return CherryToast.info(
        description: Text(message, style: const TextStyle(color: Colors.black)),
        animationType: animationType,
        animationDuration: animationDuration,
        autoDismiss: autoDismiss,
      );

    case ToastType.warning:
      return CherryToast.warning(
        description: Text(message, style: const TextStyle(color: Colors.black)),
        animationType: animationType,
        animationDuration: animationDuration,
        autoDismiss: autoDismiss,
      );

    default:
      return CherryToast.success(
        title: Text(message, style: const TextStyle(color: Colors.black)),
        animationType: animationType,
        animationDuration: animationDuration,
        autoDismiss: autoDismiss,
      );
  }
}
