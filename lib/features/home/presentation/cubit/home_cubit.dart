import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:omnipro_test/features/home/data/models/api_photo.dart';
import 'package:omnipro_test/features/home/data/models/retrieve_photos_body.dart';
import 'package:omnipro_test/features/home/domain/usecases/retrieve_api_photos_use_case.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  GetApiPhotosUseCase? getApiPhotosUseCase;

  HomeCubit({
    this.getApiPhotosUseCase,
  }) : super(HomeState.initial());

  Future<void> onLoadPage() async {
    emit(state.copyWith(
      loadingPage: true,
      dataError: false,
    ));
    await getApiPhotos(true);
    emit(state.copyWith(loadingPage: false));
  }

  Future<void> getApiPhotos(bool fromLoadPage) async {
    emit(state.copyWith(loadingNewPhotos: true));
    final result = await getApiPhotosUseCase!(
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
        emit(state.copyWith());
        state.refreshController.loadComplete();
      },
    );
  }
}
