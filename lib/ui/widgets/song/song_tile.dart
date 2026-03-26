import 'package:flutter/material.dart';
import 'package:w9firebase/model/artists/artist.dart';

import '../../../model/songs/song.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
    required this.artist
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;
  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(backgroundImage: NetworkImage(song.imageUrl.toString())),
          title: Text(song.title),
          subtitle: Text("${song.duration.inMinutes}mins    67Likes   ${artist.name} - ${artist.genre}"),
          trailing: Column(
            children: [
              Text(
                isPlaying ? "Playing" : "",
                style: TextStyle(color: Colors.amber),
              ),
              Icon(Icons.favorite),
            ],
          ),
        ),
      ),
    );
  }
}
