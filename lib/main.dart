import 'package:flutter/material.dart';
import 'package:snaptrip/homepage.dart';
import 'package:snaptrip/schedule.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:snaptrip/Slashscreen.dart';
// import 'package:snaptrip/Snaptriplogin.dart';

// import 'package:snaptrip/homepage.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       routes: {
//         '/': (context) => HomeScreen(),
//         '/login': (context) => const LoginScreen(),
//       },
//     );
//   }
// }
