import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UnescoSite.dart';
import 'detailsPage.dart';
import 'myListTile.dart';

class MySliverList extends StatefulWidget {
  const MySliverList({
    Key key,
    @required this.filteredSites,
  }) : super(key: key);

  final List<UnescoSite> filteredSites;

  @override
  _MySliverListState createState() => _MySliverListState();
}

class _MySliverListState extends State<MySliverList> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return MyTile(
            title: widget.filteredSites[index].site,
            subtitle: widget.filteredSites[index].category,
            image: widget.filteredSites[index].idNumber,
            country: widget.filteredSites[index].states,
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) =>
                      DetailsPage(unescoSite: widget.filteredSites[index]),
                ),
              );
            },
          );
        },
        // initialItemCount: widget.filteredSites.length,
        childCount: widget.filteredSites.length,
      ),
    );
  }
}
