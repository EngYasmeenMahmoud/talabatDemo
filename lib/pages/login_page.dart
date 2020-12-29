import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:Demo/localization/localization_methods.dart';
import 'package:Demo/models/Contact.dart';
import 'package:Demo/models/ContactService.dart';
import 'package:Demo/pages/register_page.dart';
import 'package:intl/intl.dart';
class loginPage extends StatefulWidget {

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  Contact newContact = new Contact();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController _controller = new TextEditingController();
  List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
  String _color = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(getTranslated(context,'login'),),
      ),
      body:  SafeArea(
          child: Form(
                key: _formKey,
                autovalidate: true,
                child: new ListView(
                  padding: EdgeInsets.all(20.0),
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Container(
                      alignment: Alignment.center,
                      child:RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "My First App",
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 16.0,color: Colors.deepOrange)),
                            TextSpan(
                              text: "\n",),
                            TextSpan(
                                text: getTranslated(context,'smile'),
                                style: TextStyle(fontWeight: FontWeight.normal,
                                    fontSize: 12.0,color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    TextFormField(
                      decoration:  InputDecoration(
                        icon:  Icon(Icons.email,color: Colors.deepOrange,size: 14,),
                        hintText:getTranslated(context, "emailHint") ,
                        labelText: getTranslated(context, "email"),
                      ),
                      style: TextStyle(fontSize: 14),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => newContact.isValidEmail(value)
                          ? null
                          :getTranslated(context, "invalidDataTyped"),
                      onSaved: (val) => newContact.email = val,
                    ),
                    TextFormField(
                      decoration:  InputDecoration(
                        icon:  Icon(Icons.lock,color: Colors.deepOrange,size: 14,),
                        hintText:getTranslated(context, "passwordHint") ,
                        labelText: getTranslated(context, "password"),
                      ),
                      style: TextStyle(fontSize: 14),
                      obscureText:true,
                      validator: (value) => value.trim().isEmpty
                          ?getTranslated(context, "invalidDataTyped")
                          : null,
                      onSaved: (val) => newContact.email = val,
                    ),
                    SizedBox(height: 20,),
                    Column(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,children: [
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.deepOrange)),
                          color: Colors.white,
                          textColor: Colors.deepOrange,
                          padding: EdgeInsets.all(8.0),
                          onPressed: () {
                            _submitForm();
                          },
                          child: Text(getTranslated(context,'login'),style: TextStyle(fontSize: 14.0,),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              child: new Text(getTranslated(context, "don'tHaveAccount"),
                                  style: new TextStyle(color: Color(0xFF2E3233))),
                              onTap: () {},
                            ),
                            GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterPage(),
                                    ),
                                  );
                                },
                                child: new Text(
                                  'Register.',
                                  style: new TextStyle(
                                      color: Colors.deepOrange, fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ],),

                  ],
                )),

      ),
      );
  }
  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = newContact.convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now) ? initialDate : now);

    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());

    if (result == null) return;

    setState(() {
      _controller.text = new DateFormat.yMd().format(result);
    });
  }
  void _submitForm() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      showMessage(getTranslated(context, "invalidForm"));
    } else {
      form.save(); //This invokes each onSaved event
      var contactService = new ContactService();
      contactService.createContact(newContact)
          .then((value) =>
          showMessage('New contact created for ${value.name}!', Colors.blue)
      );
    }
  }
  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(backgroundColor: color, content: new Text(message)));
  }
}