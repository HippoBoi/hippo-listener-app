import 'package:flutter/material.dart';

class SongsList extends StatelessWidget {
  final List<String> songs;
  final Function(String) onPlay;

  const SongsList({Key? key, required this.songs, required this.onPlay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: songs.length,
            itemBuilder: (context, index) {
              String songPath = songs[index];
              String songName = songPath.split("/").last;
              return ListTile(
                title: Text(songName),
                trailing: IconButton(
                    icon: const Icon(Icons.play_arrow),
                    onPressed: () => onPlay(songPath)),
              );
            }));
  }
}
