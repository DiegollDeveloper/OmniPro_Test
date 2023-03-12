import 'package:flutter/material.dart';
import 'package:omnipro_test/core/utils/app_colors.dart';
import 'package:omnipro_test/core/utils/screen_size.dart';
import 'package:omnipro_test/features/home/presentation/widgets/header/photos_counter.dart';
import 'package:omnipro_test/features/home/presentation/widgets/header/loading_header.dart';

class HomeHeader extends StatelessWidget {
  final bool loading;
  final bool networkConnection;
  final bool showReloadButton;
  final int photosLength;
  final Function onReload;

  const HomeHeader({
    super.key,
    required this.loading,
    required this.networkConnection,
    required this.showReloadButton,
    required this.photosLength,
    required this.onReload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (ScreenSize.height(context) * 0.2) -
          MediaQuery.of(context).viewPadding.top,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top,
      ),
      padding: EdgeInsets.only(
        top: ScreenSize.height(context) * 0.01,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "LISTA DE FOTOS",
            style: TextStyle(
              color: AppColors.contrast,
              fontSize: ScreenSize.width(context) * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: loading
                  ? const LoadingHeader()
                  : PhotosCounter(
                      networkConnection: networkConnection,
                      showReloadButton: showReloadButton,
                      photosLength: photosLength,
                      onReload: onReload,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
