import 'package:flutter/material.dart';
import 'package:Demo/config/theme.dart';
import 'package:Demo/localization/localization_methods.dart';
import 'package:Demo/routs/route_names.dart';
class sideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle = TextStyle(
        color: Color(0xff5f5f5f),
        fontSize: 15
    );
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width /1.4,
      color:AppColors.white,
      child: ListView(
        padding: EdgeInsets.only(top:25),
        children: <Widget>[
          /*DrawerHeader(
             child: Container(
               height: 100,
               child: CircleAvatar(),
             ),
           ),*/
          ListTile(
            leading: Icon(
              Icons.home_outlined,
              color: Color(0xff7b7b7b),
              size: 23,
            ),
            title: Text(
              getTranslated(context,'home'),
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, homeRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.local_offer_outlined,
              color: Color(0xff7b7b7b),
              size: 23,
            ),
            title: Text(
              getTranslated(context,'offers'),
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, offersRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.notifications_none,
              color: Color(0xff7b7b7b),
              size: 23,
            ),
            title: Text(
              getTranslated(context,'notifications'),
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, notificationsRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.bookmark_border_sharp,
              color: Color(0xff7b7b7b),
              size: 23,
            ),
            title: Text(
              getTranslated(context,'your_orders'),
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, ordersRoute);
            },
          ),
          /*ListTile(
            leading: Icon(
              Icons.payment_outlined,
              color: Color(0xff7b7b7b),
              size: 23,
            ),
            title: Text(
              getTranslated(context,'talabat_pay'),
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, payRoute);
            },
          ),*/
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Color(0xff7b7b7b),
              size: 23,
            ),
            title: Text(
              getTranslated(context,'settings'),
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, settingsRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.bookmark_border,
              color: Color(0xff7b7b7b),
              size: 23,
            ),
            title: Text(
              getTranslated(context,'vouchers'),
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, vouchersRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.help_center_outlined,
              color: Color(0xff7b7b7b),
              size: 23,
            ),
            title: Text(
              getTranslated(context,'get_help'),
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, helpRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info_outline,
              color: Color(0xff7b7b7b),
              size: 23,
            ),
            title: Text(
              getTranslated(context,'about_App'),
              style: _textStyle,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
        ],
      ),
    );
  }
}
