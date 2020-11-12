import 'package:sophie_to_solid_structure/modules/search/infra/models/VideoModel.dart';

abstract class ISearchDataSource{
  Future<List<VideoModel>> getSearch(String searchText);
}