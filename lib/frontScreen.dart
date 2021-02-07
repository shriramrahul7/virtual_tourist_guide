import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/aboutDev.dart';
import 'package:url_launcher/url_launcher.dart';
import 'colorTheme.dart';
import 'Services.dart';
import 'UnescoSite.dart';
import 'aboutApp.dart';
import 'fontScreenSlider.dart';
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
      name: 'Dolomite',
      location: 'Italy',
      imageUrl: 'assets/dolamites.jpg',
      fact: 'They Were The Site Of Some Of World War I’s Fiercest Battles',
      idNumber: '1237',
    ),
    FrontSites(
      name: 'Ajantha Caves',
      location: 'India',
      imageUrl: 'assets/Ajantha_Caves.jpg',
      idNumber: '242',
      fact:
          'Though the caves are over 2,000 years old, the Buddha statues had been added close 600 years later.',
    ),
    FrontSites(
      name: 'Great Barrier Reef',
      location: 'Australia',
      imageUrl: 'assets/Greatbarrierreef.jpg',
      idNumber: '154',
      fact:
          ' It’s the only place on earth where two UNESCO World Heritage Sites meet. ',
    ),
    FrontSites(
      name: 'Mount Fuji',
      location: 'Japan',
      imageUrl: 'assets/Mount_Fuiji.jpg',
      idNumber: '1418',
      fact: 'MT FUJI IS ACTUALLY A STRATOVOLCANO! ',
    ),
    FrontSites(
      name: 'Stonehenge',
      location: 'England',
      imageUrl: 'assets/Stonehenge.jpg',
      idNumber: '373',
      fact: 'IN ITS EARLY DAYS, STONEHENGE WAS A CEMETERY.  ',
    ),
    FrontSites(
      name: 'Grand Canyon',
      location: 'United States',
      imageUrl: 'assets/GrandCanyon.jpg',
      idNumber: '1094',
      fact: 'MT FUJI IS ACTUALLY A STRATOVOLCANO! ',
    ),
    FrontSites(
      name: 'Acropolis of Athens',
      location: 'Greece',
      imageUrl: 'assets/Acroplis-Athens.jpg',
      idNumber: '404',
      fact: 'THE WORLD’S OLDEST WEATHER STATION IS AT ITS BASE.',
    ),
    FrontSites(
      name: 'Himeji Castle',
      location: 'Japan',
      imageUrl: 'assets/Himejicastle.jpg',
      idNumber: '661',
      fact:
          'For over 400 years, Himeji Castle has remained intact, even throughout the extensive bombing of Himeji in World War II and natural disasters such as the 1995 Great Hanshin earthquake and various typhoons',
    ),
  ];

  List<FrontSites> sevenWonders = [
    FrontSites(
      name: 'Taj Mahal',
      location: 'India',
      imageUrl: 'assets/Tajmahal.jpg',
      fact:
          'The tomb contains 99 different names of Allah as calligraphic inscriptions',
      idNumber: '252',
    ),
    FrontSites(
      name: 'Great Wall Of China',
      location: 'China',
      imageUrl: 'assets/Thegreatwallofchina.jpg',
      idNumber: '438',
      fact:
          'During the Cultural Revolution (1966–1976), many Great Wall bricks were used in building homes, farms, or reservoirs.',
    ),
    FrontSites(
      name: 'Machu Picchu',
      location: 'Peru',
      imageUrl: 'assets/Machupichu.jpg',
      idNumber: '274',
      fact:
          'Machu Picchu is made up of more than 150 buildings ranging from baths and houses to temples and sanctuaries. ',
    ),
    FrontSites(
      name: 'Chichen Itza',
      location: 'Mexico',
      imageUrl: 'assets/Chichenitza.jpg',
      idNumber: '483',
      fact:
          'It is believed Itza means water magicians, deriving from the Mayan Itz for magic and a for water ',
    ),
    FrontSites(
      name: 'Colosseum',
      location: 'Rome',
      imageUrl: 'assets/ColosseumRome.jpg',
      idNumber: '91',
      fact:
          'The arena had 36 trap doors for special effects, as well as many underground passages and rooms to hold wild animals and gladiators before the games began ',
    ),
    FrontSites(
      name: 'Petra',
      location: 'Jordan',
      imageUrl: 'assets/Petra.jpg',
      idNumber: '326',
      fact:
          'A Swiss explorer called Johann Ludwig Burckhardt discovered Petra in 1812. Because it was an unknown metropolitan for around 5 centuries, it is also called the ‘Lost City’.',
    ),
    FrontSites(
      name: 'Christ The Redemeer',
      location: 'Brazil',
      imageUrl: 'assets/christredemeer.jpg',
      idNumber: '1100',
      fact:
          ' The original design of the statue was different to what we see today. It was intended for Christ to be holding a globe in one hand and a cross in the other, rather than two open arms. ',
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
        child: Container(
          color: Colors.grey[900],
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                ),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/logo.png'),
                      Text(
                        '''Explore
Digitally''',
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.info,
                  color: Colors.grey[300],
                ),
                title: Text(
                  'About App',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[300],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) {
                      return AboutApp();
                    }),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.forum,
                  color: Colors.grey[300],
                ),
                title: Text(
                  'Feedback',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[300],
                  ),
                ),
                onTap: () async {
                  await launch(
                    'https://forms.gle/8xhs6v61XAcWs3W26',
                  );
                },
              ),
              ListTile(
                leading: Text(
                  '👨‍💻',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[300],
                  ),
                ),
                title: Text(
                  'About Developers',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[300],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) {
                      return AboutDev();
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: ColorTheme().kThemeColor,
        // backgroundColor: Colors.redAccent[400],
        elevation: 0,
        title: Text(
          'Virtual Tourist Guide',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 1),
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
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        icon: Icon(Icons.location_city, color: Colors.white),
        backgroundColor: Colors.teal[700],
        // foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: FrontScreenSlider(
                editorsSites: editorsSites,
                unescoSites: unescoSites,
                title: 'Editor\'s Pics:',
              ),
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
                        return Theme(
                          data: ThemeData.dark(),
                          child: ExpansionTile(
                            title: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                articlesList[index].headline,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            backgroundColor: Colors.grey[900],
                            childrenPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            children: [
                              Text(
                                articlesList[index].subheadline,
                                style: TextStyle(color: Colors.grey),
                              ),
                              OutlineButton.icon(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                textColor: Colors.white,
                                onPressed: () async {
                                  await launch(articlesList[index].articleLink,
                                      forceWebView: true);
                                },
                                icon: Icon(
                                  Icons.open_in_new,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Open Link",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              )
                            ],
                          ),
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
              editorsSites: sevenWonders,
              unescoSites: unescoSites,
              title: 'Seven Wonders:',
            ),
            Padding(padding: EdgeInsets.all(40)),
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
