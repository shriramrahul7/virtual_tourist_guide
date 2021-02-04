import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/detailsPage.dart';
import 'Services.dart';
import 'UnescoSite.dart';
import 'homeScreen.dart';

class FrontScreen extends StatefulWidget {
  @override
  _FrontScreenState createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  List<UnescoSite> unescoSites = [];
  List<UnescoSite> filteredSites = [];

  List<FrontSites> editorsSites = [
    FrontSites(
      name: 'dolomite',
      location: 'Italy',
      imageUrl: 'assets/dola.jpg',
      fact: 'great',
      idNumber: '1237',
    ),
    FrontSites(
      name: 'Taj Mahal',
      location: 'Italy',
      imageUrl: 'assets/1.jpg',
      idNumber: '252',
      fact: 'gre',
    ),
    FrontSites(
      name: 'great barrier reef',
      location: 'Italy',
      imageUrl: 'assets/2.jpg',
      idNumber: '154',
      fact: 'gret',
    ),
  ];

  void initState() {
    super.initState();
    Services.getUnescoSites().then((sites) {
      setState(() {
        unescoSites = sites;
        // filteredSites = unescoSites;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => ListScreen(
                unescoSites: unescoSites,
              ),
            ),
          );
        },
        label: Text(
          'All Sites',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        icon: Icon(Icons.location_city, color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FrontScreenSlider(
              editorsSites: editorsSites,
              unescoSites: unescoSites,
              title: 'Editor\'s Pics:',
            ),
            FrontScreenSlider(
              editorsSites: editorsSites,
              unescoSites: unescoSites,
              title: 'Rakesh\'s Pics:',
            ),
            FrontScreenSlider(
              editorsSites: editorsSites,
              unescoSites: unescoSites,
              title: 'Govind\'s Pics:',
            ),
          ],
        ),
      ),
    );
  }
}

class FrontScreenSlider extends StatelessWidget {
  const FrontScreenSlider({
    Key key,
    @required this.editorsSites,
    this.title,
    this.unescoSites,
  }) : super(key: key);

  final List<FrontSites> editorsSites;
  final List<UnescoSite> unescoSites;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
                letterSpacing: 2.0,
              ),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 230,
              // autoPlay: true,
            ),
            items: editorsSites
                .map(
                  (e) => Builder(builder: (context) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) {
                            return DetailsPage(
                              unescoSite: unescoSites
                                  .where((site) => site.idNumber == e.idNumber)
                                  .first,
                            );
                          }),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        // padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              bottom: 5,
                              child: Container(
                                height: 55.0,
                                width: MediaQuery.of(context).size.width * 0.75,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, left: 15),
                                  child: Text(
                                    e.fact,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            PhysicalModel(
                              clipBehavior: Clip.hardEdge,
                              color: Colors.black,
                              shadowColor: Colors.grey,
                              elevation: 10,
                              borderRadius: BorderRadius.circular(10),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image(
                                    fit: BoxFit.cover,
                                    height: 175.0,
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    image: AssetImage(e.imageUrl),
                                  ),
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
          ),
        ],
      ),
    );
  }
}

class FrontSites {
  String name;
  String location;
  String fact;
  String imageUrl;
  String idNumber;

  FrontSites({
    this.name,
    this.location,
    this.fact,
    this.imageUrl,
    this.idNumber,
  });
}
