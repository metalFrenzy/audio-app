import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';

import '../providers/audio_provider.dart';
import '../generated/l10n.dart';

class AudioWidget extends StatefulWidget {
  const AudioWidget({super.key});

  @override
  State<AudioWidget> createState() => _AudioWidgetState();
}

class _AudioWidgetState extends State<AudioWidget> {
  late AudioPlayer player;
  bool _isPlaying = false;
  @override
  void initState() {
    player = AudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final audioList = Provider.of<AudioProvider>(context).audioList;
    final audioUrl = audioList[4];
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        child: ListTile(
          title: Text(
            S.of(context).audio,
          ),
          trailing: IconButton(
            icon: _isPlaying
                ? Icon(
                    Icons.pause_circle_filled,
                    color: Color.fromARGB(255, 112, 73, 180),
                  )
                : Icon(
                    Icons.play_circle_filled,
                    color: Colors.deepPurple,
                  ),
            onPressed: () async {
              if (_isPlaying == false) {
                await player.play(UrlSource(audioUrl));
                setState(() {
                  _isPlaying = true;
                });
              } else {
                player.pause();
                setState(() {
                  _isPlaying = false;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
