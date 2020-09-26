import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  String search;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: null,
      builder: (context, snapshot){
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black,
              opacity: 1,
            ),
            backgroundColor: Colors.white,
            title: Image.asset(
              "Images/youtube.png",
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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 1,
            onTap: (ind) => null,
            type: BottomNavigationBarType.shifting,
            fixedColor: Colors.white,
            items: null,
          ),
        );
      },
    );
  }
  @override
  void dispose() {
    //navBloc.dispose();
    super.dispose();
  }
}