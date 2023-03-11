import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:omnipro_test/core/errors/failures.dart';
import 'package:omnipro_test/core/utils/common_constants.dart';
import 'package:omnipro_test/core/utils/common_functions.dart';
import 'package:omnipro_test/features/home/data/models/api_photo.dart';
import 'package:omnipro_test/features/home/presentation/cubit/home_cubit.dart';
import 'package:omnipro_test/features/home/data/models/retrieve_photos_response.dart';

import '../main_test/home_test.mocks.dart';

void getApiPhotosTests() {
  group(
    "Get api photos",
    () {
      late HomeCubit homeCubit;
      late MockGetApiPhotosUseCase mockGetApiPhotosUseCase;

      setUp(() {
        mockGetApiPhotosUseCase = MockGetApiPhotosUseCase();
        homeCubit = HomeCubit(getApiPhotosUseCase: mockGetApiPhotosUseCase);
      });

      test(
        "Get api photos test (Success)",
        () async {
          when(mockGetApiPhotosUseCase(any)).thenAnswer(
            (_) async => Right(
              RetrievePhotosResponse(
                apiPhotos: CommonConstants.testApiPhotos,
              ),
            ),
          );

          await homeCubit.getApiPhotos(false);

          expect(homeCubit.state.loadingPage, false);
          expect(homeCubit.state.loadingNewPhotos, false);
          expect(
              CommonFunctions.compareLists(
                homeCubit.state.photos,
                CommonConstants.testApiPhotos,
              ),
              true);
        },
      );

      test(
        "Get api photos test (fail)",
        () async {
          when(mockGetApiPhotosUseCase(any)).thenAnswer(
            (_) async => Left(
              HomeFailure(message: "Error"),
            ),
          );

          await homeCubit.getApiPhotos(false);

          expect(homeCubit.state.loadingPage, false);
          expect(homeCubit.state.loadingNewPhotos, false);
          expect(
            CommonFunctions.compareLists(
              homeCubit.state.photos,
              [],
            ),
            true,
          );
        },
      );
    },
  );
}
