// import 'dart:html';

// import 'dart:ui' show lerpDouble;

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:parkease/adminavbar.dart';
// import 'package:parkease/navbar.dart';
// import 'package:parkease/parking_status.dart';
import 'package:parkease/admin.dart';

// import 'admin.dart';

// ignore: must_be_immutable
class Myadmin extends StatelessWidget {
  // const Dashboard({super.key});
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Color.fromARGB(255, 98, 190, 236),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
              height: height * 0.30,
              width: width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 35,
                        left: 15,
                        right: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyNavBar()),
                              );
                            },
                            child: Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 70,
                        left: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // "Let's find a parking space...",
                            "Admin Dashboard",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 230, 225, 225),
                              fontFamily: 'Raleway',
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.75,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 238, 238),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              height: height * 0.70,
              width: width,
              padding: EdgeInsets.only(
                top: 70,
                left: 10,
                right: 10,
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 200),
                // padding: EdgeInsets.only(left: 20),
                // width: width * 2,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shadowColor: Color.fromARGB(255, 98, 190, 236),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FirebaseTableWidget()),
                      // MaterialPageRoute(builder: (context) => navData[0]),
                    );
                  },
                  child: Text('View User Details',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 98, 190, 236),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
