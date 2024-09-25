import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_fish_app/Screens/dashboard_screen.dart';
import 'package:fresh_fish_app/Screens/signup_screen.dart';
import 'package:fresh_fish_app/Widgets/custom_button.dart';
import 'package:fresh_fish_app/Widgets/text_field_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue.shade300,
        body: Stack(
          children: [
            SizedBox(
              height: 300.h,
              child: Center(
                child: Image.asset(
                  "assets/logo.png",
                  scale: 15,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 260.h),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.sp),
                    topRight: Radius.circular(30.sp),
                  ),
                  color: Colors.blue.shade50,
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.sp, vertical: 20.sp),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.blue.shade200,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Log In",
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    color: const Color(0xFF080C27),
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "Welcome!",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: const Color(0xFF080C27),
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h), 
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextFieldContainer(
                                hintText: "Email",
                                icon: Icons.email_outlined,
                              ),
                              const TextFieldContainer(
                                hintText: "Password",
                                icon: Icons.lock_person_outlined,
                              ),
                              SizedBox(height: 10.h),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    fontFamily: "Roboto",
                                    color: const Color(0xFF0D4065),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 35.h),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              CustomButton(
                                text: "LOG IN",
                                onPressed: () async {
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const DashboardScreen(),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: const Color(0xFF080C27),
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SignupScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.sp,
                                        fontFamily: "Roboto",
                                        color: const Color(0xFF0D4065),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
