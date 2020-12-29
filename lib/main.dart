import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:Demo/localization/localization_methods.dart';
import 'package:Demo/localization/set_localization.dart';
import 'package:Demo/pages/home_page.dart';
import 'package:Demo/routs/custom_route.dart';
import 'package:Demo/routs/route_names.dart';
import 'package:intl/intl.dart';
import 'package:hexcolor/hexcolor.dart';

import 'config/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() {

    var f = new NumberFormat("###,###", "en_US");
    print(f.format(245315));

    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  Locale _local;

  void setLocale(Locale locale) {
    setState(() {
      _local = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._local = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_local == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch:AppColors.whitecolor,
            accentColor:Colors.deepOrange
        ),
        onGenerateRoute: CustomRoute.allRoutes,
        initialRoute: splashRoute,//homeRoute,
        locale: _local,
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ar', 'EG')
        ],
        localizationsDelegates: [
          SetLocalization.localizationsDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (deviceLocal, supportedLocales) {
          for (var local in supportedLocales) {
            if (local.languageCode == deviceLocal.languageCode &&
                local.countryCode == deviceLocal.countryCode) {
              return deviceLocal;
            }
          }
          return supportedLocales.first;
        },
      );
    }
  }
}

