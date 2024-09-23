// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fresh_fish_app/Screens/analysis_screen.dart';
// import 'package:fresh_fish_app/Screens/qualityreport_screen.dart';
// import 'package:fresh_fish_app/Widgets/custom_button.dart';

// class FisheyeUploader extends StatefulWidget {
//   const FisheyeUploader({super.key});

//   @override
//   State<FisheyeUploader> createState() => _FisheyeUploaderState();
// }

// class _FisheyeUploaderState extends State<FisheyeUploader> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.lightBlue.shade200,
//           elevation: 0,
//           leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back,
//               color: Color(0xFF080C27),
//               size: 30,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Image.asset(
//                 "assets/splashlogo2.png",
//                 scale: 60.sp,
//               ),
//               Text(
//                 "FISH EYE UPLOADER",
//                 style: TextStyle(
//                   fontSize: 20.sp,
//                   color: const Color(0xFF080C27),
//                   fontFamily: "Roboto",
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         backgroundColor: Colors.blue.shade50,
//         body: Padding(
//           padding: EdgeInsets.only(left: 30.sp, right: 30.sp, top: 15.h, bottom: 20.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SizedBox(
//                 height: 20.h,
//               ),
//               Container(
//                 height: 250.h,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10.sp),
//                   border: Border.all(
//                     color: const Color(0xFF080C27).withOpacity(0.5),
//                     width: 1,
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.cloud_upload,
//                       size: 50.sp,
//                       color: const Color(0xFF080C27).withOpacity(0.5),
//                     ),
//                     Text(
//                       "Upload fish eye images here",
//                       style: TextStyle(
//                         fontSize: 17.sp,
//                         color: const Color(0xFF080C27).withOpacity(0.5),
//                         fontFamily: "Roboto",
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Text(
//                 "Note: For better results, please upload images with good quality and Clear images",
//                 style: TextStyle(
//                   fontSize: 13.sp,
//                   color: const Color(0xFF080C27).withOpacity(0.5),
//                   fontFamily: "Roboto",
//                   fontWeight: FontWeight.w500,
                  
//                 ),
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               CustomButton(
//                 text: "Take a Picture from Camera",
//                 icon: Icons.camera_alt_outlined,
//                 onPressed: () async {
//                   // Simulate some async action like API call
//                   await Future.delayed(const Duration(seconds: 3));
//                 },
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Divider(
//                       color: Colors.grey,
//                       thickness: 1.sp,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: 10.sp),
//                     child: Text(
//                       "or",
//                       style: TextStyle(
//                         color: const Color(0xFF080C27).withOpacity(0.5),
//                         fontSize: 16.sp,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Divider(
//                       color: Colors.grey,
//                       thickness: 1.sp,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               CustomButton(
//                 text: "Choose from your Gallery",
//                 icon: Icons.upload_file_outlined,
//                 onPressed: () async {
//                   // Simulate some async action like API call
//                   await Future.delayed(const Duration(seconds: 3));
//                 },
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Text(
//                 "Note: Once you click the upload button, you can't go back again",
//                 style: TextStyle(
//                   fontSize: 13.sp,
//                   color: const Color(0xFF080C27).withOpacity(0.5),
//                   fontFamily: "Roboto",
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               CustomButton(
//                 text: "Upload",
//                 icon: Icons.drive_folder_upload,
//                 onPressed: () async {
//                   await Future.delayed(const Duration(seconds: 2));
//                   Navigator.push(
//                     // ignore: use_build_context_synchronously
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const AnalysisScreen(),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_fish_app/Screens/analysis_screen.dart';
import 'package:fresh_fish_app/Widgets/custom_button.dart';

class FisheyeUploader extends StatefulWidget {
  final int pageCount; // Add a field to track the current page

  const FisheyeUploader({super.key, this.pageCount = 1});

  @override
  State<FisheyeUploader> createState() => _FisheyeUploaderState();
}

class _FisheyeUploaderState extends State<FisheyeUploader> {
  List<String> appBarTitles = [
    "FISH EYE UPLOADER",
    "FISH SKIN UPLOADER",
    "FISH GILLS UPLOADER"
  ];
  List<String> imageTitles = [
    "eye",
    "skin",
    "gills"
  ];

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
                "assets/splashlogo2.png",
                scale: 60.sp,
              ),
              Text(
                appBarTitles[widget.pageCount - 1], // Change title based on the page count
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
        backgroundColor: Colors.blue.shade50,
        body: Padding(
          padding: EdgeInsets.only(left: 30.sp, right: 30.sp, top: 15.h, bottom: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    color: const Color(0xFF080C27).withOpacity(0.5),
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud_upload,
                      size: 50.sp,
                      color: const Color(0xFF080C27).withOpacity(0.5),
                    ),
                    Text(
                      "Upload fish ${imageTitles[widget.pageCount-1]} images here",
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: const Color(0xFF080C27).withOpacity(0.5),
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Note: For better results, please upload images with good quality and clear images",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: const Color(0xFF080C27).withOpacity(0.5),
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                text: "Take a Picture from Camera",
                icon: Icons.camera_alt_outlined,
                onPressed: () async {
                  // Simulate some async action like API call
                  await Future.delayed(const Duration(seconds: 3));
                },
              ),
              SizedBox(
                height: 10.h,
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
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: Text(
                      "or",
                      style: TextStyle(
                        color: const Color(0xFF080C27).withOpacity(0.5),
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
                height: 10.h,
              ),
              CustomButton(
                text: "Choose from your Gallery",
                icon: Icons.upload_file_outlined,
                onPressed: () async {
                  // Simulate some async action like API call
                  await Future.delayed(const Duration(seconds: 3));
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Note: Once you click the upload button, you can't go back again",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: const Color(0xFF080C27).withOpacity(0.5),
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                text: "Upload",
                icon: Icons.drive_folder_upload,
                onPressed: () async {
                  await Future.delayed(const Duration(seconds: 2));

                  // Check if this is the last step
                  if (widget.pageCount < 3) {
                    // Navigate to the next FisheyeUploader page with incremented pageCount
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FisheyeUploader(pageCount: widget.pageCount + 1),
                      ),
                    );
                  } else {
                    // If it's the final step, navigate to the AnalysisScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AnalysisScreen(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
