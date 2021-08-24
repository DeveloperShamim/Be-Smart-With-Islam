import 'package:flutter/material.dart';

class CardDoa extends StatelessWidget {
  const CardDoa({
    Key key,
    @required this.title,
    @required this.arabic,
    @required this.latin,
    @required this.fontarabic,
    @required this.terjemahan,
    @required this.translate,
  }) : super(key: key);

  final String title;
  final String arabic;
  final String latin;
  final double fontarabic;
  final bool terjemahan;
  final String translate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 3.0,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/arabicpattern1.JPG"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          padding: EdgeInsets.all(6),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                  height: 1.5, fontSize: 20, fontWeight: FontWeight.w700),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 1),
                  child: Column(
                    children: [
                      Text(
                        arabic,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'উচ্চারণ :  ' + latin,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                if (terjemahan)
                  Text(
                    "অর্থ : " + translate,
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 14,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
