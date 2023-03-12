import 'package:flutter/material.dart';
import 'package:omnipro_test/injection_container.dart';
import 'package:omnipro_test/core/utils/app_colors.dart';
import 'package:omnipro_test/core/utils/screen_size.dart';
import 'package:omnipro_test/core/helpers/base_screen.dart';
import 'package:omnipro_test/features/home/presentation/cubit/home_cubit.dart';
import 'package:omnipro_test/features/home/presentation/widgets/header/home_header.dart';
import 'package:omnipro_test/features/home/presentation/widgets/body/photos_list.dart';
import 'package:omnipro_test/features/home/presentation/widgets/body/data_error_page.dart';

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
                loading: state.loadingPage,
                networkConnection: state.networkConnection,
                showReloadButton: bloc.showReloadButtonAtHeader(),
                photosLength: state.photos.length,
                onReload: () => bloc.getInitialData(),
              ),
              (!state.loadingPage && state.dataError)
                  ? DataErrorPage(
                      onRetry: () async => bloc.getInitialData(),
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
