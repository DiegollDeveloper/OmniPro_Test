import 'package:dartz/dartz.dart';
import 'package:omnipro_test/core/errors/failures.dart';
import 'package:omnipro_test/core/use_case/use_case.dart';
import 'package:omnipro_test/features/home/data/models/retrieve_photos_body.dart';
import 'package:omnipro_test/features/home/domain/repositories/home_repository.dart';
import 'package:omnipro_test/features/home/data/models/retrieve_photos_response.dart';

class RetrieveApiPhotosUseCase
    extends UseCase<RetrievePhotosResponse, RetrievePhotosBody> {
  final HomeRepository homeRepository;

  RetrieveApiPhotosUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, RetrievePhotosResponse>> call(params) async =>
      await homeRepository.retrieveApiPhotos(params: params);
}
