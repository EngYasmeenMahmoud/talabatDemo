import 'package:flutter/material.dart';
import 'package:Demo/routs/route_names.dart';
import 'package:listview_utils/listview_utils.dart';

import 'home_page.dart';

class notificationsPage extends StatefulWidget {
  @override
  _notificationsPageState createState() => _notificationsPageState();
}

class _notificationsPageState extends State<notificationsPage> {
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
        appBar: AppBar(
          title: Text('notifications Page'),
        ),
        body: CustomListView(
          paginationMode: PaginationMode.page,
          initialOffset: 0,
          loadingBuilder: CustomListLoading.defaultBuilder,
          header: Container(
            height: 70,
            child: Center(
              child: Text('Sea your notifications',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange,
                  fontSize: 30,fontFamily: 'Courgette'),),
            ),
          ),
          /*footer: Container(
            height: 50,
            child: Center(
              child:Image(image: AssetImage('assets/images/not1.gif'),height: 60,width:60,fit:BoxFit.fill,),
            ),
          ),*/
          adapter: NetworkListAdapter(
            url: 'https://jsonplaceholder.typicode.com/posts',
            limitParam: '_limit',
            offsetParam: '_start',
          ),
          errorBuilder: (context, error, state) {
            return Column(
              children: <Widget>[
                Text(error.toString()),
                RaisedButton(
                  onPressed: () => state.loadMore(),
                  child: Text('Retry'),
                ),
              ],
            );
          },
          separatorBuilder: (context, _) {
            return Divider(height: 1);
          },
          empty: Center(
            child: Text('Empty'),
          ),
          itemBuilder: (context, _, item) {
            return ListTile(
              title: Text(item['title']),
              leading: Icon(Icons.notifications_none,),
            );
          },
        ),
      ),
    );
  }
}