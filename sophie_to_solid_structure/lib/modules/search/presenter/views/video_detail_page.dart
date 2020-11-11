import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sophie_to_solid_structure/modules/search/domain/entities/video.dart';
class VideoDetailPage extends StatefulWidget {
  final Video video;

  VideoDetailPage({this.video}):assert(video != null);

  @override
  _VideoDetailPageState createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(child: Icon(Icons.arrow_back_ios), onTap: () => Modular.to.pop()),
        title: Text(widget.video.title),
        backgroundColor: Theme.of(context).appBarTheme.color,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Text(widget.video.title),
            ),
          ],
        ),
      ),
    );
  }
}
