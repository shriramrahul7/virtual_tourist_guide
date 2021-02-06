import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UnescoSite.dart';
import 'detailsPage.dart';
import 'frontScreen.dart';

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
              autoPlay: true,
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
                                  child: RichText(
                                    text: TextSpan(
                                      text: e.name + ', ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                      children: [
                                        TextSpan(
                                          text: e.location,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                    // style: TextStyle(color: Colors.black),
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
