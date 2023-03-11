import 'package:dartz/dartz.dart';
import 'package:omnipro_test/core/errors/failures.dart';
import 'package:omnipro_test/features/home/data/models/retrieve_elements_body.dart';
import 'package:omnipro_test/features/home/data/models/retrieve_elements_response.dart';

abstract class HomeRepository {
  Future<Either<Failure, RetrieveElementsResponse>> retrieveApiPhotos(
      {required RetrieveElementsBody params});
}
