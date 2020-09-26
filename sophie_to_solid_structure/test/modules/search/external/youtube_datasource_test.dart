import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/errors/errors.dart';
import 'package:sophie_to_solid_structure/modules/search/external/datasources/youtube_datasource.dart';
import 'package:sophie_to_solid_structure/modules/search/infra/models/VideoModel.dart';

import '../../../utils/youtube_datasource_response.dart';

class DioMock extends Mock implements Dio{}

main(){

  final dio = DioMock();
  final datasource = YoutubeDatasource(dio);

  test("Must return a VideoModel list", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: jsonDecode(YoutubeDataSourceResponse), statusCode: 200));
    final result = datasource.getSearch("searchText");
    expect(result, completes);
  });

  test("Must return a VideoModel list", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: jsonDecode(YoutubeDataSourceResponse), statusCode: 200));
    final result = datasource.getSearch("searchText");
    expect(result, isA<Future<List<VideoModel>>>());
  });

  test("Must return a VideoModel list", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: null, statusCode: 401));
    final result = datasource.getSearch("searchText");
    expect(result, throwsA(isA<DataSourceError>()));
  });

  test("Must return a VideoModel list", (){
    when(dio.get(any)).thenThrow(Exception());
    final result = datasource.getSearch("searchText");
    expect(result, throwsA(isA<Exception>()));
  });
}