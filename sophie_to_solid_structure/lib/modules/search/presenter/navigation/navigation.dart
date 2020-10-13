import 'package:flutter/material.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/views/HotAndNews.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/views/Library.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/views/Start.dart';
import 'package:sophie_to_solid_structure/modules/search/presenter/views/Subscriptions.dart';

abstract class INavigation{
  Widget viewList(int ind, String search);
  List<BottomNavigationBarItem> bottonNavigation();
}

class Navigation implements INavigation{
  @override
  List<BottomNavigationBarItem> bottonNavigation() => [
    BottomNavigationBarItem(
      backgroundColor: Colors.red,
      title: Text(
        "Início",
      ),
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      title: Text(
        "Em alta",
      ),
      icon: Icon(Icons.whatshot),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.amber,
      title: Text(
        "Inscrições",
      ),
      icon: Icon(Icons.subscriptions),
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.green,
      title: Text(
        "Biblioteca",
      ),
      icon: Icon(Icons.video_library),
    ),
  ];

  @override
  Widget viewList(int ind, String search) {
    List<Widget> views = [
      Start(search),
      HotAndNews(),
      Subscriptions(),
      Library(),
    ];
    return views[ind];
  }
}