import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String country;
  final String image;
  final VoidCallback onTap;

  MyTile({
    this.subtitle,
    this.title,
    this.country,
    this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      color: Colors.white,
      // elevation: 5.0,
      // shadowColor: Colors.blue,
      child: InkWell(
        splashColor: Colors.orange.withAlpha(30),
        onTap: onTap,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              //borderRadius: BorderRadius.circular(10),
              width: MediaQuery.of(context).size.width * 0.27,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/wheel2.gif',
                    image:
                        'http://whc.unesco.org/uploads/sites/site_$image.jpg',
                    // fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: 15),
            // ),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        // color: Colors.blueGrey,
                        color: subtitle == 'Natural'
                            ? Colors.green
                            : Colors.yellow[900],
                        letterSpacing: 1.5),
                  ),
                  Text(
                    country,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[300],
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
