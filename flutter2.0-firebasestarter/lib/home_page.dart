import 'package:flutter/material.dart';
import 'package:flutterfbauth/services/authservice.dart';
import 'package:flutterfbauth/alert_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('You are logged in'),
      // ElevatedButton(
      //     onPressed: () {
      //
      //     },
      // child: Center(child: Text('LOG OUT')))
      Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text('Behavioral Biometrics'),
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
    ]));
  }
}
