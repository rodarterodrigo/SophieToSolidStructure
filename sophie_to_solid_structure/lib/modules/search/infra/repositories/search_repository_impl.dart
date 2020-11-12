import 'package:dartz/dartz.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/entities/video.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/errors/errors.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/repositories/search_repository.dart';
import 'package:sophie_to_solid_structure/modules/search/infra/datasources/search_datasource.dart';

class SearchRepository implements ISearchRepository{

  final ISearchDataSource dataSource;

  SearchRepository(this.dataSource);

  @override
  Future<Either<FailureSearch, List<Video>>> searchVideo(String searchText) async {
    try{
      return searchText == null? Left(DataSourceError()): Right(await dataSource.getSearch(searchText));
    }
    on DataSourceError catch(Exception){
    return Left(Exception);
    }
    catch(e){
    return Left(DataSourceError(message: e));
    }
  }
}