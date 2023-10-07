class AudioModel {
  AudioFile? audioFile;

  AudioModel({this.audioFile});

  AudioModel.fromJson(Map<String, dynamic> json) {
    audioFile = json['audio_file'] != null
        ? new AudioFile.fromJson(json['audio_file'])
        : null;
  }

 
}

class AudioFile {
  int? id;
  int? chapterId;
  double? fileSize;
  String? format;
  String? audioUrl;

  AudioFile(
      {this.id, this.chapterId, this.fileSize, this.format, this.audioUrl});

  factory AudioFile.fromJson(Map<String, dynamic> json) => AudioFile(
        id: json['id'],
        chapterId: json['chapter_id'],
        fileSize: json['file_size'],
        format: json['format'],
        audioUrl: json['audio_url'],
      );
}
