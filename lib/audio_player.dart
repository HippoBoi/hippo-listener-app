import 'package:audioplayers/audioplayers.dart';

class AudioPlayerService {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playAudio(String songPath) async {
    await _audioPlayer.play(UrlSource(songPath));
  }
}
