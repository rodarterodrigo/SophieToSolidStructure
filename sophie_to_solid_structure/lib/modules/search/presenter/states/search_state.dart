import 'package:sophie_to_solid_structure/modules/search/domain/entities/video.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/errors/errors.dart';

abstract class ISearchState{}

class SearchSuccess implements ISearchState{
  final List<Video> videoList;
  SearchSuccess(this.videoList);
}

class SearchError implements ISearchState{
  final FailureSearch failureSearch;
  SearchError(this.failureSearch);
}

class SearchLoad implements ISearchState{}

class SearchStart implements ISearchState{}