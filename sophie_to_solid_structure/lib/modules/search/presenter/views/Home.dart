import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/navigation/navigation.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/search_delegate/custom_search_delegate.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/views/home_bloc/navigation_bloc.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/views/home_bloc/video_search_bloc.dart';

class Home extends StatefulWidget {
  String search;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final navigationBloc = Modular.get<NavigationBloc>();
  final navigation = Modular.get<Navigation>();
  final videoSearchBloc = Modular.get<VideoSearchBloc>();

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    navigationBloc.close();
    videoSearchBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return StreamBuilder(
        stream: navigationBloc,
        builder:(context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.black,
                opacity: 1,
              ),
              backgroundColor: Colors.white,
              title: Image.asset(
                "lib/assets/images/youtube.png",
                width: 100,
                height: 24,
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async =>videoSearchBloc.add(await showSearch(context: context, delegate: CustomSearchDelegate())),
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.all(16),
              child: navigation.viewList(navigationBloc.index, videoSearchBloc.search),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: navigationBloc.index,
              onTap: (ind) => navigationBloc.add(ind),
              type: BottomNavigationBarType.shifting,
              fixedColor: Colors.white,
              items: navigation.bottonNavigation(),
            ),
          );
        }
    );
  }
}