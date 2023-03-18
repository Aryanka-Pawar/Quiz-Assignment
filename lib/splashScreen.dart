import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_assignment/services/caching.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/auth/authPage.dart';
import 'Shared/constants.dart';
import 'Shared/customRoute.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
    ));
    // disableCapture();
    timerToGoToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("LOGO", style: TextStyle(fontSize: 50)),
            const SizedBox(height: 20,),
            const Text("Earnest Fintech Limited", style: TextStyle(fontSize: 30)),
          ],
        )
      ),
    );
  }

  Future<bool> isUserLoggedIn() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = false;
    isLoggedIn = prefs.getBool(SharedPreferenceServices.sharedPreferenceUserLoggedInKey) ?? false;
    return isLoggedIn;
  }

  void timerToGoToNextPage() async{
    bool isLoggedIn = await isUserLoggedIn();
    Timer(const Duration(seconds: 1), () {
      if(isLoggedIn){
        Navigator.of(context).pushReplacement(CustomRoute(page: MyHomePage(title: "",)));
      }else{
        Navigator.of(context).pushReplacement(CustomRoute(page: const Authenticate()));
      }
    });
  }

  // Future<void> disableCapture() async {
  //   //disable screenshots and record screen in current screen
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

}