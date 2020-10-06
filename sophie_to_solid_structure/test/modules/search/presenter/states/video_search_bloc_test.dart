import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/entities/video.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/errors/errors.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/usecases/search_video_by_text.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/states/search_state.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/views/home_bloc/video_search_bloc.dart';
import 'package:dartz/dartz.dart';

class SearchVideoByTextMock extends Mock implements SearchVideoByText{}

main(){
  final usecase = SearchVideoByTextMock();
  final bloc = VideoSearchBloc(usecase);

  test("Must return the states in order", (){
    when(usecase.searchVideo(any)).thenAnswer((realInvocation) async => Right(List<Video>()));
    expect(bloc, emitsInOrder([
      isA<SearchLoad>(),
      isA<SearchSuccess>(),
    ]));
    bloc.add("event");
  });

  test("Must return an error", (){
    when(usecase.searchVideo(any)).thenAnswer((realInvocation) async => Left(InvalidTextError()));
    expect(bloc, emitsInOrder([
      isA<SearchLoad>(),
      isA<SearchError>(),
    ]));
    bloc.add("event");
  });
}

