import 'package:al_quran/ui/about.dart';
import 'package:al_quran/ui/listpage/jadwalsholat.dart';
import 'package:al_quran/ui/listpage/listalquran.dart';
import 'package:al_quran/ui/listpage/listasmaul.dart';
import 'package:al_quran/ui/listpage/listdoa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  showExitPopup() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Confirm"),
            content: Text("Do you want to exit?"),
            actions: [
              RaisedButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              RaisedButton(
                child: Text("Yes"),
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          );
        });
  }

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () {
        return showExitPopup();
      },
      child: Scaffold(
        drawer: Drawer(child: Drawers()),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              Container(
                child: SliverAppBar(
                  backgroundColor: Color(0xFFC19870),
                  pinned: true,
                  floating: true,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.info_outline),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => About()));
                      },
                    )
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/islamicback.jpg'),
                          fit: BoxFit.fill,
                        ),

                        //color: Colors.blue,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 50.0,
                            width: double.infinity,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(
                                width: 20.0,
                              ),
                              DefaultTextStyle(
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: 10,
                                    top: 15,
                                  ),
                                  child: SizedBox(
                                    width: queryData.size.width * .9,
                                    child: AnimatedTextKit(
                                        repeatForever: true,
                                        animatedTexts: [
                                          TypewriterAnimatedText(
                                            'পড়ো তোমার প্রভুর নামে, যিনি সৃষ্টি করেছেন ( আল-আলাক্ব )',
                                            speed: Duration(milliseconds: 100),
                                          ),
                                          TypewriterAnimatedText(
                                            'যে আল্লাহর উদ্দেশ্যে বিনয়ী হয় আল্লাহ তারমর্যাদা বাড়িয়ে দেন।( মিশকাত )',
                                            speed: Duration(milliseconds: 100),
                                          ),
                                          TypewriterAnimatedText(
                                            'মানুষ সবসময় মৃত্যু থেকে বাঁচার চেষ্টা করে কিন্তু জাহান্নাম থেকে নয়। অথচ, মানুষ চাইলে জাহান্নাম থেকে বাঁচতে পারে। কিন্তু, মৃত্যু থেকে নয়।',
                                            speed: Duration(milliseconds: 100),
                                          ),
                                          TypewriterAnimatedText(
                                            'পাপ মানুষের জ্ঞান কেড়ে নেয়, ব্যাক্তি যা জানতো তা ভুলে যায়। ( আল ফাওয়াইদ, পৃষ্ঠা ২১৫',
                                            speed: Duration(milliseconds: 100),
                                          ),
                                          TypewriterAnimatedText(
                                            'শুধু টাকা থাকা মানেই রিজিক নয়। নেক জীবনসঙ্গী,নেক সন্তান,উত্তম আখলাক এবং নেককার বন্ধুও রিজিকের অন্তর্ভুক্ত।- মাওলানা তারিক জামিল ',
                                            speed: Duration(milliseconds: 100),
                                          ),
                                        ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  expandedHeight: 180.0,
                  bottom: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white.withOpacity(0.6),
                    labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    isScrollable: true,
                    tabs: [
                      Tab(
                        child: Text(
                          'আল কোরআন',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Tab(
                        child: Text(
                          'দুআ',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'আসমা-উল-হুসনা',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'নামাজের সময়',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Tab(
                      //   child: Text(
                      //     'আয়াত কুর্সি',
                      //     style: TextStyle(
                      //       fontSize: 16.0,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              ListAlquran(),

              ListDoa(),
              ListAsmaul(),
              JadwalSholat(),
              //AyatKursi(),
            ],
          ),
        ),
      ),
    );
  }
}

class Drawers extends StatelessWidget {
  const Drawers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF0F1D3A)),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/forTab.JPG'),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                Positioned(child: Container()),
              ],
            ),
          ),
          Card(
            child: ListTile(
                title: Text('এবাউট'),
                leading: Icon(Icons.account_box_outlined),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () => Navigator.popAndPushNamed(context, '/about')),
          ),
          Card(
            child: ListTile(
                title: Text('সেটিং'),
                leading: Icon(Icons.settings),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () => Navigator.popAndPushNamed(context, '/settings')),
          ),
          Card(
            child: ListTile(
                title: Text('কিবলার দিক'),
                leading: Icon(Icons.compass_calibration_rounded),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () => Navigator.popAndPushNamed(context, '/kiblah')),
          ),
        ],
      ),
    );
  }
}
