import 'package:omnipro_test/core/errors/exceptions.dart';

abstract class HomeDataSource {
  Future<dynamic> retrieveApiElements({required dynamic params});
}

class HomeDataSourceImpl extends HomeDataSource {
  @override
  Future<dynamic> retrieveApiElements({required params}) async {
    try {} catch (e) {
      throw HomeExeption(message: "Get api elements error");
    }
  }
}
