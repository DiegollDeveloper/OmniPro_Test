import 'package:dartz/dartz.dart';
import 'package:omnipro_test/core/errors/failures.dart';
import 'package:omnipro_test/core/use_case/use_case.dart';
import 'package:omnipro_test/features/home/domain/repositories/home_repository.dart';

class GetApiElementsUseCase extends UseCase<dynamic, dynamic> {
  final HomeRepository homeRepository;

  GetApiElementsUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, dynamic>> call(params) async =>
      await homeRepository.retrieveApiElements(params: params);
}
