import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AudioProvider with ChangeNotifier {
  List<dynamic> _audioList = [];

  List<dynamic> get audioList {
    return [..._audioList];
  }

  Future<void> fetchAudio() async {
    var url = Uri.parse('https://api.quran.com/api/v4/chapter_recitations/1/1');
    try {
      final response = await http.get(url);
      List<dynamic> fetchedAudio = [];
      final extractedData =
          json.decode(response.body)['audio_file'] as Map<String, dynamic>;

      fetchedAudio = extractedData.values.toList();
      _audioList = fetchedAudio;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
