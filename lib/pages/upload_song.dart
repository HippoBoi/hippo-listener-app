import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class UploadSong extends StatefulWidget {
  const UploadSong({super.key});

  @override
  UploadSongState createState() => UploadSongState();
}

class UploadSongState extends State<UploadSong> {
  String? _fileURL;
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ["mp3", "ogg", "wav"]);

    if (result != null) {
      File file = File(result.files.single.path!);
      Directory directory = await getApplicationDocumentsDirectory();
      String directoryPath = directory.path;
      final localFile = File("$directoryPath/${file.uri.pathSegments.last}");
      await file.copy(localFile.path);

      setState(() {
        _fileURL = localFile.path;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Archivo guardado")));
    }
  }

  void playAudio() async {
    if (_fileURL != null) {
      await _audioPlayer.play(UrlSource(_fileURL!));
    }
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
            const Text("No se encontraron canciones subidas."),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: _pickFile, child: const Text("Sube una canción")),
            if (_fileURL != null)
              ElevatedButton(
                  onPressed: playAudio, child: const Icon(Icons.play_arrow)),
          ],
        ),
      ),
    );
  }
}
