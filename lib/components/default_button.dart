// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.text,
    this.task = '',
  }) : super(key: key);
  final String text;
  final String task;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.greenAccent, Colors.green]),
          borderRadius: BorderRadius.circular(6.0)),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.normal, fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }

  Future<dynamic> emptyDefaultFunc() async {}
}
