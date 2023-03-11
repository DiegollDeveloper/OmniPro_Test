import 'package:omnipro_test/core/services/server.dart';
import 'package:omnipro_test/core/errors/exceptions.dart';
import 'package:omnipro_test/core/services/center_api.dart';
import 'package:omnipro_test/core/models/server_response.dart';
import 'package:omnipro_test/core/utils/common_functions.dart';
import 'package:omnipro_test/features/home/data/models/retrieve_photos_body.dart';
import 'package:omnipro_test/features/home/data/models/retrieve_photos_response.dart';

abstract class HomeDataSource {
  Future<RetrievePhotosResponse> retrieveApiPhotos(
      {required RetrievePhotosBody params});
}

class HomeDataSourceImpl extends HomeDataSource {
  @override
  Future<RetrievePhotosResponse> retrieveApiPhotos({required params}) async {
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
        throw HomeExeption(message: "Retrieve api photos error");
      }
      return RetrievePhotosResponse.fromJson(serverResponse.result);
    } catch (e) {
      throw HomeExeption(message: "Retrieve api photos error");
    }
  }
}
