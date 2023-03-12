import 'package:flutter/material.dart';
import 'package:omnipro_test/core/utils/app_colors.dart';

class ReloadButton extends StatelessWidget {
  final Function onReload;
  const ReloadButton({
    super.key,
    required this.onReload,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => onReload(),
        child: Icon(
          Icons.replay_outlined,
          color: AppColors.contrast,
        ),
      );
}
