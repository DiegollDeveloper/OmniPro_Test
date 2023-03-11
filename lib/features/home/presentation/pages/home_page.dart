import 'package:flutter/material.dart';
import 'package:omnipro_test/injection_container.dart';
import 'package:omnipro_test/core/utils/app_colors.dart';
import 'package:omnipro_test/core/utils/screen_size.dart';
import 'package:omnipro_test/core/helpers/base_screen.dart';
import 'package:omnipro_test/features/home/presentation/cubit/home_cubit.dart';
import 'package:omnipro_test/features/home/presentation/widgets/home_header.dart';
import 'package:omnipro_test/features/home/presentation/widgets/photos_list.dart';
import 'package:omnipro_test/features/home/presentation/pages/data_error_page.dart';

class HomePage extends BaseScreen<HomeState, HomeCubit> {
  const HomePage({super.key});

  @override
  HomeCubit createBloc() => sl<HomeCubit>()..onLoadPage();

  @override
  Widget buildScreen(BuildContext context, HomeCubit bloc, HomeState state) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: WillPopScope(
        onWillPop: () async => false,
        child: Container(
          padding: EdgeInsets.only(
            left: ScreenSize.width(context) * 0.05,
            right: ScreenSize.width(context) * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(
                loadingPage: state.loadingPage,
                photosLength: state.photos.length,
              ),
              (!state.loadingPage && state.dataError)
                  ? DataErrorScreen(
                      onRetry: () async => bloc.onLoadPage(),
                    )
                  : PhotosList(
                      photos: state.photos,
                      refreshController: state.refreshController,
                      onLoading: () async => bloc.getApiPhotos(false),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
