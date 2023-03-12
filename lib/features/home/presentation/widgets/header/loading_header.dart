import 'package:flutter/material.dart';
import 'package:omnipro_test/core/utils/app_colors.dart';
import 'package:omnipro_test/core/utils/screen_size.dart';

class LoadingHeader extends StatelessWidget {
  const LoadingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: AppColors.contrast,
        ),
        const SizedBox(height: 5),
        Text(
          "Obteniendo fotos",
          style: TextStyle(
            color: AppColors.contrast,
            fontWeight: FontWeight.w100,
            fontSize: ScreenSize.width(context) * 0.05,
          ),
        ),
      ],
    );
  }
}
