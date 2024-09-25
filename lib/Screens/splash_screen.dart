import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_fish_app/Screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Center(
            child: Image.asset(
              "assets/splashlogo.png",
              scale: 25,
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "From:",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.white,
                  fontFamily: "AlternateGotNo3D",
                  fontWeight: FontWeight.w400,
                ),
              ),

              //Add your group name here
              Text(
                "GroupName",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color.fromARGB(255, 44, 44, 44),
                  fontFamily: "AlternateGotNo3D",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
