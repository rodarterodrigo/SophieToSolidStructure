import 'package:flutter/material.dart';
class HotAndNews extends StatefulWidget {
  @override
  _HotAndNewsState createState() => _HotAndNewsState();
}

class _HotAndNewsState extends State<HotAndNews> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Em alta", style: TextStyle(
        fontSize: 24,
      ),),
    );
  }
}
