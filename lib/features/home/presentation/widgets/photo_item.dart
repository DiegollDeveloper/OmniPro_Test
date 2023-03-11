import 'package:flutter/material.dart';
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
        left: 10,
        right: 10,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 5,
          ),
        ],
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
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              title,
              style: TextStyle(
                fontSize: ScreenSize.width(context) * 0.04,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
