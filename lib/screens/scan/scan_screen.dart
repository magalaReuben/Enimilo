import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:enimilo/screens/scan/components/body.dart';

import '../../components/coustom_bottom_nav_bar.dart';
import '../../constants/enums.dart';

class ScanScreen extends StatelessWidget {
  static String routeName = "/scan";
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CameraDescription> cameras =
        ModalRoute.of(context)!.settings.arguments as List<CameraDescription>;
    return Scaffold(
      body: Body(cameras: cameras),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.scan),
    );
  }
}
