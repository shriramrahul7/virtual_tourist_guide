import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutApp extends StatelessWidget {
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
            // Container(
            //   child: ,
            // ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'WHAT IS VIRTUAL TOURIST GUIDE? ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.yellow[100],
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RichText(
                text: TextSpan(
                    text:
                        'A virtual tour guide is an application built on existing world heritage sites, composed of a sequence images and that assists the tourists about places that are recognized by ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'GoogleSans'),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'UNESCO',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await launch('https://whc.unesco.org/',
                                forceWebView: true);
                          },
                      ),
                      TextSpan(
                        text:
                            ' as World Heritage Sites. These sites are categorized into ',
                      ),
                      TextSpan(
                        text: 'Cultural, ',
                        style: TextStyle(
                          color: Colors.amberAccent,
                        ),
                      ),
                      TextSpan(
                        text: 'Natural, ',
                        style: TextStyle(
                          color: Colors.greenAccent,
                        ),
                      ),
                      TextSpan(
                        text: 'and ',
                      ),
                      TextSpan(
                        text: 'Mixed. \n \n',
                        style: TextStyle(
                          color: Colors.cyanAccent,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Our application provides a virtual guide to find out interesting world heritage sites. Due to the lack of up-to-date information and maps support, tourists are not able to visit all attractions during their stay.',
                      )
                    ]),

                //   style: TextStyle(color: Colors.white, fontSize: 18),
                // ),
              ),
            ),
            OutlineButton.icon(
              // highlightColor: Colors.purple,
              shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              borderSide: BorderSide(
                color: Colors.purpleAccent,
              ),
              textColor: Colors.purpleAccent,
              onPressed: () async {
                await launch('https://github.com/shriramrahul7/mini_project',
                    forceWebView: true);
              },
              icon: Icon(Icons.open_in_new, size: 24),
              label: Text(
                "GITHUB",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            // SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'What Is UNESCO World Heritage?',
                style: TextStyle(
                  color: Colors.yellow[100],
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  // decoration: TextDecoration.underline,
                  // decorationStyle: TextDecorationStyle.wavy,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                '''From masterpieces of creative genius to beautiful natural landscapes, these sites reveal the most compelling chapters of Earth\'s history.

In November 1972 the United Nations Educational, Scientific and Cultural Organization (UNESCO) inaugurated the list by adopting a treaty known as the World Heritage Convention. Its continuing goal is to recruit the world community in identifying cultural and natural properties of "outstanding universal value."''',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
