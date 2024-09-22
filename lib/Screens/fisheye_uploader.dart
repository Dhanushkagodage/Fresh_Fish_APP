import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_fish_app/Widgets/custom_button.dart';

class FisheyeUploader extends StatefulWidget {
  const FisheyeUploader({super.key});

  @override
  State<FisheyeUploader> createState() => _FisheyeUploaderState();
}

class _FisheyeUploaderState extends State<FisheyeUploader> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue.shade200,
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/splashlogo.png",
                scale: 50.sp,
              ),
              Text(
                "FISH EYE UPLOADER",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Color(0xFF080C27),
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.blue.shade50,
        body: Padding(
          padding: EdgeInsets.only(left: 30.sp, right: 30.sp, top: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 250.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.sp),
                  border: Border.all(
                    color: Color(0xFF080C27).withOpacity(0.5),
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud_upload,
                      size: 50.sp,
                      color: Color(0xFF080C27).withOpacity(0.5),
                    ),
                    Text(
                      "Upload fish eye images here",
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: Color(0xFF080C27).withOpacity(0.5),
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomButton(text:"Open Camera"),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1.sp,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.sp), // Adjust spacing around 'OR'
                    child: Text(
                      "or",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(text:"Choose from Gallery"),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Note: Please upload fish eye images only.For better results, please upload images with good quality",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Color(0xFF080C27),
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              
              CustomButton(text: "Next Step"),
            ],
          ),
        ),
      ),
    );
  }
}
