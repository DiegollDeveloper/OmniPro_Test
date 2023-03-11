import 'package:flutter/material.dart';
import 'package:omnipro_test/core/utils/app_colors.dart';
import 'package:omnipro_test/core/utils/screen_size.dart';

class PhotoItem extends StatelessWidget {
  final String photoUrl;
  final String title;

  const PhotoItem({
    super.key,
    required this.photoUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
        top: 10,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.secundary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              photoUrl,
              fit: BoxFit.fill,
              width: 50,
              height: 50,
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.contrast,
                fontSize: ScreenSize.width(context) * 0.04,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
