import 'package:flutter/material.dart';
import 'package:enimilo/screens/funding/components/body.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../constants/enums.dart';

class FundingScreen extends StatelessWidget {
  static String routeName = '/funding';
  const FundingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.donate),
    );
  }
}
