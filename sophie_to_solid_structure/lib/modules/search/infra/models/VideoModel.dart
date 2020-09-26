import 'dart:convert';
import 'package:sophie_to_solid_structure/modules/search/domain/entities/video.dart';

class VideoModel extends Video {

  VideoModel({id, title, description, image, channel});

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'title':title,
      'description':description,
      'image':image,
      'channel':channel,
    };
  }

  static VideoModel fromMap(Map<String, dynamic> map){
    if(map == null) return null;

    return VideoModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      image: map['image'],
      channel: map['channel'],
    );
  }

  static VideoModel fromJson(dynamic map){
    if(map == null) return null;

    return VideoModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      image: map['image'],
      channel: map['channel'],
    );
  }
  String toJson() => json.encode(toMap());
}
