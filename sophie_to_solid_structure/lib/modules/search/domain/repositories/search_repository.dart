import 'package:dartz/dartz.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/entities/video.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/errors/errors.dart';

abstract class ISearchRepository{
  Future<Either<FailureSearch, List<Video>>> searchVideo (String searchText);
}