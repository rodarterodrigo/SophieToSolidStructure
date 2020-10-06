import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/views/home_bloc/video_search_bloc.dart';

class Home extends StatefulWidget {
  String search;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final videoSearchBloc = Modular.get<VideoSearchBloc>();

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
    videoSearchBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: videoSearchBloc,
      builder: (context, snapshot){
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
                onPressed: () async{
                  String res = await showSearch(context: context, delegate: null);
                },
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child: null,
          ),
          // bottomNavigationBar: BottomNavigationBar(
          //   currentIndex: 1,
          //   onTap: (ind) => null,
          //   type: BottomNavigationBarType.shifting,
          //   fixedColor: Colors.white,
          //   items: null,
          // ),
        );
      },
    );
  }
}