import 'package:flutter/material.dart';
import 'package:hippo_music_app/audio_player.dart';
import 'package:hippo_music_app/pages/songs_list.dart';
import 'package:hippo_music_app/song_storage.dart';

class UploadSong extends StatefulWidget {
  const UploadSong({super.key});

  @override
  UploadSongState createState() => UploadSongState();
}

class UploadSongState extends State<UploadSong> {
  final List<String> _songsList = [];
  final AudioPlayerService _audioPlayerService = AudioPlayerService();

  Future<void> _pickFile() async {
    List<String> songs = await SongStorage.pickFile();

    setState(() {
      _songsList.addAll(songs);
    });
  }

  void playAudio(String songPath) {
    _audioPlayerService.playAudio(songPath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 30,
                child: Image.asset(
                  "assets/images/hippoLogo.png",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                )),
            const Text("Aquí puedes almacenar tus canciones."),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _pickFile, child: const Text("Añadir")),
            SongsList(songs: _songsList, onPlay: playAudio)
          ],
        ),
      ),
    );
  }
}
