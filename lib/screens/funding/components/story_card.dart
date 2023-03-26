import 'package:flutter/material.dart';
import 'package:enimilo/screens/chatscreen/chatscreen.dart';
import '../../../constants/size_config.dart';

// ignore: non_constant_identifier_names
GestureDetector StoryCard(context, imageName) {
  return GestureDetector(
    child: Container(
        margin: const EdgeInsets.all(10),
        height: getProportionateScreenHeight(90),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.5), width: 1),
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.green, Colors.greenAccent]),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Container(
                  height: getProportionateScreenHeight(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: const CircleAvatar(
                    foregroundImage: AssetImage('assets/images/Logo.jpg'),
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.screenHeight * 0.01),
              SizedBox(
                width: SizeConfig.screenHeight * 0.20,
                height: SizeConfig.screenHeight * 0.03,
                child: Text(
                  imageName,
                  style: TextStyle(
                      fontFamily: 'muli',
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              children: const [
                Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.white,
                ),
                Text(
                  "23",
                  style: TextStyle(
                    fontFamily: 'muli',
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ])),
    onTap: () => Navigator.pushNamed(context, ChatScreen.routeName),
  );
}
