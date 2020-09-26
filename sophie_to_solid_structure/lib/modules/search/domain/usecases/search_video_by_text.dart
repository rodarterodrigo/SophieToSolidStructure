import 'package:dartz/dartz.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/entities/video.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/errors/errors.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/repositories/search_repository.dart';

abstract class ISearchVideoByText{
  Future<Either<FailureSearch, List<Video>>>searchVideo(String searchText);
}

class SearchVideoByText implements ISearchVideoByText{

  final ISearchRepository repository;

  SearchVideoByText(this.repository);

  @override
  Future<Either<FailureSearch, List<Video>>> searchVideo(String searchText) async {
    try {
      return searchText == null? Left(InvalidTextError()): searchText.isEmpty? Left(InvalidTextError()): await repository.searchVideo(searchText);
    }
    catch(e){
      return Left(InvalidTextError());
    }
  }
}