import 'package:dartz/dartz.dart';
import 'package:omnipro_test/core/errors/exceptions.dart';
import 'package:omnipro_test/core/errors/failures.dart';
import 'package:omnipro_test/features/home/data/datasources/home_data_source.dart';
import 'package:omnipro_test/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl({required this.homeDataSource});

  @override
  Future<Either<Failure, dynamic>> retrieveApiElements(
      {required params}) async {
    try {
      final result = await homeDataSource.retrieveApiElements(params: params);
      return Right(result);
    } on HomeExeption catch (e) {
      return Left(HomeFailure(message: e.message));
    }
  }
}
