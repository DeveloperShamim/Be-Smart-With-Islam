import 'package:al_quran/data/location.dart';
import 'package:al_quran/data/models/jadwalsholat.dart';
import 'package:al_quran/data/services.dart';
import 'package:al_quran/data/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class JadwalSholat extends StatefulWidget {
  @override
  _JadwalSholatState createState() => _JadwalSholatState();
}

class _JadwalSholatState extends State<JadwalSholat> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    var loc = Provider.of<LocationNotifier>(context);
    var f = DateFormat('dd/MM\nyyy');
    return FutureBuilder<JadwalDaily>(
        future: ServiceData().loadJadwalSholat(loc.location),
        builder: (c, snapshot) {
          if (snapshot.hasData)
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ListView(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/arabicpattern1.JPG"),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                '${snapshot.data.results.location.city}',
                              ),
                              subtitle:
                                  Text(snapshot.data.results.location.country),
                              trailing: Text(
                                '${f.format(snapshot.data.results.datetime[0].date.gregorian)}',
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 120,
                            width: queryData.size.width * .4,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/arabicpattern1.JPG"),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ফজর',
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  snapshot.data.results.datetime[0].times.fajr,
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 120,
                            width: queryData.size.width * .4,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/arabicpattern1.JPG"),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'সূর্যোদয়',
                                  style: TextStyle(fontSize: 30),
                                ),
                                Text(
                                  snapshot
                                      .data.results.datetime[0].times.sunrise,
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 120,
                            width: queryData.size.width * .4,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/arabicpattern1.JPG"),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'যোহর',
                                  style: TextStyle(fontSize: 30),
                                ),
                                Text(
                                  snapshot.data.results.datetime[0].times.dhuhr,
                                  style: TextStyle(fontSize: 30),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 120,
                            width: queryData.size.width * .4,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/arabicpattern1.JPG"),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'আছর',
                                  style: TextStyle(fontSize: 30),
                                ),
                                Text(
                                  snapshot.data.results.datetime[0].times.asr,
                                  style: TextStyle(fontSize: 30),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 120,
                            width: queryData.size.width * .4,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/arabicpattern1.JPG"),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'মাগরিব',
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  snapshot
                                      .data.results.datetime[0].times.maghrib,
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 120,
                            width: queryData.size.width * .4,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/arabicpattern1.JPG"),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ইশা',
                                  style: TextStyle(fontSize: 30),
                                ),
                                Text(
                                  snapshot.data.results.datetime[0].times.isha,
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          return Center(child: CircularProgressIndicator());
        });
  }
}






// ListTile(
//                         trailing: Image.asset('images/subuh.png'),
//                         title: Text('SUBUH'),
//                         subtitle:
//                             Text(snapshot.data.results.datetime[0].times.fajr),
//                       ),
//                       ListTile(
//                         trailing: Image.asset('images/terbit.png'),
//                         title: Text('TERBIT'),
//                         subtitle: Text(
//                             snapshot.data.results.datetime[0].times.sunrise),
//                       ),
//                       ListTile(
//                         trailing: Image.asset('images/zuhur.png'),
//                         title: Text('ZUHUR'),
//                         subtitle:
//                             Text(snapshot.data.results.datetime[0].times.dhuhr),
//                       ),
//                       ListTile(
//                         trailing: Image.asset('images/ashar.png'),
//                         title: Text('ASAR'),
//                         subtitle:
//                             Text(snapshot.data.results.datetime[0].times.asr),
//                       ),
//                       ListTile(
//                         trailing: Image.asset('images/magrib.png'),
//                         title: Text('MAGRIB'),
//                         subtitle: Text(
//                             snapshot.data.results.datetime[0].times.maghrib),
//                       ),
//                       ListTile(
//                         trailing: Image.asset('images/isya.png'),
//                         title: Text('ISYA'),
//                         subtitle:
//                             Text(snapshot.data.results.datetime[0].times.isha),
//                       ),