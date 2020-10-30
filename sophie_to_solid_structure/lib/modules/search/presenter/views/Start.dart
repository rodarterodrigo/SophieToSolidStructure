import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/states/search_state.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/views/home_bloc/video_search_bloc.dart';

class Start extends StatefulWidget {
  String searchVideo;
  Start(this.searchVideo);
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {

  final videoSearchBloc = Modular.get<VideoSearchBloc>();

  @override
  Widget build(BuildContext context) {
    videoSearchBloc.add(widget.searchVideo);
    return StreamBuilder(
      stream: videoSearchBloc,
      builder: (context, snapshot){
        final state = videoSearchBloc.state;
        if(state is SearchLoad) return Center(child: CircularProgressIndicator());
        if(state is SearchError) return Center(
          child: Text(
            "Houve um erro na busca",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        );
        final list = (state as SearchSuccess).videoList;
        return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              height: 2,
              color: Colors.grey,
            ),
            itemCount: list.length,
            itemBuilder: (context, index){
              final video = list[index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(video.image),
                        )
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(video.title),
                    subtitle: Text(video.channel),
                  )
                ],
              );
            },
        );
      },
    );
  }
}
