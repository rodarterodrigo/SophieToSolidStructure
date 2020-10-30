import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/entities/video.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/errors/errors.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/repositories/search_repository.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/usecases/search_video_by_text.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryMock extends Mock implements ISearchRepository{}

final repository = SearchRepositoryMock();
final usecase = SearchVideoByText(repository);

main(){
  test("Must return a video list", () async{
    when(repository.searchVideo(any)).thenAnswer((realInvocation) async => Right(List<Video>()));
    final result = await usecase.searchVideo("rodarte");
    expect(result | null, isA<List<Video>>());
  });

  test("Must return a InvalidTextError", () async{
    when(repository.searchVideo(any)).thenAnswer((realInvocation) async => Right(List<Video>()));
    final result = await usecase.searchVideo("");
    expect(result | null, isA<List<Video>>());
  });

  test("Must return a InvalidTextError", () async{
    when(repository.searchVideo(any)).thenAnswer((realInvocation) async => Right(List<Video>()));
    final result = await usecase.searchVideo(null);
    expect(result.fold(id,id), isA<InvalidTextError>());
  });

  test("Must return a InvalidTextError", () async{
    when(repository.searchVideo(any)).thenThrow(InvalidTextError());
    final result = await usecase.searchVideo("rodarte");
    expect(result.fold(id,id), isA<InvalidTextError>());
  });
}