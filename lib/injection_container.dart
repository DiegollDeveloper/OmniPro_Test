import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:omnipro_test/features/home/presentation/cubit/home_cubit.dart';
import 'package:omnipro_test/features/home/data/datasources/home_data_source.dart';
import 'package:omnipro_test/features/home/domain/repositories/home_repository.dart';
import 'package:omnipro_test/features/home/data/repositories/home_repository_impl.dart';
import 'package:omnipro_test/features/home/domain/usecases/retrieve_api_photos_use_case.dart';

final GetIt sl = GetIt.instance;

init() async {
  registerConnectivity();
  registerDataSources();
  registerRepositories();
  registerUseCases();
  registerBlocs();
}

void registerBlocs() {
  sl.registerFactory(() => HomeCubit(
        retrieveApiPhotosUseCase: sl(),
        connectivity: sl(),
      ));
}

void registerUseCases() {
  sl.registerLazySingleton(
      () => RetrieveApiPhotosUseCase(homeRepository: sl()));
}

void registerRepositories() {
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(homeDataSource: sl()));
}

void registerDataSources() {
  sl.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl());
}

void registerConnectivity() {
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
}
