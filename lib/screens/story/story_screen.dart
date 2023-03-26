import 'package:flutter/material.dart';
import 'package:enimilo/constants/enums.dart';
import 'package:enimilo/screens/story/components/body.dart';

import '../../components/coustom_bottom_nav_bar.dart';

class StoryScreen extends StatelessWidget {
  static String routeName = "/story";
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.storytelling),
    );
  }
}
