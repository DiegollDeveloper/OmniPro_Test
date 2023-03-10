part of 'home_cubit.dart';

class HomeState {
  final bool loadingPage;
  final bool dataError;

  const HomeState({
    required this.loadingPage,
    required this.dataError,
  });

  factory HomeState.initial() => const HomeState(
        loadingPage: false,
        dataError: false,
      );

  HomeState copyWith({
    bool? loadingPage,
    bool? dataError,
  }) =>
      HomeState(
        loadingPage: loadingPage ?? this.loadingPage,
        dataError: dataError ?? this.dataError,
      );
}
