import 'package:flutter/material.dart';
import 'package:Demo/routs/route_names.dart';

class vouchersPage extends StatefulWidget {
  @override
  _vouchersPageState createState() => _vouchersPageState();
}

class _vouchersPageState extends State<vouchersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('vouchers Page'),
      ),
      body: Container(
        child: MaterialButton(
          color: Colors.blue,
          child: Text('to  page'),
          onPressed: (){
            Navigator.pushNamed(context, settingsRoute);
          },
        ),
      ),
    );
  }
}