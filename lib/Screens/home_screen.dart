import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_fish_app/Screens/fisheye_uploader.dart';
import 'package:fresh_fish_app/Widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                        horizontal: 40.sp, vertical: 20.sp),
                    child:  
                    Column(
                      
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FisheyeUploader())),
                          child: CustomButton(text: "Open Camera")),
                        SizedBox(
                          height:40.h,
                        ),
                        CustomButton(text:"Choose from Gallery"),
                        SizedBox(
                          height:40.h,
                        ),
                        CustomButton(text: "Quality Check"),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
