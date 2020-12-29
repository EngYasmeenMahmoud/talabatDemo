import 'package:flutter/material.dart';
import 'package:Demo/localization/localization_methods.dart';
class homeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu),
          Column(children: <Widget>[
            Text(
              getTranslated(context,'home'),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15,color:Colors.grey[200] ),
            ),
            Row(children: <Widget>[
              Text(
                getTranslated(context,'home'),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15,color:Colors.grey[200] ),
              ),
              Icon(Icons.share),
            ]),
          ]),
          Icon(Icons.search),
        ],
      ),
    );
  }
}
