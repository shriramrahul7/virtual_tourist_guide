import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'Services.dart';
import 'UnescoSite.dart';
import 'mySliverList.dart';

class ListScreen extends StatefulWidget {
  final List<UnescoSite> unescoSites;

  const ListScreen({Key key, this.unescoSites}) : super(key: key);
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<UnescoSite> unescoSites = [];
  List<UnescoSite> filteredSites = [];
  var isSearching = false;
  final myController = TextEditingController(text: '');

  void initState() {
    super.initState();
    // Services.getUnescoSites().then((sites) {
    setState(() {
      unescoSites = widget.unescoSites;
      filteredSites = unescoSites;
    });
    // });
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
        backgroundColor: Colors.black54,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              // actions: [
              //   IconButton(
              //     icon: Icon(Icons.home),
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //   )
              // ],
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
                        controller: myController,
                        placeholder: 'Enter the location name or country',
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
                            // isSearching = false;
                            setState(() {
                              filteredSites = unescoSites;
                            });
                          } else {
                            // isSearching = true;
                            // debouncer.run(() {
                            setState(() {
                              filteredSites = unescoSites
                                  .where(
                                    (u) => (u.site
                                            .toLowerCase()
                                            .contains(string.toLowerCase()) ||
                                        u.states
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
                    // OutlineButton(
                    //   color: Colors.orange,
                    //   highlightColor: Colors.green[400],
                    //   child: Text(
                    //     'Filter',
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    //   onPressed: () {},
                    // )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Number of Sites : ${filteredSites.length}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 0),
              sliver: MySliverList(filteredSites: filteredSites),
            ),
          ],
        ),
      ),
    );
  }
}
