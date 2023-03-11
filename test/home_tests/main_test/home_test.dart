import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:omnipro_test/features/home/domain/usecases/retrieve_api_photos_use_case.dart';

import '../use_cases_tests/get_user_data_tests.dart';

@GenerateMocks([
  GetApiPhotosUseCase,
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group("Home tests", () {
    getApiPhotosTests();
  });
}
