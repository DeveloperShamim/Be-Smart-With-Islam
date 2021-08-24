import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
// import 'package:package_info/package_info.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  String version = '0';
  String buildNumber = '0';
  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        version = packageInfo.version;
        buildNumber = packageInfo.buildNumber;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F1D3A),
      appBar: AppBar(
        backgroundColor: Color(0xFF0F1D3A),
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('About'),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 0,
              child: ListTile(
                title: Text('Version'),
                trailing: Text('$version+$buildNumber'),
              ),
            ),
            // Card(
            //   elevation: 0,
            //   child: ListTile(
            //     title: Text('Quran'),
            //     trailing: Text('@rioastamal'),
            //   ),
            // ),
            // Card(
            //   elevation: 0,
            //   child: ListTile(
            //     title: Text('Asmaul Husna'),
            //     trailing: Text('jagad.id'),
            //   ),
            // ),
            Card(
              elevation: 2,
              child: ListTile(
                //title: Text('Application'),
                title: Text("Developed by Mohammad Shamim Hossain"),
                subtitle: Text("Email: mohammadshamim.1998@yahoo.com"),
              ),
            ),
            Spacer(),
            Center(
                child: Text(
              'Made With Love',
              style: TextStyle(
                color: Colors.white,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
