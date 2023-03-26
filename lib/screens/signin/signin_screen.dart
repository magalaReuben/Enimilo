import 'package:enimilo/screens/signin/components/body.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  static String routeName = "/signin";
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Body());
  }
}
