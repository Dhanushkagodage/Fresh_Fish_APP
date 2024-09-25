import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_fish_app/Screens/dashboard_screen.dart';
import 'package:fresh_fish_app/Widgets/custom_button.dart';
import 'package:fresh_fish_app/Widgets/text_field_container.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                )),
              ),
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFF080C27),
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                          topRight: Radius.circular(30.sp)),
                      color: Colors.blue.shade50),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 40.sp, right: 40.sp, top: 15.h),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Sign Up",
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  color: const Color(0xFF080C27),
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w600)),
                          const TextFieldContainer(
                            hintText: "Email",
                            icon: Icons.email_outlined,
                          ),
                          const TextFieldContainer(
                              hintText: "UserName",
                              icon: Icons.person_outlined),
                          const TextFieldContainer(
                              hintText: "Password",
                              icon: Icons.lock_person_outlined),
                          const TextFieldContainer(
                              hintText: "Confirm Password",
                              icon: Icons.lock_person_outlined),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomButton(
                            text: "SIGN UP",
                            onPressed: () async {
                              await Future.delayed(const Duration(seconds: 2));
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DashboardScreen(),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
