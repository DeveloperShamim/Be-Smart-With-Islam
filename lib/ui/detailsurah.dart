import 'package:al_quran/data/models/allsurah.dart';
import 'package:al_quran/data/services.dart';
import 'package:al_quran/data/uistate.dart';
import 'package:al_quran/data/utils/style.dart';
import 'package:al_quran/ui/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailSurah extends StatefulWidget {
  final detail, index;
  DetailSurah({Key key, @required this.detail, this.index}) : super(key: key);

  @override
  _DetailSurahState createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  @override
  Widget build(BuildContext context) {
    var ui = Provider.of<UiState>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF0F1D3A),
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(widget.detail),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              },
            )
          ],
        ),
        body: FutureBuilder<AllSurah>(
          future: ServiceData().loadSurah(widget.index),
          builder: (c, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: snapshot.data.text.length,
                    itemBuilder: (BuildContext c, int i) {
                      String key = snapshot.data.text.keys.elementAt(i);
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Card(
                              elevation: 2,
                              color: Colors.indigo[100],
                              child: ListTile(
                                leading: Container(
                                  margin: EdgeInsets.all(0),
                                  padding: EdgeInsets.all(5),
                                  //margin: EdgeInsets.only(right: 2,top: 2,left: 20),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    snapshot.data.text.keys.elementAt(i),

                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  '${snapshot.data.text[key]}',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontFamily: 'arabic',
                                    fontSize: ui.fontSize,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ),
                            if (ui.terjemahan)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  AppStyle.spaceH10,
                                  AppStyle.spaceH5,

                                  Text(

                                    snapshot.data.translations.id.text[key],
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(

                                      fontSize: ui.fontSizetext,
                                    ),
                                  ),
                                ],
                              ),
                            if (ui.tafsir)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  AppStyle.spaceH10,
                                  Text(
                                    'Tafsir Kemenag',
                                    style: AppStyle.end2subtitle,
                                  ),
                                  AppStyle.spaceH5,
                                  Text(
                                    snapshot.data.tafsir.id.kemenag.text[key],
                                    style: TextStyle(
                                      fontSize: ui.fontSizetext,
                                    ),
                                  ),
                                ],
                              )
                          ],
                        ),
                      );
                    })
                : Center(child: CircularProgressIndicator());
          },
        ));
  }
}
