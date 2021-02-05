import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/detailsPage.dart';
import 'package:url_launcher/url_launcher.dart';
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

  List<Articles> articlesList = [
    Articles(
      articleLink:
          'https://www.travelandleisure.com/travel-news/unesco-world-heritage-sites-at-risk',
      headline:
          '21 World Heritage Sites You Should Visit Before They’re Lost Forever',
      subheadline:
          'Those deemed to be World Heritage Sites by the United Nations Educational, Scientific and Cultural Organization (UNESCO) get official status and protection, but there\'s not much even the UN can do to guard against damage to special places in conflict-ridden countries like , Libya, Palestine and Afghanistan.',
    ),
    Articles(
      headline:
          'Himachal Tourism: Spiti Valley is Finally Opening, Check Out COVID Guidelines to Follow',
      subheadline:
          'The gorgeous Spiti Valley in Himachal Pradesh is all set to welcome tourists after being shut for almost a year. Check out the Standard operating procedures, here!',
      articleLink:
          'https://www.india.com/travel/articles/himachal-tourism-spiti-valley-is-finally-opening-check-out-covid-guidelines-to-follow-4397330/',
    ),
    Articles(
      headline: 'Air travel tips to avoid COVID-19',
      subheadline:
          'Regardless of what health and safety experts say, some people will still travel during the pandemic. Here are some tips on how to do it safer if it’s necessary.',
      articleLink:
          'http://www.fairfaxtimes.com/articles/air-travel-tips-to-avoid-covid-19/article_6e291382-4087-11eb-b51f-6b364b2e3781.html',
    ),
    Articles(
      articleLink:
          'https://www.wsj.com/articles/how-travel-will-change-post-pandemic-10-expert-predictions-11599674976',
      headline: 'How Travel Will Change Post-Pandemic: 10 Expert Predictions ',
      subheadline:
          'We asked industry pros where we’ll be traveling in years to come and how hotels, flights, airports and even luggage will evolve—for the better. Plus: A look back at WSJ travel tips from the 2010s.',
    ),
    Articles(
      articleLink:
          'https://www.nationalgeographic.com/travel/lists/2017-new-unesco-world-heritage-sites/',
      headline: 'Here Are UNESCO\'s Newest World Heritage Sites',
      subheadline:
          'Discover which cultural and natural wonders made the prestigious list this year.',
    ),
    Articles(
      articleLink:
          'https://www.lifehack.org/articles/lifestyle/23-awesome-travel-hacks-that-add-fun-your-trip.html',
      headline: '23 Awesome Travel Hacks That Add Fun To Your Trip',
      subheadline:
          'Today, we will take a look at 23 travel hacks that can make your vacation more productive, fun, and comfortable.',
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
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  'About App',
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        // backgroundColor: Colors.redAccent[400],
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
            Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'Travel Articles: ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    // height: 500,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey,
                        indent: 20,
                        endIndent: 20,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: articlesList.length,
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              articlesList[index].headline,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          backgroundColor: Colors.grey[900],
                          childrenPadding: EdgeInsets.symmetric(horizontal: 20),
                          children: [
                            Text(
                              articlesList[index].subheadline,
                              style: TextStyle(color: Colors.grey),
                            ),
                            IconButton(
                              splashRadius: 5,
                              splashColor: Colors.redAccent,
                              onPressed: () async {
                                await launch(articlesList[index].articleLink,
                                    forceWebView: true);
                              },
                              icon: Icon(
                                Icons.open_in_new,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
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

class Articles {
  String headline;
  String subheadline;
  // String imageUrl;
  String articleLink;
  String publisher;

  Articles({
    this.articleLink,
    this.headline,
    // this.imageUrl,
    this.publisher,
    this.subheadline,
  });
}
