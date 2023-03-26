import 'package:enimilo/screens/chatroom/chatroom_screen.dart';
import 'package:enimilo/services/authentication.dart';
import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../services/database.dart';
import '../../chatscreen/chatscreen.dart';
import 'package:enimilo/preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String Username = "";
  bool _isLoading = false;
  Authentication authService = Authentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        shadowColor: Colors.transparent,
        backgroundColor: const Color(0xFFFFFFF),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hi!",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.green.shade900,
                          fontFamily: "krona",
                          fontWeight: FontWeight.w300))),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Create a new account",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.green.shade800,
                      fontSize: 17,
                      fontFamily: "Muli",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      icon: const Icon(
                        Icons.account_circle,
                        color: Colors.green,
                      ),
                      hintStyle: const TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                        letterSpacing: 4,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintText: "Enter Your Username"),
                  onChanged: (val) {
                    setState(() {
                      Username = val;
                    });
                  },
                  validator: (val) {
                    if (val!.isNotEmpty) {
                      return null;
                    } else {
                      return "Name cannot be empty";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      icon: const Icon(
                        Icons.email,
                        color: Colors.green,
                      ),
                      hintStyle: const TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                        letterSpacing: 4,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintText: "Enter your email"),
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                  validator: (val) {
                    return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!)
                        ? null
                        : "Please enter a valid email";
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          icon: const Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.green,
                          ),
                          hintStyle: const TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            letterSpacing: 4,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          hintText: "Enter your password"),
                      validator: (val) {
                        if (val!.length < 6) {
                          return "Password must be at least 6 characters";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      }),
                ),
              ),
              GestureDetector(
                onTap: register,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.green,
                        )
                      : const Button(text: "SIGN UP"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Or"),
                    ),
                    Expanded(child: Divider(color: Colors.black, thickness: 1))
                  ],
                ),
              ),
              const Text(
                "Social Media Login",
                style: TextStyle(color: Colors.green),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage("assets/icons/google.png"),
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account"),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: Colors.green),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showSnackbar(context, color, message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontSize: 14),
        ),
        backgroundColor: color,
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: "OK",
          onPressed: () {},
          textColor: Colors.white,
        ),
      ),
    );
  }

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .register(Username, email, password, context)
          .then((value) async {
        if (value == true) {
          // saving the shared preference state
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(Username);
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, ChatRoom.routeName);
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }
}
