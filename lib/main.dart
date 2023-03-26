import 'package:enimilo/constants/routes.dart';
import 'package:enimilo/screens/chatroom/chatroom_screen.dart';
import 'package:enimilo/screens/splash/splash_screen.dart';
import 'package:enimilo/services/authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enimilo',
      theme: ThemeData(
          // is not restarted.
          primarySwatch: Colors.green,
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black),
              color: Colors.white,
              elevation: 0),
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(width: 2, color: Colors.green),
            ),
          )),
      home: StreamBuilder(
        stream: Authentication().firebaseAuth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const ChatRoom();
          } else {
            return const SplashScreen();
            //return HomeScreen();
          }
        },
      ),
      routes: routes,
    );
  }
}
