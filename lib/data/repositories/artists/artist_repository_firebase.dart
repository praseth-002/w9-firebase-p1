import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/artists/artist.dart';
import '../../dtos/artist_dto.dart';
import 'artist_repository.dart';

class ArtistRepositoryFirebase extends ArtistRepository {
  final Uri artistsUri = Uri.https('week-8-practice-986c9-default-rtdb.asia-southeast1.firebasedatabase.app', '/artists.json');

  @override
  Future<List<Artist>> fetchArtist() async {
    final http.Response response = await http.get(artistsUri);

    if (response.statusCode == 200) {
      Map<String, dynamic> artistJson = json.decode(response.body);
      return artistJson.entries.map((e) => ArtistDto.fromJson(e.key, e.value)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Artist?> fetchArtistById(String id) async {}
}
