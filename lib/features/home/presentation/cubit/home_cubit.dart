import 'package:omnipro_test/navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:omnipro_test/core/utils/in_app_notification.dart';
import 'package:omnipro_test/features/home/data/models/api_photo.dart';
import 'package:omnipro_test/features/home/data/models/retrieve_photos_body.dart';
import 'package:omnipro_test/features/home/domain/usecases/retrieve_api_photos_use_case.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  Connectivity? connectivity;

  RetrieveApiPhotosUseCase? retrieveApiPhotosUseCase;

  HomeCubit({
    this.connectivity,
    this.retrieveApiPhotosUseCase,
  }) : super(HomeState.initial());

  Future<void> onLoadPage() async {
    await getInitialData();
    listenNetworkStatus();
  }

  Future<void> getInitialData() async {
    emit(state.copyWith(
      loadingPage: true,
      dataError: false,
    ));
    state.photos.clear();
    await getApiPhotos(true);
    emit(state.copyWith(loadingPage: false));
  }

  Future<void> getApiPhotos(bool fromLoadPage) async {
    emit(state.copyWith(loadingNewPhotos: true));
    final result = await retrieveApiPhotosUseCase!(
      RetrievePhotosBody(
        firstElement: state.photos.length + 1,
        elementsToRetrieve: 10,
      ),
    );
    emit(state.copyWith(loadingNewPhotos: false));
    result.fold(
      (l) {
        emit(state.copyWith(dataError: fromLoadPage));
        state.refreshController.loadFailed();
      },
      (r) {
        state.photos.addAll(r.apiPhotos);
        emit(state.copyWith(networkConnection: true));
        state.refreshController.loadComplete();
      },
    );
  }

  void listenNetworkStatus() {
    connectivity!.onConnectivityChanged.listen(
      (event) async {
        if (event == ConnectivityResult.wifi ||
            event == ConnectivityResult.ethernet ||
            event == ConnectivityResult.mobile) {
          onNetworkConnectionSuccess();
        } else {
          onNetworkConnectionFail();
        }
      },
    );
  }

  void onNetworkConnectionSuccess() async {
    if (state.photos.isEmpty) {
      await getInitialData();
      InAppNotification.show(
        message: "Conexión restablecida",
        type: NotificationType.success,
        context: AppNavigator.state.context,
      );
    } else if (!state.networkConnection) {
      InAppNotification.show(
        message: "Conexión restablecida",
        type: NotificationType.success,
        context: AppNavigator.state.context,
      );
    }

    emit(state.copyWith(networkConnection: true));
  }

  void onNetworkConnectionFail() {
    InAppNotification.show(
      message: "Sin conexión a internet",
      type: NotificationType.error,
      context: AppNavigator.state.context,
    );
    emit(state.copyWith(networkConnection: false));
  }

  bool showReloadButtonAtHeader() =>
      !state.loadingNewPhotos && state.networkConnection;
}
