import 'package:flutter/material.dart';
import 'package:Demo/routs/route_names.dart';

class helpPage extends StatefulWidget {
  @override
  _helpPageState createState() => _helpPageState();
}

class _helpPageState extends State<helpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('help Page'),
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