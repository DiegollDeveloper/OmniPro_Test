import 'package:flutter/material.dart';
import 'package:omnipro_test/injection_container.dart';
import 'package:omnipro_test/core/utils/app_colors.dart';
import 'package:omnipro_test/core/utils/screen_size.dart';
import 'package:omnipro_test/core/helpers/base_screen.dart';
import 'package:omnipro_test/features/home/presentation/cubit/home_cubit.dart';
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
        child: (state.dataError)
            ? DataErrorScreen(
                onRetry: () async => bloc.onLoadPage(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: ScreenSize.height(context) * 0.1,
                    bottom: ScreenSize.height(context) * 0.05,
                    left: ScreenSize.width(context) * 0.1,
                    right: ScreenSize.width(context) * 0.1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Home"),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
