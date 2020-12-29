import 'package:Demo/localization/localization_methods.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import '../main.dart';

class LanguagesScreen extends StatefulWidget {
  @override
  _LanguagesScreenState createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  int languageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Languages')),
      body: SettingsList(
        sections: [
          SettingsSection(tiles: [
            SettingsTile(
              title: "English",

              trailing: trailingWidget(0),
              onTap: () {
                changeLanguage(0);
              },
            ),
            SettingsTile(
              title: "Arabic",

              trailing: trailingWidget(1),
              onTap: () {
                changeLanguage(1);
              },
            ),
          ]),
        ],
      ),
    );
  }

  Widget trailingWidget(int index) {
    return (languageIndex == index)
        ? Icon(Icons.check, color: Colors.deepOrange)
        : Icon(null);
  }
  void _changeLanguage(int index) async {
    String languageCode="en";
    if(index==1) languageCode="ar";
    Locale _temp = await setLocale(languageCode);
    MyApp.setLocale(context, _temp);
    //Navigator.of(context).pop(false);


  }
  void changeLanguage(int index)  {
    setState(() {
      languageIndex = index;

    });
    _changeLanguage(index);
  }
}