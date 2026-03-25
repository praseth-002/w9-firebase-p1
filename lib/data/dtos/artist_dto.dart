    import '../../model/artists/artist.dart';

class ArtistDto {
  static const String nameKey = 'name';
  static const String genreKey = 'genre';
  static const String imageKey = 'imageUrl';

  static Artist fromJson(String id, Map<String, dynamic> json) {
    assert(json[nameKey] is String);
    assert(json[genreKey] is String);
    assert(json[imageKey] is String);

    return Artist(
      id: id,
      name: json[nameKey],
      genre: json[genreKey],
      imageUrl: Uri.parse(json[imageKey])
    );
  }

  /// Convert Song to JSON
  Map<String, dynamic> toJson(Artist artist) {
    return {
      'id': artist.id,
      nameKey: artist.name,
      genreKey: artist.genre,
      imageKey: artist.imageUrl.toString(),
    };
  }
}
