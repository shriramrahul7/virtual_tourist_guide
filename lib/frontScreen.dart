//import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FrontScreen extends StatefulWidget {
  @override
  _FrontScreenState createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  List<FrontSites> editorsSites = [
    FrontSites(
        name: 'dolomite',
        location: 'Italy',
        imageUrl: 'assets/dola.jpg',
        fact: 'great'),
    FrontSites(
        name: 'Taj Mahal',
        location: 'Italy',
        imageUrl: 'assets/1.jpg',
        fact: 'gre'),
    FrontSites(
        name: 'great barrier reef',
        location: 'Italy',
        imageUrl: 'assets/2.jpg',
        fact: 'gret'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[400],
        elevation: 0,
        title: Text(
          'Virtual Tourist Guide',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(
          'All Sites',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        icon: Icon(Icons.location_city, color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                "Editor's Pics: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 250,
                autoPlay: true,
              ),
              items: editorsSites
                  .map(
                    (e) => Builder(builder: (context) {
                      return InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   CupertinoPageRoute(
                          //     builder: (context) {
                          //       return ImageScreen(
                          //         imageLink: i,
                          //       );
                          //     },
                          //   ),
                          // );
                        },
                        child: Container(
                          //margin: EdgeInsets.all(10.0),
                          width: 300.0,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Positioned(
                                bottom: 30,
                                child: Container(
                                  height: 55.0,
                                  width: 300.0,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:20.0,left: 15),
                                    child: Text(e.fact),
                                  ),
                                ),
                              ),
                              Container(
                                // decoration: BoxDecoration(
                                //     color: Colors.white,
                                //     borderRadius: BorderRadius.circular(15),
                                //     boxShadow: [
                                //       // BoxShadow(
                                //       // color: Colors.white,
                                //       // blurRadius: 6.0,
                                //       // )
                                //     ]),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(15.0),
                                  child: Image(
                                    fit:BoxFit.cover,
                                    height: 175.0,
                                    width: 280.0,
                                    image: AssetImage(e.imageUrl),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  )
                  .toList(),
              // child: ListView.builder(
              //   scrollDirection: Axis.horizontal,
              //   itemCount: editorsSites.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     return Container(
              //       margin: EdgeInsets.all(10.0),
              //       width: 300.0,
              //       child: Stack(
              //         alignment: Alignment.center,
              //         children: [
              //           Positioned(
              //             bottom:15,
              //             child: Container(
              //               height: 55.0,
              //               width: 300.0,
              //               decoration: BoxDecoration(
              //                 color: Colors.redAccent,
              //               borderRadius:BorderRadius.circular(15.0)
              //             ),
              //               child: Padding(
              //                 padding: const EdgeInsets.all(10.0),
              //
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.end,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children:[
              //                     Text(editorsSites[index].fact)
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Container(
              //             decoration: BoxDecoration(
              //               color: Colors.white,
              //               borderRadius: BorderRadius.circular(20),
              //               boxShadow: [
              //                 BoxShadow(
              //                   color: Colors.black87,
              //                   blurRadius: 6.0,
              //                 )
              //               ]
              //             ),
              //             child: Stack(
              //               children: [
              //                 ClipRRect(
              //                   borderRadius:BorderRadius.circular(20.0),
              //                   child: Image(
              //                     height: 175.0,
              //                     width: 289.5,
              //                     image: AssetImage(editorsSites[index].imageUrl),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           )
              //         ],
              //       ),
              //     );
              //   }
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

class FrontSites {
  String name;
  String location;
  String fact;
  String imageUrl;

  FrontSites({
    this.name,
    this.location,
    this.fact,
    this.imageUrl,
  });
}
