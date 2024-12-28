import 'package:flutter/material.dart';
import 'package:rick_morty_app/view/Bottomnavibar_screen/Bottomnavibar_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4)).then((value) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => BottomnavibarScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            height: 300,
            "assets/images/rick&mortydp.png",
            fit: BoxFit.cover,
          )),
        ],
      ),
    );
  }
}
