import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:getwidget/getwidget.dart';

class AboutDev extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Text(
                'ABOUT DEVELOPERS :',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.yellow[100],
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DevCard(
              name: 'P Shriram Rahul',
              designation: 'UI Development, Image Search API',
              githubLink: 'https://github.com/shriramrahul7',
              imageUrl: 'assets/GrandCanyon.jpg',
              instaLink: 'https://www.instagram.com/shriramrahul/',
              mailId:
                  'mailto:shriramrahul.pingali7@gmail.com?subject=Liked%20your%20app!',
            ),
            SizedBox(height: 20),
            DevCard(
              name: 'M Satyagovind',
              designation: 'UI Development, Search Optimization',
              imageUrl: 'assets/Himejicastle.jpg',
              githubLink: 'https://github.com/Satyagovind',
              instaLink: 'https://www.instagram.com/satyagovind_raja7/',
              mailId:
                  'mailto:msatyagovind@gmail.com?subject=Liked%20your%20app!',
            ),
            SizedBox(height: 20),
            DevCard(
              name: 'Y Rakesh Reddy',
              designation: 'Data aggregation and API reference',
              githubLink: 'https://github.com/Rakesh0710',
              instaLink: 'https://www.instagram.com/rakeshaj_67/',
              imageUrl: 'assets/dolamites.jpg',
              mailId:
                  'mailto:rakeshyeduru@gmail.com?subject=Liked%20your%20app!',
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}

class DevCard extends StatefulWidget {
  const DevCard({
    Key key,
    this.name,
    this.designation,
    this.githubLink,
    this.instaLink,
    this.mailId,
    this.imageUrl,
  }) : super(key: key);

  final String name;

  final String designation;

  final String githubLink;

  final String instaLink;

  final String mailId;

  final String imageUrl;

  @override
  _DevCardState createState() => _DevCardState();
}

class _DevCardState extends State<DevCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.only(bottom: 20),
            // height: 250,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 90.0),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Center(
                  child: Container(
                    child: Text(
                      widget.designation,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      splashColor: Colors.grey,
                      splashRadius: 20,
                      onPressed: () async {
                        await launch(widget.githubLink, forceWebView: false);
                      },
                      icon: Icon(
                        FontAwesomeIcons.github,
                        size: 25,
                        color: Colors.black87,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await launch(
                          widget.instaLink,
                          forceWebView: false,
                        );
                      },
                      icon: Icon(
                        FontAwesomeIcons.instagram,
                        size: 25,
                        color: Colors.black87,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await launch(widget.mailId, forceWebView: false);
                      },
                      icon: Icon(
                        // FontAwesomeIcons.envelope,
                        Icons.mail,
                        size: 25,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            child: CircleAvatar(
              radius: 65.0,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                child: Align(
                  alignment: Alignment.bottomRight,
                ),
                radius: 60.0,
                backgroundImage: AssetImage(widget.imageUrl),
                // backgroundImage: AssetImage('assets/dolamites.jpg'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
