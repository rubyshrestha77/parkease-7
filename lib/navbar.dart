// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:parkease/admin.dart';
import 'package:parkease/dashboard.dart';
// ignore: unused_import
import 'package:parkease/gatekeeper.dart';
import 'package:parkease/home_page.dart';
import 'package:parkease/login.dart';
import 'package:parkease/parking_details.dart';
import 'package:parkease/user_provider.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    // ignore: unused_local_variable
    String uid = userProvider.uid;
    String email = userProvider.email;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(""),
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Icon(Icons.account_circle),
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 98, 190, 236),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('My Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ParkingDetailsTable()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => FirebaseTableWidget()),
              // );
            },
          ),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign Out'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyLogin()),
                );
              })
        ],
      ),
    );
  }
}
