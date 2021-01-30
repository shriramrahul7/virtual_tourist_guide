import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final String imageLink;

  const ImageScreen({Key key, this.imageLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InteractiveViewer(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageLink),
            ),
          ),
        ),
      ),
    );
  }
}
