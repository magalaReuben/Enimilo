import 'package:enimilo/screens/chatscreen/components/body.dart';
import 'package:flutter/material.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../constants/enums.dart';

class ChatScreen extends StatelessWidget {
  static String routeName = '/chatscreen';
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> args =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    return Scaffold(
      body: Body(
        groupId: args[0],
        groupName: args[1],
        userName: args[2],
      ),
    );
  }
}
