import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_fish_app/Screens/fishimage_uploader.dart';
import 'package:fresh_fish_app/Widgets/custom_button.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
                    padding: EdgeInsets.symmetric(
                        horizontal: 40.sp, vertical: 30.sp),
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
                                        width: 2))),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 5.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Dashboard",
                                      style: TextStyle(
                                          fontSize: 25.sp,
                                          color: const Color(0xFF080C27),
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w600)),
                                  Text("Welcome!",
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: const Color(0xFF080C27),
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            )),
                        Container(
                          height: 200.h,
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20.sp, right: 20.sp, top: 20.sp),
                                child: Text(
                                  "Upload images to analyze the quality of fish and receive expert insights on its freshness. Our tool ensures you make informed decisions, helping you choose the best fish for your needs",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: const Color(0xFF080C27)
                                        .withOpacity(0.5),
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomButton(
                          text: "Get Started",
                          onPressed: () async {
                            await Future.delayed(const Duration(seconds: 2));
                            Navigator.push(
                              // ignore: use_build_context_synchronously
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FishImageUploader(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
