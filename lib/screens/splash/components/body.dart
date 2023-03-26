import 'package:enimilo/constants/size_config.dart';
import 'package:enimilo/screens/signin/signin_screen.dart';
import 'package:enimilo/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:enimilo/components/default_button.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // ignore: non_constant_identifier_names
    void login_page() {
      Navigator.pushNamed(context, SignIn.routeName);
    }

    // ignore: non_constant_identifier_names
    void signup_page() {
      Navigator.pushNamed(context, SignUp.routeName);
    }

    List pages = [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          const Image(image: AssetImage("assets/images/Logo.jpg")),
          Text("Hello!",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.green.shade900,
                  fontFamily: "krona",
                  fontWeight: FontWeight.w300)),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: Text(
                "Welcome to Enimilo, designed \n to help you increase crop yield \n and improving farm efficiency",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.green.shade800,
                  fontSize: 17,
                  fontFamily: "Muli",
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Button(text: "Next"),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.green.shade900,
                  size: 10,
                ),
                Icon(
                  Icons.circle,
                  color: Colors.grey.shade500,
                  size: 10,
                ),
                Icon(
                  Icons.circle,
                  color: Colors.grey.shade500,
                  size: 10,
                )
              ],
            ),
          )
          //    Padding(
          //      padding: const EdgeInsets.all(15.0),
          //      child: Button(text: "LOGIN", task: login_page),
          //    ),
          //    Padding(
          //      padding: const EdgeInsets.all(15.0),
          //      child: Button(text: "SIGNUP", task: signup_page),
          //    )
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          SizedBox(
              height: getProportionateScreenHeight(350),
              width: getProportionateScreenWidth(300),
              child: const Image(image: AssetImage('assets/images/img1.png'))),
          Padding(
            padding: const EdgeInsets.all(19.0),
            child: Text(
                "Our user friendly app is designed \n to be easy to use and understand, "
                "making it accessible to farmers of all\n skill levels who want to make a difference in the fight against hunger ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.green.shade800,
                  fontSize: 17,
                  fontFamily: "Muli",
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Button(text: "Next"),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.grey.shade500,
                  size: 10,
                ),
                Icon(
                  Icons.circle,
                  color: Colors.green.shade900,
                  size: 10,
                ),
                Icon(
                  Icons.circle,
                  color: Colors.grey.shade500,
                  size: 10,
                )
              ],
            ),
          )
          //    Padding(
          //      padding: const EdgeInsets.all(15.0),
          //      child: Button(text: "LOGIN", task: login_page),
          //    ),
          //    Padding(
          //      padding: const EdgeInsets.all(15.0),
          //      child: Button(text: "SIGNUP", task: signup_page),
          //    )
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          SizedBox(
              height: getProportionateScreenHeight(300),
              width: getProportionateScreenWidth(300),
              child: const Image(image: AssetImage("assets/images/img0.png"))),
          Padding(
              padding: const EdgeInsets.all(17.0),
              child: Text(
                  "With our app, farmers have access to valuable data and insights that help them make informed decisions, they can track plant growth, detect plant disease, ultimately eading to increased \n yields and more food for those in need",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.green.shade800,
                    fontSize: 17,
                    fontFamily: "Muli",
                  ))),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: login_page,
              child: const Button(text: "LOGIN"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: signup_page,
              child: const Button(text: "SIGNUP"),
            ),
          ),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.circle,
                color: Colors.grey.shade500,
                size: 10,
              ),
              Icon(
                Icons.circle,
                color: Colors.grey.shade500,
                size: 10,
              ),
              Icon(
                Icons.circle,
                color: Colors.green.shade900,
                size: 10,
              )
            ],
          )
        ],
      ),
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        body: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (_, index) {
              return pages[index];
            }));
  }
}
