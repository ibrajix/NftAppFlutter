import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nft_app_flutter/navigation/routes.dart';

import '../utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  bool animate = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          AnimatedPositioned(
            duration: Duration(milliseconds: 1600),
              bottom: 80,
              child: Image(
                image: AssetImage(
                    Images.splashImage
                ),
              )
          ),
        ],
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    setState(() {
      animate = true;
    });
    //navigate to home screen
    if (!mounted) return;
    context.go(Destination.welcomeScreen);
  }

}
