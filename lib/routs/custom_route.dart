import 'package:flutter/material.dart';
import 'package:Demo/pages/about_page.dart';
import 'package:Demo/pages/help_page.dart';
import 'package:Demo/pages/home_page.dart';
import 'package:Demo/pages/not_found_page.dart';
import 'package:Demo/pages/notifications_page.dart';
import 'package:Demo/pages/offers_page.dart';
import 'package:Demo/pages/orders_page.dart';
import 'package:Demo/pages/pay_page.dart';
import 'package:Demo/pages/settings_page.dart';
import 'package:Demo/pages/splashPage.dart';
import 'package:Demo/pages/vouchers_page.dart';
import 'package:Demo/routs/route_names.dart';

class CustomRoute {

  static Route<dynamic> allRoutes(RouteSettings settings) {
       switch (settings.name) {
         case homeRoute:
           return MaterialPageRoute(builder: (_) => HomePage());
         case offersRoute:
           return MaterialPageRoute(builder: (_) => offersPage());
         case notificationsRoute:
           return MaterialPageRoute(builder: (_) => notificationsPage());
         case ordersRoute:
           return MaterialPageRoute(builder: (_) => ordersPage());
         case payRoute:
           return MaterialPageRoute(builder: (_) => payPage());
         case settingsRoute:
           return MaterialPageRoute(builder: (_) => SettingsPage());
         case vouchersRoute:
           return MaterialPageRoute(builder: (_) => vouchersPage());
         case helpRoute:
           return MaterialPageRoute(builder: (_) => helpPage());
         case aboutRoute:
           return MaterialPageRoute(builder: (_) => AboutPage());
         case splashRoute:
           return MaterialPageRoute(builder: (_) => splashPage());

       }
       return MaterialPageRoute(builder: (_) => NotFoundPage());
  }


}

