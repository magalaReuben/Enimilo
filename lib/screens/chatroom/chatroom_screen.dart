import 'package:flutter/material.dart';
import 'package:enimilo/screens/chatroom/components/body.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../constants/enums.dart';

class ChatRoom extends StatelessWidget {
  static String routeName = "/chatroom";
  const ChatRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.forums),
    );
  }
}
