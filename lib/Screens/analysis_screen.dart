import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_fish_app/Screens/qualityreport_screen.dart';
import 'package:fresh_fish_app/Widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  String fishEyeUrl = '';
  String fishSkinUrl = '';
  String fishGillsUrl = '';

  @override
  void initState() {
    super.initState();
    getUrlsFromSharedPreferences();
  }

  Future<void> getUrlsFromSharedPreferences() async {
    try {
      final SharedPreferences localStorage =
          await SharedPreferences.getInstance();

      // Retrieve the URLs from SharedPreferences
      setState(() {
        fishEyeUrl = localStorage.getString('fish_eye_url') ?? '';
        fishSkinUrl = localStorage.getString('fish_skin_url') ?? '';
        fishGillsUrl = localStorage.getString('fish_gills_url') ?? '';
      });

      // Print the URLs for testing or debugging purposes
      print("Fish Eye URL: $fishEyeUrl");
      print("Fish Skin URL: $fishSkinUrl");
      print("Fish Gills URL: $fishGillsUrl");
    } catch (e) {
      print("Error retrieving URLs from SharedPreferences: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blue.shade50,
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
                  "assets/splashlogo2.png",
                  scale: 60.sp,
                ),
                Text(
                  "FISH ANALYSIS",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: const Color(0xFF080C27),
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 30.sp, right: 30.sp, bottom: 10.h),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  _imagebox(fishEyeUrl, "FISH EYE"),
                  SizedBox(
                    height: 10.h,
                  ),
                  _imagebox(fishSkinUrl, "FISH SKIN"),
                  SizedBox(
                    height: 10.h,
                  ),
                  _imagebox(fishGillsUrl, "FISH GILLS"),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButton(
                    text: "Analyze",
                    icon: Icons.assessment_outlined,
                    onPressed: () async {
                      await Future.delayed(const Duration(seconds: 2));
                      Navigator.push(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QualityreportScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget _imagebox(String image, String text) {
    return Container(
      child: Column(
        children: [
          // Container(
          //   width: 120.w,
          //   height: 20.h,
          //   decoration: BoxDecoration(
          //     color: Colors.blue.shade200,
          //     borderRadius: BorderRadius.circular(5.sp),
          //   ),
          //   child: Center(
          //     child: Text(
          //       "FISH EYE",
          //       style: TextStyle(
          //           fontSize: 1.sp,
          //           color: const Color(0xFF080C27),
          //           fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.blue.shade200,
                  thickness: 1.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: Text(
                  text,
                  style: TextStyle(
                    color: const Color(0xFF080C27).withOpacity(0.9),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.blue.shade200,
                  thickness: 1.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            width: 230.w,
            height: 150.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
