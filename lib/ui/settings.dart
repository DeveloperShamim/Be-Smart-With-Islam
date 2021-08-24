import 'package:al_quran/data/location.dart';
import 'package:al_quran/data/themes.dart';
import 'package:al_quran/data/uistate.dart';
import 'package:al_quran/ui/widget/cardsetting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var ui = Provider.of<UiState>(context);
    var dark = Provider.of<ThemeNotifier>(context);

    var loc = Provider.of<LocationNotifier>(context);
    return Scaffold(
        backgroundColor: Color(0xFF0F1D3A),
        appBar: AppBar(
          backgroundColor: Color(0xFF0F1D3A),
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Settings'),
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'অবস্থান',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                loc.location,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.gps_fixed,
                  color: Colors.white,
                ),
                onPressed: () => loc.locationNow(),
              ),
            ),
            CardSetting(
              title: 'ডার্ক থিম',
              leading: Switch(
                value: dark.darkmode,
                onChanged: (newValue) => dark.switchTheme(newValue),
              ),
            ),
            CardSetting(
              title: 'অনুবাদ',
              leading: Switch(
                value: ui.terjemahan,
                onChanged: (newValue) => ui.terjemahan = newValue,
              ),
            ),
            // CardSetting(
            //   title: 'তাফসীর',
            //   leading: Switch(
            //     value: ui.tafsir,
            //     onChanged: (newValue) => ui.tafsir = newValue,
            //   ),
            // ),
            CardSlider(
              title: 'আরবি লেখার আকার',
              slider: Slider(
                min: 0.5,
                value: ui.sliderFontSize,
                onChanged: (newValue) => ui.fontSize = newValue,
              ),
              trailing: ui.fontSize.toInt().toString(),
            ),
            CardSlider(
              title: 'অনুবাদের আকার',
              slider: Slider(
                min: 0.4,
                value: ui.sliderFontSizetext,
                onChanged: (newValue) => ui.fontSizetext = newValue,
              ),
              trailing: ui.fontSizetext.toInt().toString(),
            ),
          ],
        ));
  }
}

class CardSlider extends StatelessWidget {
  const CardSlider({
    Key key,
    @required this.title,
    @required this.slider,
    @required this.trailing,
  }) : super(key: key);

  final String title;
  final Widget slider;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Card(
        elevation: 0,
        child: ListTile(
          contentPadding: EdgeInsets.only(top: 10, right: 30, left: 15),
          title: Text(title),
          subtitle: slider,
          trailing: Text(trailing),
        ),
      ),
    );
  }
}
