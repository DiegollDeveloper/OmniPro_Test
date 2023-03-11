import 'package:dartz/dartz.dart';
import 'package:omnipro_test/core/errors/failures.dart';
import 'package:omnipro_test/features/home/data/models/retrieve_photos_body.dart';
import 'package:omnipro_test/features/home/data/models/retrieve_photos_response.dart';

abstract class HomeRepository {
  Future<Either<Failure, RetrievePhotosResponse>> retrieveApiPhotos(
      {required RetrievePhotosBody params});
}
