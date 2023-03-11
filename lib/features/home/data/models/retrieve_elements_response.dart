import 'package:omnipro_test/features/home/data/models/api_photo.dart';

class RetrieveElementsResponse {
  List<ApiPhoto> apiPhotos;

  RetrieveElementsResponse({
    required this.apiPhotos,
  });

  factory RetrieveElementsResponse.fromJson(List json) {
    return RetrieveElementsResponse(
      apiPhotos: json.map((jsonPhoto) => ApiPhoto.fromJson(jsonPhoto)).toList(),
    );
  }
}
