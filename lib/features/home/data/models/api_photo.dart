import 'package:equatable/equatable.dart';

class ApiPhoto extends Equatable {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const ApiPhoto({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory ApiPhoto.fromJson(Map json) => ApiPhoto(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  @override
  List<Object?> get props => [
        albumId,
        id,
        title,
        url,
        thumbnailUrl,
      ];
}
