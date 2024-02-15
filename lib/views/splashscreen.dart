import 'package:flutter/material.dart';
import 'package:news/components/const.dart';
import 'package:news/controller/splash_service.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService splashService = SplashService();

  @override
  void initState() {
    super.initState();
    splashService.islogin(context);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.010), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHeight * 0.6, 
                    width: screenWidth * 0.8, 
                    child: Lottie.asset(
                      "assets/animation/Animation - 1708004791206.json",
                      width: screenWidth * 0.5, 
                      height: screenHeight * 0.6, 
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Google",
                  style: textStyleFuc(
                      weight: FontWeight.w300,
                      color: Colors.black,
                      size: 17),
                ),
                Text(
                  "News",
                  style: TextStyle(color: Colors.blue, fontSize: 17),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}