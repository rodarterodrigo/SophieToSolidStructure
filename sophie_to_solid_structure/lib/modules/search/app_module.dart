import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/usecases/search_video_by_text.dart';
import 'package:sophie_to_solid_structure/modules/search/external/datasources/youtube_datasource.dart';
import 'package:sophie_to_solid_structure/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/navigation/navigation.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/routes/app_pages.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/views/home_bloc/navigation_bloc.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/views/home_bloc/video_search_bloc.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/views/video_detail_page.dart';
import 'app_widget.dart';
import 'presenter/views/Home.dart';


class AppModule extends MainModule{
  @override
  // TODO: implement binds
  List<Bind> get binds => [
    Bind((i) => Dio()),
    Bind((i) => YoutubeDatasource(i())),
    Bind((i) => SearchRepository(i())),
    Bind((i) => SearchVideoByText(i())),
    Bind((i) => VideoSearchBloc(i())),
    Bind((i) => NavigationBloc()),
    Bind((i) => Navigation()),
  ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => [
    ModularRouter(Routes.INITIAL, child: (context, args) => Home()),
    ModularRouter(Routes.VIDEODETAILPAGE, child: (context, args) => VideoDetailPage(video: args.data,),),
  ];
}