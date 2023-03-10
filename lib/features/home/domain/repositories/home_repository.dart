import 'package:dartz/dartz.dart';
import 'package:omnipro_test/core/errors/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, dynamic>> retrieveApiElements(
      {required String params});
}
