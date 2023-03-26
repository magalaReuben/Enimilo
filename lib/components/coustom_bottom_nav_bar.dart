import 'package:enimilo/screens/chatroom/chatroom_screen.dart';
import 'package:enimilo/screens/funding/funding_screen.dart';
import 'package:flutter/material.dart';
import 'package:enimilo/screens/scan/scan_screen.dart';
import 'package:camera/camera.dart';
import '../constants/enums.dart';
import '../screens/story/story_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25.0), bottom: Radius.circular(25.0)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -15),
              blurRadius: 20,
              color: const Color(0xFFDADADA).withOpacity(0.15),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: SafeArea(
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: ImageIcon(
                      const AssetImage('assets/icons/scan.png'),
                      size: 30,
                      color: MenuState.scan == selectedMenu
                          ? Colors.green
                          : inActiveIconColor,
                    ),
                    // SvgPicture.asset(
                    //   "assets/icons/Shop Icon.svg",
                    // ),
                    onPressed: () async {
                      await availableCameras().then((value) =>
                          Navigator.pushNamed(context, ScanScreen.routeName,
                              arguments: value));
                    }

                    // Navigator.pushNamed(context, HomeScreen.routeName),
                    ),
                IconButton(
                    icon: ImageIcon(
                      const AssetImage('assets/icons/discussion.png'),
                      size: 30,
                      color: MenuState.forums == selectedMenu
                          ? Colors.green
                          : inActiveIconColor,
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, ChatRoom.routeName)),
                IconButton(
                  icon: ImageIcon(
                    const AssetImage('assets/icons/heart.png'),
                    size: 30,
                    color: MenuState.donate == selectedMenu
                        ? Colors.green
                        : inActiveIconColor,
                  ),
                  // SvgPicture.asset(
                  //   "assets/icons/Shop Icon.svg",
                  // ),
                  onPressed: () =>
                      Navigator.pushNamed(context, FundingScreen.routeName),
                  // Navigator.pushNamed(context, HomeScreen.routeName),
                ),
              ],
            )),
      ),
    );
  }
}
