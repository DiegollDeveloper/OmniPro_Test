import 'package:flutter/material.dart';
import 'package:omnipro_test/core/utils/app_colors.dart';
import 'package:omnipro_test/core/utils/screen_size.dart';

class HomeHeader extends StatelessWidget {
  final bool loadingPage;
  final int photosLength;

  const HomeHeader({
    super.key,
    required this.loadingPage,
    required this.photosLength,
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
            "Lista de fotos",
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
              child: loadingPage
                  ? Column(
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
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
          ),
        ],
      ),
    );
  }
}
