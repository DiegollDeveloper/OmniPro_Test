import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:omnipro_test/features/home/domain/usecases/retrieve_api_photos_use_case.dart';

import '../use_cases_tests/retrieve_api_photos_tests.dart';

@GenerateMocks([
  RetrieveApiPhotosUseCase,
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group("Home tests", () {
    retrieveApiPhotosTests();
  });
}
