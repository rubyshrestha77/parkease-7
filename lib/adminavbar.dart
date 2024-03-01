// import 'dart:developer';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:parkease/admin.dart';
import 'package:parkease/admindashboard.dart';
// import 'package:parkease/dashboard.dart';
// import 'package:parkease/gatekeeper.dart';
// ignore: unused_import
import 'package:parkease/home_page.dart';
import 'package:parkease/login.dart';
// ignore: unused_import
import 'package:parkease/parking_details.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Admin"),
            accountEmail: Text("Admin123@gmail.com"),
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
                MaterialPageRoute(builder: (context) => Myadmin()),
              );
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.account_circle),
          //   title: Text('My Profile'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => ParkingDetailsScreen()),
          //     );
          //   },
          // ),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text('Setting'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => MyDataTable()),
          //     );
          //   },
          // ),
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
