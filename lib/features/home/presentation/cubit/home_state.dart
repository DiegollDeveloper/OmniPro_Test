part of 'home_cubit.dart';

class HomeState {
  final bool loadingPage;
  final bool loadingNewPhotos;
  final bool dataError;
  final List<ApiPhoto> photos;

  final RefreshController refreshController;

  const HomeState({
    required this.loadingPage,
    required this.loadingNewPhotos,
    required this.dataError,
    required this.photos,
    required this.refreshController,
  });

  factory HomeState.initial() => HomeState(
        loadingPage: false,
        loadingNewPhotos: false,
        dataError: false,
        photos: [],
        refreshController: RefreshController(),
      );

  HomeState copyWith({
    bool? loadingPage,
    bool? loadingNewPhotos,
    bool? dataError,
  }) =>
      HomeState(
        loadingPage: loadingPage ?? this.loadingPage,
        loadingNewPhotos: loadingNewPhotos ?? this.loadingNewPhotos,
        dataError: dataError ?? this.dataError,
        photos: photos,
        refreshController: refreshController,
      );
}
