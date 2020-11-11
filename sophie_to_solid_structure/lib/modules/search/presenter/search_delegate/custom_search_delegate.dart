import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/search_delegate/search_helper.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/states/search_state.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/views/home_bloc/video_search_bloc.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/views/video_detail_page.dart';

class CustomSearchDelegate extends SearchDelegate<String>{
  final VideoSearchBloc videoSearchBloc = Modular.get<VideoSearchBloc>();

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
        primaryColor: Colors.white,
        primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
    );
  }

  @override
  String get searchFieldLabel => "Busca";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        videoSearchBloc.close();
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final SearchHelper searchHelper = SearchHelper();
    if(query.isNotEmpty){
      videoSearchBloc.add(query);
      return StreamBuilder(
        stream: videoSearchBloc,
        builder: (context, snapshot){
          final state = videoSearchBloc.state;
          switch (snapshot.connectionState){
            case ConnectionState.none:
              return searchHelper.verifyConnection();
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if(snapshot.hasData){
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
                  itemBuilder: (context, index){
                    final video = list[index];
                    return Column(
                      children: <Widget>[
                        ListTile(
                          //onTap: () => close(context, video.title),
                          onTap: () => Modular.to.pushNamed('/VIDEODETAILPAGE', arguments: video),
                          title: Text(video.title),
                        ),
                      ],
                    );
                },
                    separatorBuilder: (context, index) => Divider(height: 2,
                      color: Colors.grey,),
                    itemCount: list.length,
                );
              }
              else{
                return searchHelper.dataFail();
                break;
              }
          }
          return searchHelper.noResult();
        },
      );
    }
    else{
      return searchHelper.noResult();
    }
  }
}