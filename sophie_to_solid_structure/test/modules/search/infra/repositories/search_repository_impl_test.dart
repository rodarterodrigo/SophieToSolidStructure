import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/entities/video.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/errors/errors.dart';
import 'package:sophie_to_solid_structure/modules/search/infra/datasources/search_datasource.dart';
import 'package:sophie_to_solid_structure/modules/search/infra/models/VideoModel.dart';
import 'package:sophie_to_solid_structure/modules/search/infra/repositories/search_repository_impl.dart';

class SearchDataSourceMock extends Mock implements SearchDataSource{}

main(){

  final dataSource = SearchDataSourceMock();
  final repository = SearchRepository(dataSource);

  test("Must return a Video list", () async{
    when(dataSource.getSearch(any)).thenAnswer((realInvocation) async => List<VideoModel>());
    final result = await repository.searchVideo("rodarte");
    expect(result | null, isA<List<Video>>());
  });
  
  test("Must return a DataSourceError", () async{
    when(dataSource.getSearch(any)).thenAnswer((realInvocation) async => List<VideoModel>());
    final result = await repository.searchVideo(null);
    expect(result.fold(id,id), isA<DataSourceError>());
  });

  test("Must return a DataSourceError", () async{
    when(dataSource.getSearch(any)).thenAnswer((realInvocation) async => List<VideoModel>());
    final result = await repository.searchVideo("");
    expect(result | null, isA<List<Video>>());
  });

  test("Must return a DataSourceError", () async{
    when(dataSource.getSearch(any)).thenThrow(DataSourceError());
    final result = await repository.searchVideo("");
    expect(result.fold(id,id), isA<DataSourceError>());
  });

  test("Must return a DataSourceError", () async{
    when(dataSource.getSearch(any)).thenThrow(DataSourceError());
    final result = await repository.searchVideo(null);
    expect(result.fold(id,id), isA<DataSourceError>());
  });
}