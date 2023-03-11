import 'package:omnipro_test/features/home/data/models/api_photo.dart';

class CommonConstants {
  static const List<ApiPhoto> testApiPhotos = [
    ApiPhoto(
      albumId: 1,
      id: 1,
      title: "Photo1",
      url: "Url1",
      thumbnailUrl: "ThumbnailUrl1",
    ),
    ApiPhoto(
      albumId: 1,
      id: 2,
      title: "Photo2",
      url: "Url2",
      thumbnailUrl: "ThumbnailUrl2",
    ),
  ];
}
