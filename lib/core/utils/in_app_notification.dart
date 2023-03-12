import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:omnipro_test/core/utils/app_colors.dart';

class InAppNotification {
  static void show({
    BuildContext? context,
    int duration = 3,
    String? title,
    required String message,
    required NotificationType type,
  }) {
    if (context != null) {
      Flushbar(
        title: title,
        message: message,
        duration: Duration(seconds: duration),
        icon: type == NotificationType.success
            ? Icon(
                Icons.check,
                color: AppColors.contrast,
              )
            : Icon(
                Icons.error,
                color: AppColors.contrast,
              ),
        backgroundColor: type == NotificationType.success
            ? AppColors.success
            : AppColors.error,
      ).show(context);
    }
  }
}

enum NotificationType {
  success,
  error,
}
