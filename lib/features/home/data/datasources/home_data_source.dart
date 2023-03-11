import 'package:omnipro_test/core/errors/exceptions.dart';
import 'package:omnipro_test/core/models/server_response.dart';
import 'package:omnipro_test/core/services/center_api.dart';
import 'package:omnipro_test/core/services/server.dart';
import 'package:omnipro_test/core/utils/common_functions.dart';
import 'package:omnipro_test/features/home/data/models/retrieve_elements_body.dart';
import 'package:omnipro_test/features/home/data/models/retrieve_elements_response.dart';

abstract class HomeDataSource {
  Future<RetrieveElementsResponse> retrieveApiPhotos(
      {required RetrieveElementsBody params});
}

class HomeDataSourceImpl extends HomeDataSource {
  @override
  Future<RetrieveElementsResponse> retrieveApiPhotos({required params}) async {
    try {
      ServerResponse serverResponse = await CenterApi.get(
        urlSpecific: Server.retrieveApiPhotosEndpoint(
          CommonFunctions.getRetrieveApiPhotosFilter(
            firstElement: params.firstElement,
            elementsToRetrieve: params.elementsToRetrieve,
          ),
        ),
      );
      if (!serverResponse.isSuccess) {
        throw HomeExeption(message: "Retrieve api elements error");
      }
      return RetrieveElementsResponse.fromJson(serverResponse.result);
    } catch (e) {
      throw HomeExeption(message: "Retrieve api elements error");
    }
  }
}
