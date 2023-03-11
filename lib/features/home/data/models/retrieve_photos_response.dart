import 'package:omnipro_test/features/home/data/models/api_photo.dart';

class RetrievePhotosResponse {
  List<ApiPhoto> apiPhotos;

  RetrievePhotosResponse({
    required this.apiPhotos,
  });

  factory RetrievePhotosResponse.fromJson(List json) {
    return RetrievePhotosResponse(
      apiPhotos: json.map((jsonPhoto) => ApiPhoto.fromJson(jsonPhoto)).toList(),
    );
  }
}
