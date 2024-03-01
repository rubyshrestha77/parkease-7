// import 'package:flutter/material.dart';
// import 'package:parkease/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parkease/get_lat_long_address.dart';
import 'package:parkease/home_page.dart';
import 'package:parkease/login.dart';
import 'package:parkease/login_as_admin.dart';
import 'package:parkease/register.dart';
import 'package:parkease/user_provider.dart';
import 'package:provider/provider.dart';

// ignore: unused_import
// import 'package:khalti_flutter/khalti_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // KhaltiScope(
  //     publicKey: 'test_public_key_3dbd468b83e044e0882d9029da94474a',
  //     builder: (context, navigatorKey) {
  //       return MaterialApp(
  //         navigatorKey: navigatorKey,
  //         supportedLocales: const [
  //           Locale('en', 'US'),
  //           Locale('ne', 'NP'),
  //         ],
  //         localizationsDelegates: const [
  //           KhaltiLocalizations.delegate,
  //         ],
  //       );
  //     });
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(), // Initialize the UserProvider
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: 'home_page',
      initialRoute: 'login',
      // initialRoute: 'get_lat_long_address',
      routes: {
        'login': (context) => MyLogin(),
        'register': (context) => MyRegister(),
        'home_page': (context) => MyHome(),
        'login_as_admin': (context) => LoginAsAdmin(),
        'get_lat_long_address': (context) => GetLatLongScreen(),
      },
    );
  }
}

//main.dart


// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     initialRoute: 'home_page',
//     routes: {
//       'login': (context) => MyLogin(),
//       'register': (context) => MyRegister(),
//       'home_page': (context) => MyHome(),
//       'login_as_admin': (context) => LoginAsAdmin(),
//     },
//   ));
// }
