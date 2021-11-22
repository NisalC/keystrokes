import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'package:flutterfbauth/alert_page.dart';
import 'package:flutterfbauth/services/authservice.dart';

class DisplayValues extends StatefulWidget {
  @override
  _DisplayValuesState createState() => _DisplayValuesState();
}

class _DisplayValuesState extends State<DisplayValues>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
  }
}
