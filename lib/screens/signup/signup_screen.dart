import 'package:enimilo/screens/signup/components/body.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  static String routeName = "/signup";
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Body());
  }
}
