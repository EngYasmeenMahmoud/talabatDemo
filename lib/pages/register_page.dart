import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:Demo/localization/localization_methods.dart';
import 'package:Demo/models/Contact.dart';
import 'package:Demo/models/ContactService.dart';
import 'package:intl/intl.dart';
class RegisterPage extends StatefulWidget {

  @override
  _registerPageState createState() => _registerPageState();
}

class _registerPageState extends State<RegisterPage> {
  Contact newContact = new Contact();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController _controller = new TextEditingController();
  List<String> _colors = <String>['', 'male', 'female'];
  String _color = '';

 /* @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _colors = <String>[ getTranslated(context, "male"), getTranslated(context, "female")];
    });
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(getTranslated(context, "register")),
      ),
      body: new SafeArea(
          child:  new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  SizedBox(height: 20,),
                  new TextFormField(
                    decoration:  InputDecoration(
                      icon: const Icon(Icons.person,color: Colors.deepOrange,size: 14,),
                      hintText: getTranslated(context, "nameHint"),
                      labelText: getTranslated(context, "name"),
                    ),
                    style: TextStyle(fontSize: 14),
                    inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                    validator: (val) => val.isEmpty ?
                    getTranslated(context, "required") : null,
                     onSaved: (val) => newContact.name = val,
                  ),
                  new Row(children: <Widget>[
                    new Expanded(
                        child: new TextFormField(
                          decoration: new InputDecoration(
                            icon: const Icon(Icons.calendar_today,color: Colors.deepOrange,size: 14,),
                            hintText: getTranslated(context, "datehint"),
                            labelText: getTranslated(context,"dateOfBirth"),
                          ),
                          style: TextStyle(fontSize: 14),
                          controller: _controller,
                          keyboardType: TextInputType.datetime,
                          validator: (val) =>
                          newContact.isValidDob(val) ? null : getTranslated(context,"invalidDataTyped"),
                          onSaved: (val) => newContact.dob = convertToDate(val),
                        )),
                    new IconButton(
                      icon: new Icon(Icons.more_horiz,color: Colors.deepOrange,size: 14,),
                      tooltip: 'Choose date',
                      onPressed: (() {
                        _chooseDate(context, _controller.text);
                      }),
                    )
                  ]),
                  new TextFormField(
                    decoration:  InputDecoration(
                      icon: const Icon(Icons.phone,color: Colors.deepOrange,size: 14,),
                      hintText: getTranslated(context,"phoneHint"),
                      labelText: getTranslated(context,"phone"),
                    ),
                    style: TextStyle(fontSize: 14),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      new WhitelistingTextInputFormatter(
                          new RegExp(r'^[()\d -]{1,15}$')),
                    ],
                    validator: (value) => isValidPhoneNumber(value)
                        ? null
                        : getTranslated(context,"invalidDataTyped"),
                    onSaved: (val) => newContact.phone = val,
                  ),
                  new TextFormField(
                    decoration:  InputDecoration(
                      icon: const Icon(Icons.email,color: Colors.deepOrange,size: 14,),
                      hintText: getTranslated(context,"emailHint"),
                      labelText: getTranslated(context,"email"),
                    ),
                    style: TextStyle(fontSize: 14),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => isValidEmail(value)
                        ? null
                        : getTranslated(context,"invalidDataTyped"),
                    onSaved: (val) => newContact.email = val,
                  ),
                  new FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.merge_type,color: Colors.deepOrange,size: 14,),
                          labelText: getTranslated(context,"gender"),
                          labelStyle: TextStyle(fontSize: 14),
                          errorText: state.hasError ? state.errorText : null,
                        ),
                        isEmpty: _color == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton<String>(
                            value: _color,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                newContact.favoriteColor = newValue;
                                _color = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _colors.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                    validator: (val) {
                      return val != '' ? null : getTranslated(context, "invalidDataTyped");
                    },
                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                      child:FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.deepOrange)),
                        color: Colors.white,
                        textColor: Colors.deepOrange,
                        padding: EdgeInsets.all(8.0),
                        onPressed: () {
                          _submitForm();
                        },
                        child: Text(getTranslated(context,'createNewAccount'),style: TextStyle(fontSize: 14.0,),),
                      ),
                      ),
                ],
              ))
      ),
    );
  }
  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
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
  List<String>_getColors()
  {
    List<String> _colorsList = <String>['', 'blue', 'orange'];
    return _colorsList;
  }
  bool isValidEmail(String input) {
    final RegExp regex = new RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }
  DateTime convertToDate(String input) {
    try
    {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }
  bool isValidDob(String dob) {
    if (dob.isEmpty) return true;
    var d = convertToDate(dob);
    return d != null && d.isBefore(new DateTime.now());
  }
  bool isValidPhoneNumber(String input) {
    //0776233475, +94776233475, 094776233475
    final RegExp regex = new RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    return regex.hasMatch(input);
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