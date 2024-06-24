import 'package:flutter/material.dart';
import 'package:hippo_music_app/pages/settings.dart';
import 'package:hippo_music_app/pages/upload_song.dart';
import 'package:hippo_music_app/top_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // ignore: prefer_const_constructors
  final List pages = [SettingsPage(), UploadSong()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(),
      body: pages[1],
    );
  }
}
