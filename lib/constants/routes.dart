import 'package:enimilo/screens/signin/signin_screen.dart';
import 'package:enimilo/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:enimilo/screens/splash/splash_screen.dart';
import 'package:enimilo/screens/story/story_screen.dart';
import 'package:enimilo/screens/scan/scan_screen.dart';
import 'package:enimilo/screens/chatroom/chatroom_screen.dart';
import 'package:enimilo/screens/chatscreen/chatscreen.dart';
import 'package:enimilo/screens/funding/funding_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignUp.routeName: ((context) => const SignUp()),
  SignIn.routeName: ((context) => const SignIn()),
  StoryScreen.routeName: ((context) => const StoryScreen()),
  ScanScreen.routeName: ((context) => const ScanScreen()),
  ChatRoom.routeName: ((context) => const ChatRoom()),
  ChatScreen.routeName: ((context) => const ChatScreen()),
  FundingScreen.routeName: ((context) => const FundingScreen())
};
