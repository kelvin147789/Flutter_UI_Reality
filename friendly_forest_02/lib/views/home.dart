import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:friendly_forest_02/router.dart';
import 'package:friendly_forest_02/utils.dart';
import 'package:async/async.dart';
import 'package:flutter/services.dart' show SystemChannels;

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    new Tab(
      text: 'All',
    ),
    new Tab(
      text: 'Digest',
    ),
    new Tab(
      text: 'News',
    ),
    new Tab(
      text: 'Contact',
    ),
  ];
  TabController _tabController;
  String value = "";
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      initialIndex: 1,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AllAlign,
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_left,
                        size: 37,
                      ),
                      onPressed: () {
                        Navigator.popAndPushNamed(context, infoViewRoute);
                      },
                    ),
                    Spacer(),
                    IconButton(
                      icon: new Icon(
                        const IconData(0xe900, fontFamily: 'Menu Dot'),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: SeparateSize,
                ),
                Padding(
                  padding: HomePageAlign,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Charity Campaign',
                      style: headerTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _textEditingController,
                        onSubmitted: (text) {
                          value = text;

                          //_textEditingController.addListener(() {
                          //it adds value to listener when doing certain action
                          // });

                          print(_textEditingController.text);
                          _textEditingController.text = "";

                          //Do something
                        },
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          prefixIcon: SearchIconData,
                          prefixStyle: PreFixTextStyle,
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: HintTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    DefaultTabController(
                      length: 4,
                      child: TabBar(
                        controller: _tabController,
                        labelStyle: tabTextStyle,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator:
                            CircleTabIndicator(color: Colors.black, radius: 2),
                        isScrollable: true,
                        labelColor: Colors.black,
                        tabs: myTabs,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: new Icon(
                        Icons.tune,
                        size: 20.0,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: SmallSeparateSize,
                ),
                Container(
                  height: 300,
                  width: 500,
                  child: Center(
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        Container(
                          height: 100,
                          color: Colors.redAccent,
                          child: Center(child: Text('All')),
                        ),
                        Container(
                          height: 100,
                          color: Colors.blueAccent,
                        ),
                        Container(
                          height: 100,
                          color: Colors.greenAccent,
                        ),
                        Container(
                          height: 100,
                          color: Colors.purpleAccent,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
