import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final String imageLink;

  const ImageScreen({Key key, this.imageLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: InteractiveViewer(
        // child: FadeInImage.assetNetwork(
        //   placeholder: 'assets/Earth-unscreen.gif',
        //   image: imageLink,
        // ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageLink),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
