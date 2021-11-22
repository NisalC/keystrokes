import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutterfbauth/services/authservice.dart';
import 'package:flutterfbauth/alert_page.dart';
import 'package:flutterfbauth/home_page.dart';
import 'globals.dart' as globals;

class AddMeasures extends StatefulWidget {
  @override
  _AddMeasuresState createState() => _AddMeasuresState();
}

class _AddMeasuresState extends State<AddMeasures>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animationIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;
  var _user_name = "";
  var _random_text = '';

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });

    _animationIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _buttonColor = ColorTween(begin: Colors.green, end: Colors.green[900])
        .animate(CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.00, 1.00, curve: Curves.linear)));

    _translateButton = Tween<double>(begin: _fabHeight, end: -14.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.00, 0.75, curve: _curve)));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget buttonAdd() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Open for add Configurations',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buttonClassification() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Classifications',
        child: Icon(Icons.assessment),
      ),
    );
  }

  Widget buttonAddMeasures() {
    return Container(
      child: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Measures',
        child: Icon(Icons.dashboard_customize),
      ),
    );
  }

  Widget buttonToggle() {
    return Container(
        child: FloatingActionButton(
      backgroundColor: _buttonColor.value,
      onPressed: animate,
      tooltip: 'Toggle',
      child: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: _animationIcon,
      ),
    ));
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  showAlertDialog(BuildContext context) {
    // Create button
    // ignore: deprecated_member_use
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Classified User: $_user_name"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    var charArr = [];
    return new Scaffold(
      appBar: AppBar(
        title: Text('Biometrics'),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text('Nisal C'),
            ),
            ListTile(
              title: const Text('Sign Out'),
              onTap: () {
                AuthService().signOut();
              },
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                MyAlert();
              },
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          Text('Enter Text Below'),
          Text('Random text goes here $_random_text'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              onChanged: (text) {
                findTimeDifference(text);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Above Text Field',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              getTheTimeDifference();
            },
            child: Text('Accept'),
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.green,
              onSurface: Colors.green[900],
            ),
          ),
          TextButton(
            onPressed: () {
              HomePage();
            },
            child: Text('Cancel'),
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.green,
              onSurface: Colors.green[900],
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Transform(
            transform: Matrix4.translationValues(
                0.0, _translateButton.value * 3.0, 0.0),
            child: buttonAdd(),
          ),
          Transform(
            transform: Matrix4.translationValues(
                0.0, _translateButton.value * 3.0, 0.0),
            child: buttonAdd(),
          ),
          Transform(
            transform: Matrix4.translationValues(
                0.0, _translateButton.value * 3.0, 0.0),
            child: buttonClassification(),
          ),
          Transform(
            child: buttonAddMeasures(),
            transform: Matrix4.translationValues(
                0.0, _translateButton.value * 3.0, 0.0),
          ),
          buttonToggle(),
        ],
      ),
    );
  }
}

void findTimeDifference(String text) {
  TimeOfDay time = TimeOfDay.now();
  // print('Hi');
  globals.charArray[globals.i] = text;
  globals.charTimesArray[globals.i] = time;
  globals.i++;
}

void getTheTimeDifference() {
  int j = globals.i;
  for (var k = 0; k < j - 1; k++) {
    globals.timeDifference[k] =
        globals.charTimesArray[k + 1] - globals.charTimesArray[k];
  }
}
