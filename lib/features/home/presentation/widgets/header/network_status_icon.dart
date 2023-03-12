import 'package:flutter/material.dart';
import 'package:omnipro_test/core/utils/app_colors.dart';

class NetworkStatusIcon extends StatelessWidget {
  final bool networkConnection;
  const NetworkStatusIcon({
    super.key,
    required this.networkConnection,
  });

  @override
  Widget build(BuildContext context) => Icon(
        (networkConnection) ? Icons.wifi : Icons.wifi_off_sharp,
        color: (networkConnection) ? AppColors.success : AppColors.error,
      );
}
