import 'dart:convert';
import 'package:sophie_to_solid_structure/modules/search/domain/entities/video.dart';

class VideoModel extends Video {

  VideoModel({id, title, description, image, channel});

  static VideoModel fromMap(Map<String, dynamic> map){
    if(map == null) return null;

    return VideoModel(
      id: map["id"]["videoId"],
      title: map["snippet"]["title"],
      description: map["snippet"]["description"],
      image: map["snippet"]["thumbnails"]["high"]["url"],
      channel: map["snippet"]["channelTitle"],
    );
  }

  static VideoModel fromJson(dynamic map){
    if(map == null) return null;

    return VideoModel(
      id: map["id"]["videoId"],
      title: map["snippet"]["title"],
      description: map["snippet"]["description"],
      image: map["snippet"]["thumbnails"]["high"]["url"],
      channel: map["snippet"]["channelTitle"],
    );
  }
}
