import 'package:dartz/dartz.dart';
import 'package:omnipro_test/core/errors/failures.dart';
import 'package:omnipro_test/core/use_case/use_case.dart';
import 'package:omnipro_test/features/home/data/models/retrieve_elements_body.dart';
import 'package:omnipro_test/features/home/domain/repositories/home_repository.dart';
import 'package:omnipro_test/features/home/data/models/retrieve_elements_response.dart';

class GetApiPhotosUseCase
    extends UseCase<RetrieveElementsResponse, RetrieveElementsBody> {
  final HomeRepository homeRepository;

  GetApiPhotosUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, RetrieveElementsResponse>> call(params) async =>
      await homeRepository.retrieveApiPhotos(params: params);
}
