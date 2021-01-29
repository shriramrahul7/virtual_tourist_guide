import 'package:flutter/material.dart';

import 'UnescoSite.dart';
import 'detailsPage.dart';
import 'myListTile.dart';

class MySliverList extends StatelessWidget {
  const MySliverList({
    Key key,
    @required this.filteredSites,
  }) : super(key: key);

  final List<UnescoSite> filteredSites;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        // (context, index) => ListTile(title: Text('Item #$index')),
        (context, index) {
          return MyTile(
            title: filteredSites[index].site,
            subtitle: filteredSites[index].category,
            image: filteredSites[index].idNumber,
            country: filteredSites[index].states,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsPage(unescoSite: filteredSites[index]),
                ),
              );
            },
          );

          // return ListTile(
          //   leading: ClipRRect(
          //     borderRadius: BorderRadius.circular(5.0), //or 15.0
          //     child: Container(
          //       height: 50.0,
          //       width: 50.0,
          //       color: Colors.orange[700],
          //       child: Icon(
          //         Icons.location_city_rounded,
          //         color: Colors.white,
          //         size: 30,
          //       ),
          //     ),
          //   ),
          //   title: Text(filteredSites[index].site),
          //   subtitle: Text(filteredSites[index].category),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) =>
          //             DetailsPage(unescoSite: filteredSites[index]),
          //       ),
          //     );
          //   },
          // );
        },
        childCount: filteredSites.length,
      ),
    );
  }
}
