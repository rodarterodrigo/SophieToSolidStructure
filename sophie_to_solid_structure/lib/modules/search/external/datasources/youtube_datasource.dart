import 'package:dio/dio.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/errors/errors.dart';
import 'package:sophie_to_solid_structure/modules/search/infra/datasources/search_datasource.dart';
import 'package:sophie_to_solid_structure/modules/search/infra/models/VideoModel.dart';

const YOUTUBE_API_KEY = "AIzaSyBMBJ4gIGKsmq4DsS4CPb52Z4wkZ8zeeYs";
const CHANNEL_KEY = "UCuVIWETFdxzwlHEHMbhm2_w";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class YoutubeDatasource implements ISearchDataSource{
  final Dio dio;

  YoutubeDatasource(this.dio);

  @override
  Future<List<VideoModel>> getSearch(String searchText) async{
    final response = await dio.get(URL_BASE +
        "search"
        "?part=snippet"
        "&channelId=${CHANNEL_KEY}"
        "&type=video"
        "&maxResults=20"
        "&order=date"
        "&key=${YOUTUBE_API_KEY}"
        "&q=${searchText}");

    return response.statusCode == 200? (response.data['items'] as List).map((map) => VideoModel.fromMap(map)).toList(): throw DataSourceError();
  }
}