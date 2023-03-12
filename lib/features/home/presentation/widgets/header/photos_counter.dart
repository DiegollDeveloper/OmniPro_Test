import 'package:flutter/material.dart';
import 'package:omnipro_test/core/utils/app_colors.dart';
import 'package:omnipro_test/core/utils/screen_size.dart';
import 'package:omnipro_test/features/home/presentation/widgets/header/reload_button.dart';
import 'package:omnipro_test/features/home/presentation/widgets/header/network_status_icon.dart';

class PhotosCounter extends StatelessWidget {
  final bool networkConnection;
  final bool showReloadButton;
  final int photosLength;
  final Function onReload;

  const PhotosCounter({
    super.key,
    required this.networkConnection,
    required this.showReloadButton,
    required this.photosLength,
    required this.onReload,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 10,
          child: NetworkStatusIcon(
            networkConnection: networkConnection,
          ),
        ),
        if (showReloadButton)
          Positioned(
            top: 10,
            right: 10,
            child: ReloadButton(onReload: onReload),
          ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                photosLength.toString(),
                style: TextStyle(
                  color: AppColors.contrast,
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenSize.width(context) * 0.08,
                ),
              ),
              Text(
                "Fotos obtenidas",
                style: TextStyle(
                  color: AppColors.contrast,
                  fontWeight: FontWeight.w100,
                  fontSize: ScreenSize.width(context) * 0.05,
                ),
              ),
            ],
          ),
        ),
      ],
    );
    ;
  }
}
