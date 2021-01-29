import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Services.dart';
import 'UnescoSite.dart';

class DetailsPage extends StatefulWidget {
  final UnescoSite unescoSite;

  const DetailsPage({this.unescoSite});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<dynamic> imageLinks = [];

  void initState() {
    Services.getImages(widget.unescoSite.site).then(
      (links) {
        setState(() {
          imageLinks = links;
        });
      },
    );
    super.initState();
  }

  _launchURL() async {
    const url = 'https://en.wikipedia.org';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MapsLauncher.launchQuery(widget.unescoSite.site);
          // var temp = Services.getImages();
          // print('call is successfully completed.');
        },
        child: Icon(
          Icons.map,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            // icon: Icon(MyFlutterApp.travel_explore_black_18dp),
            icon: Icon(Icons.explore),
            onPressed: () async {
              await launch(widget.unescoSite.httpUrl);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 200.0),
              items: imageLinks.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(i),
                        ),
                        // color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      // child: Center(
                      //   child: Text(
                      //     // '${widget.unescoSite.category} $i',
                      //     'lets see',
                      //     style: TextStyle(fontSize: 16.0),
                      //   ),
                      // ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(16),
              width: double.maxFinite,
              // color: Colors.redAccent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.unescoSite.site,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    // textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      widget.unescoSite.category,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  widget.unescoSite.location != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            widget.unescoSite.location,
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(7),
                            // color: Colors.white,
                            child: Text(
                              widget.unescoSite.states,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      'Date Inscribed : ${widget.unescoSite.dateInscribed}',
                      style: TextStyle(color: Colors.yellow[800], fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Details',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    // textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.unescoSite.shortDescription,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    // textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
