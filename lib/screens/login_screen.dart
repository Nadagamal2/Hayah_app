//  import 'package:flutter/material.dart';
// import 'package:hayat/screens/bottom.dart';
// import 'package:hayat/screens/home_screen.dart';
// import 'package:hayat/screens/sign_in_screen.dart';
//
// class LogInScreen extends StatefulWidget {
//
//   @override
//   State<LogInScreen> createState() => _LogInScreenState();
// }
//
// class _LogInScreenState extends State<LogInScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//           stream: FirebaseAuth.instance.authStateChanges(),
//          builder: (context,snapshot){
//             if(snapshot.hasData){
//               return BottomNav();}
//             else {
//               return SignInScreen();
//             }
//
//     },
//     ));
//
//   }
// }
