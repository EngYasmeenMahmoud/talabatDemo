import 'package:flutter/material.dart';
import 'package:Demo/localization/localization_methods.dart';
import 'package:Demo/widgets/sideMenu.dart';
import 'package:settings_ui/settings_ui.dart';

import '../main.dart';
import 'home_page.dart';
import 'lang_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) => HomePage()),
            ModalRoute.withName('/')
        );
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Settings UI')),
        body: SettingsList(
          // backgroundColor: Colors.orange,
          sections: [
            SettingsSection(
              title: 'Common',
              // titleTextStyle: TextStyle(fontSize: 30),
              tiles: [
                SettingsTile(
                  title: 'Language',
                  subtitle: 'English',
                  leading: Icon(Icons.language),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => LanguagesScreen()));
                  },
                ),
                SettingsTile(
                  title: 'Environment',
                  subtitle: 'Production',
                  leading: Icon(Icons.cloud_queue),
                  onTap: () => print('e'),
                ),
              ],
            ),
            SettingsSection(
              title: 'Account',
              tiles: [
                SettingsTile(title: 'Phone number', leading: Icon(Icons.phone)),
                SettingsTile(title: 'Email', leading: Icon(Icons.email)),
                SettingsTile(title: 'Sign out', leading: Icon(Icons.exit_to_app)),
              ],
            ),
            SettingsSection(
              title: 'Security',
              tiles: [
                SettingsTile.switchTile(
                  title: 'Lock app in background',
                  leading: Icon(Icons.phonelink_lock),
                  switchValue: lockInBackground,
                  onToggle: (bool value) {
                    setState(() {
                      lockInBackground = value;
                      notificationsEnabled = value;
                    });
                  },
                ),
                SettingsTile.switchTile(
                  title: 'Change password',
                  leading: Icon(Icons.lock),
                  switchValue: true,
                  onToggle: (bool value) {},
                ),
                SettingsTile.switchTile(
                  title: 'Enable Notifications',
                  enabled: notificationsEnabled,
                  leading: Icon(Icons.notifications_active),
                  switchValue: true,
                  onToggle: (value) {},
                ),
              ],
            ),
            SettingsSection(
              title: 'Misc',
              tiles: [
                SettingsTile(
                    title: 'Terms of Service', leading: Icon(Icons.description)),

              ],
            ),
            CustomSection(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 22, bottom: 8),
                    child: Image.asset(
                      'assets/settings.png',
                      height: 50,
                      width: 50,
                      color: Color(0xFF777777),
                    ),
                  ),
                  Text(
                    'Version: 2.4.0 (287)',
                    style: TextStyle(color: Color(0xFF777777)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 //===============================
  /*@override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) => HomePage()),
            ModalRoute.withName('/')
        );
      },
      child: Scaffold(
        drawer: sideMenu(),
        appBar: AppBar(
          title:Text(getTranslated(context, "settings")),
          centerTitle: true,
          //backgroundColor: Colors.transparent,
          //elevation: 0.0,
        ),
        body:  Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => _showMyDialog(),
                  child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getTranslated(context, "language"),
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.normal),
                      ),
                    Row(
                      children: [
                        Text(
                          'English',
                          style: new TextStyle(
                              color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.normal),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.grey,
                          size: 12,
                        ),
                      ],
                    ),
                    ],
                  )),

              ],),
          ),
        ),

      ),
    );
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(getTranslated(context, "language")),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  onTap: ()  {
                    _changeLanguage("en");
                },
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'English',
                        style: new TextStyle(
                            color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.normal),
                      ),
                      Icon(
                        Icons.check,
                        color: Colors.deepOrange,
                        size: 12,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(onTap: ()  {
                  _changeLanguage("ar");
                  },
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Arabic',
                        style: new TextStyle(
                            color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.normal),
                      ),
                      Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        );
      },
    );
  }
  void _changeLanguage(String languageCode) async {
    Locale _temp = await setLocale(languageCode);
    MyApp.setLocale(context, _temp);
    Navigator.of(context).pop(false);


  }
}
*/