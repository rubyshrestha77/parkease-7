import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parkease/login.dart';

// class MyHome extends StatefulWidget {
//   @override
//   State<MyHome> createState() => _MyHomeState();
// }

// class _MyHomeState extends State<MyHome> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => MyLogin(),
//           ));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       decoration: const BoxDecoration(
//           gradient: LinearGradient(
//               colors: [Colors.deepPurple, Colors.purpleAccent],
//               begin: Alignment.topRight,
//               end: Alignment.bottomRight)),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: const [
//           Image(image: AssetImage('images/buspng.png')),
//         ],
//       ),
//     ));
//     // throw UnimplementedError();
//   }
// }
//meroo

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyLogin(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromARGB(255, 98, 190, 236),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(image: AssetImage('images/logopng.png')),
        ],
      ),
    ));
    // // TODO: implement build
    // throw UnimplementedError();
  }
}

//not usedd

// class MyHome extends StatefulWidget {
//   const MyHome({super.key});

//   @override
//   State<MyHome> createState() => _MyHomeState();
// }

// class _MyHomeState extends State<MyHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color.fromARGB(255, 98, 190, 236),
//       padding: const EdgeInsets.all(10),
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           children: [
//             Container(
//               padding: EdgeInsets.only(
//                 top: 20,
//               ),
//               margin: EdgeInsets.all(10),
//               child: Column(
//                 children: [
//                   Container(
//                     padding: EdgeInsets.only(
//                         left: 20, top: 50, right: 20, bottom: 40),

//                     //padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//                     child: Text(
//                       '  Welcome to ParkEase',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontFamily: 'Raleway',
//                           fontSize: 30,
//                           fontWeight: FontWeight.w500),
//                       textDirection: TextDirection.rtl,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(
//                         top: 0, left: 5, bottom: 5, right: 5),
//                     // padding: EdgeInsets.only(left: 100,top: 100, right: 25, bottom: 10),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(40),
//                         topRight: Radius.circular(40),
//                         bottomRight: Radius.circular(40),
//                         bottomLeft: Radius.circular(40),
//                       ),
//                       color: Color.fromARGB(255, 243, 238, 238),
//                     ),
//                     height: 550,
//                     width: MediaQuery.of(context).size.height * 0.9,
//                     child: Column(
//                       children: [
//                         Container(
//                           // padding: EdgeInsets.only(left: 10, right: 90, bottom: 150,top: 20),
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 20),
//                           // child: Text(
//                           //   'Welcome to ParkEase',
//                           //   style: TextStyle(color: Colors.black, fontSize: 30),
//                           //   textDirection: TextDirection.ltr,
//                           //   textAlign: TextAlign.center,
//                           // ),
//                         ),
//                         SizedBox(
//                           height: 50,
//                           width: 100,
//                         ),
//                         Container(
//                           // padding: const EdgeInsets.all(110),
//                           padding: EdgeInsets.only(
//                             top: 200,
//                           ),
//                           decoration: BoxDecoration(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(8.0)),
//                             image: DecorationImage(
//                               image: AssetImage('images/HomePage.png'),
//                             ),
//                             // boxShadow: [
//                             //   BoxShadow(
//                             //     color: Color.fromARGB(255, 98, 190, 236),
//                             //     spreadRadius: 1,
//                             //     blurRadius: 1,
//                             //   ),
//                             // ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 30,
//                           width: 10,
//                         ),
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 8),
//                           height: 60,
//                           width: MediaQuery.of(context).size.width * 0.4,
//                           margin: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             color: Color.fromARGB(255, 98, 190, 236),
//                           ),
//                           child: TextButton(
//                             onPressed: () {
//                               // Navigator.pushNamed(context, 'login')
//                               // ;
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => MyLogin()),
//                               );
//                             },
//                             child: Text(
//                               "Login",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
