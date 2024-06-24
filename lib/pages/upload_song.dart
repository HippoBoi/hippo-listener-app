import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadSong extends StatefulWidget {
  const UploadSong({super.key});

  @override
  UploadSongState createState() => UploadSongState();
}

class UploadSongState extends State<UploadSong> {
  File? _file;

  Future<void> _pickFile() async {
    // ignore: avoid_print
    print("tamo aqui 1");
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ["mp3", "ogg", "wav"]);

    if (result != null && result.files.single.path != null) {
      setState(() {
        _file = File(result.files.single.path!);
      });
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
            if (_file != null) Text("Archivo: ${_file!.path.split("/").last}")
          ],
        ),
      ),
    );
  }
}
