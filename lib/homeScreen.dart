import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Services.dart';
import 'UnescoSite.dart';
// import 'debouncer.dart';
import 'mySliverList.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UnescoSite> unescoSites = [];
  List<UnescoSite> filteredSites = [];
  var isSearching = false;
  // Debouncer debouncer = Debouncer(milliseconds: 500);
  final myController = TextEditingController(text: '');
  // FocusNode myFocusNode;

  void initState() {
    super.initState();
    Services.getUnescoSites().then((sites) {
      setState(() {
        unescoSites = sites;
        filteredSites = unescoSites;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragDown: (downDragDetails) {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: Scaffold(
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
        backgroundColor: Colors.black54,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.redAccent[400],
              // backgroundColor: Colors.orangeAccent[400],
              floating: true,
              pinned: true,
              centerTitle: true,
              title: Text('Explore the World'),
              // pinned: true,
              expandedHeight: 105,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsets.all(8),
                background: Column(
                  children: [
                    Expanded(
                      child: SizedBox(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CupertinoTextField(
                        placeholder: 'Enter the location name',
                        placeholderStyle: TextStyle(color: Colors.black54),
                        style: TextStyle(color: Colors.black),
                        clearButtonMode: OverlayVisibilityMode.editing,
                        prefix: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.search),
                        ),
                        maxLines: 1,
                        onChanged: (string) {
                          if (string == '') {
                            isSearching = false;
                            setState(() {});
                          } else {
                            isSearching = true;
                            // debouncer.run(() {
                            setState(() {
                              filteredSites = unescoSites
                                  .where(
                                    (u) => (u.site
                                        .toLowerCase()
                                        .contains(string.toLowerCase())),
                                  )
                                  .toList();
                            });
                            // });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 5),
              sliver: MySliverList(filteredSites: filteredSites),
            ),
          ],
        ),
      ),
    );
  }
}
