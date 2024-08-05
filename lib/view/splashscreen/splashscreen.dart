import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/catogaryscreen/cata_Garyscreen.dart';
import 'package:flutter_application_2/view/utils/animation_constants.dart';
import 'package:flutter_application_2/view/utils/color_constants.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CataGaryscreen()
            ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorConstants.BLACK,
      body: Center(
        child: Lottie.asset(AnimationConstants.SPLASHSCREENLOGO)
      ),
    );
  }
}
