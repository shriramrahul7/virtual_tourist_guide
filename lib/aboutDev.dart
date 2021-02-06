import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:getwidget/getwidget.dart';

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
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: Text(
          'ABOUT DEVELOPERS :',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.yellow[100],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
              SizedBox(height: 20,),
              Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      height: 250,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Center(
                                child: Container(
                                  padding: EdgeInsets.only(top: 90.0),
                                  child: Text(
                                    'P Shriram Rahul',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  child: Text(
                                    'Flutter Developer',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              FlatButton.icon(
                                //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                textColor: Colors.black87,
                                onPressed: () async {
                                  await launch('https://github.com/shriramrahul7',
                                      forceWebView: false);
                                },
                                icon: Icon(
                                  Icons.open_in_new,
                                  size: 20,
                                  color: Colors.black87,
                                ),
                                label: Text(
                                  "Github ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),

                              ),
                              FlatButton.icon(
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                textColor: Colors.black87,
                                onPressed: () async {
                                  await launch('https://www.instagram.com/shriramrahul/',
                                      forceWebView: false);
                                },
                                icon: Icon(
                                  Icons.open_in_new,
                                  size: 20,
                                  color: Colors.black87,
                                ),
                                label: Text(
                                  "Instagram",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),

                              ),
                            ],
                          ),
                        ),
                        //padding: EdgeInsets.only(top: 30.0),
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
                              backgroundImage: AssetImage(
                                  'assets/Tajmahal.jpg'),
                            ),
                          ),
                        ),
                    ),
                  ]
              ),
              SizedBox(height: 35,),
              Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      height: 250,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Container(
                              padding: EdgeInsets.only(top: 90.0),
                              child: Text(
                                'M Satyagovind',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.0,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              child: Text(
                                'Flutter Developer',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),
                          FlatButton.icon(
                            //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            textColor: Colors.black87,
                            onPressed: () async {
                              await launch('https://github.com/Satyagovind',
                                  forceWebView: false);
                            },
                            icon: Icon(
                              Icons.open_in_new,
                              size: 20,
                              color: Colors.black87,
                            ),
                            label: Text(
                              "Github ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),

                          ),
                          FlatButton.icon(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            textColor: Colors.black87,
                            onPressed: () async {
                              await launch('https://www.instagram.com/satyagovind_raja7/',
                                  forceWebView: false);
                            },
                            icon: Icon(
                              Icons.open_in_new,
                              size: 20,
                              color: Colors.black87,
                            ),
                            label: Text(
                              "Instagram",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),

                          ),
                        ],
                      ),
                    ),
                    //padding: EdgeInsets.only(top: 30.0),
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
                            backgroundImage: AssetImage(
                                'assets/dolamites.jpg'),
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
              SizedBox(height: 35,),
              Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      height: 250,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Container(
                              padding: EdgeInsets.only(top: 90.0),
                              child: Text(
                                'Y Rakesh Reddy',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.0,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              child: Text(
                                'Flutter Developer',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),
                          FlatButton.icon(
                            //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            textColor: Colors.black87,
                            onPressed: () async {
                              await launch('https://github.com/Rakesh0710',
                                  forceWebView: false);
                            },
                            icon: Icon(
                              Icons.open_in_new,
                              size: 20,
                              color: Colors.black87,
                            ),
                            label: Text(
                              "Github ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),

                          ),
                          FlatButton.icon(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            textColor: Colors.black87,
                            onPressed: () async {
                              await launch('https://www.instagram.com/rakeshaj_67/',
                                  forceWebView: false);
                            },
                            icon: Icon(
                              Icons.open_in_new,
                              size: 20,
                              color: Colors.black87,
                            ),
                            label: Text(
                              "Instagram",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),

                          ),
                        ],
                      ),
                    ),
                    //padding: EdgeInsets.only(top: 30.0),
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
                            backgroundImage: AssetImage(
                                'assets/Petra.jpg'),
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
              SizedBox(height: 30,)
      ],
        ),
      ),

    );
  }
}