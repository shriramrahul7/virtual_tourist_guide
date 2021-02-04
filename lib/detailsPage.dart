import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:mini_project/imageScreen.dart';
import 'package:latlong/latlong.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          MapsLauncher.launchQuery(widget.unescoSite.site);
        },
        label: Text(
          'View Maps',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        icon: Icon(Icons.map, color: Colors.black),
        backgroundColor: Colors.white,
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        actions: [
          // IconButton(
          //   // icon: Icon(MyFlutterApp.travel_explore_black_18dp),
          //   icon: Icon(Icons.explore),
          //   onPressed: () async {
          //     await launch(widget.unescoSite.httpUrl);
          //   },
          // ),
          OutlineButton.icon(
            textColor: Colors.white,
            onPressed: () async {
              await launch(widget.unescoSite.httpUrl);
            },
            icon: Icon(Icons.explore, size: 24),
            label: Text(
              "More Info",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageLinks == null
                ? Container()
                : CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                    items: imageLinks.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) {
                                    return ImageScreen(
                                      imageLink: i,
                                    );
                                  },
                                ),
                              );
                            },
                            // child: Container(
                            // width: MediaQuery.of(context).size.width,
                            // margin: EdgeInsets.symmetric(horizontal: 5.0),
                            // decoration: BoxDecoration(
                            //   // image: DecorationImage(

                            //   // fit: BoxFit.cover,
                            //   // image: FadeInImage(image: ,),
                            //   // image: NetworkImage(i),
                            //   // ),
                            //   // color: Colors.amber,
                            //   borderRadius:
                            //       BorderRadius.all(Radius.circular(16.0)),
                            // ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/Earth-unscreen.gif',
                                  image: i,
                                ),
                              ),
                            ),
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
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
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
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.yellow[800])),
                      child: Text(
                        '''Date Inscribed : ${widget.unescoSite.dateInscribed}
The year when this site was regonised as a World Heritage Site. 

UNESCO Site ID Number : ${widget.unescoSite.idNumber}''',
                        style:
                            TextStyle(color: Colors.yellow[800], fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
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
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.yellowAccent,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    height: 400,
                    child: FlutterMap(
                      options: MapOptions(
                        // center: LatLng(34.388,
                        //     47.436),
                        center: LatLng(widget.unescoSite.coordinates[0],
                            widget.unescoSite.coordinates[1]),
                        minZoom: 5.0,
                      ),
                      layers: [
                        new TileLayerOptions(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: ['a', 'b', 'c']),
                        MarkerLayerOptions(markers: [
                          Marker(
                            width: 45.0,
                            height: 45.0,
                            // point: LatLng( 34.388,
                            //47.436),
                            point: new LatLng(widget.unescoSite.coordinates[0],
                                widget.unescoSite.coordinates[1]),
                            builder: (context) => Container(
                              child: IconButton(
                                color: Colors.red[900],
                                icon: Icon(Icons.location_on),
                                iconSize: 50.0,
                                onPressed: () {
                                  print('marker tapped');
                                },
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
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
