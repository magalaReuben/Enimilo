import 'package:camera/camera.dart';
import 'package:enimilo/constants/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final List<CameraDescription> cameras;
  const Body({super.key, required this.cameras});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late CameraController _cameraController;

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: _cameraController.value.isInitialized
              ? Stack(
                  children: <Widget>[
                    CameraPreview(_cameraController),
                    // ignore: prefer_const_constructors
                    Positioned(
                        top: 16,
                        left: 8,
                        child: SafeArea(
                            top: false,
                            child: IconButton(
                                color: Colors.white,
                                icon: const Icon(Icons.cancel),
                                // SvgPicture.asset(
                                //   "assets/icons/Shop Icon.svg",
                                // ),
                                onPressed: () => {}
                                //Navigator.pushNamed(context, StoryScreen.routeName)
                                // Navigator.pushNamed(context, HomeScreen.routeName),
                                )) //ImageIcon(AssetImage("assets/icons/crown.png")),
                        ),
                    Positioned(
                        top: 16,
                        right: 8,
                        child: SafeArea(
                            top: false,
                            child: IconButton(
                                color: Colors.white,
                                icon: const Icon(Icons.flash_on),
                                // SvgPicture.asset(
                                //   "assets/icons/Shop Icon.svg",
                                // ),
                                onPressed: () => {}
                                //Navigator.pushNamed(context, StoryScreen.routeName)
                                // Navigator.pushNamed(context, HomeScreen.routeName),
                                )) //ImageIcon(AssetImage("assets/icons/crown.png")),
                        ),
                    Positioned(
                        bottom: 16,
                        right: 140,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                iconSize: 80,
                                color: Colors.white,
                                icon: const Icon(Icons.circle),
                                // SvgPicture.asset(
                                //   "assets/icons/Shop Icon.svg",
                                // ),
                                onPressed: () => {}
                                //Navigator.pushNamed(context, StoryScreen.routeName)
                                // Navigator.pushNamed(context, HomeScreen.routeName),
                                ),
                          ],
                        ) //ImageIcon(AssetImage("assets/icons/crown.png")),
                        )
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                )),
    );
  }
}
