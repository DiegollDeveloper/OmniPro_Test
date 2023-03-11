class ApiPhoto {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  ApiPhoto({
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
}
