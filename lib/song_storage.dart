import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

class SongStorage {
  static Future<List<String>> pickFile() async {
    final List<String> audiosList = [];

    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ["mp3", "ogg", "wav"]);

    if (result != null) {
      File file = File(result.files.single.path!);
      Directory directory = await getApplicationDocumentsDirectory();
      String directoryPath = directory.path;
      final localFile = File("$directoryPath/${file.uri.pathSegments.last}");
      await file.copy(localFile.path);

      audiosList.add(localFile.path);
    }

    return audiosList;
  }
}
