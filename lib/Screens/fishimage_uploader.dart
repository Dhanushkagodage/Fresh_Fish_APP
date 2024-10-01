import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_fish_app/Screens/analysis_screen.dart';
import 'package:fresh_fish_app/Widgets/custom_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class FishImageUploader extends StatefulWidget {
  final int pageCount;
  const FishImageUploader({super.key, this.pageCount = 1});

  @override
  State<FishImageUploader> createState() => _FishImageUploaderState();
}

class _FishImageUploaderState extends State<FishImageUploader> {
  List<String> appBarTitles = [
    "FISH EYE UPLOADER",
    "FISH SKIN UPLOADER",
    "FISH GILLS UPLOADER"
  ];
  List<String> imageTitles = ["eye", "skin", "gills"];

  final ImagePicker _picker = ImagePicker();
  File? _image;
  String imageURL = '';

  //pick an image from the camera
  Future<void> pickFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      File? croppedFile = await cropImage(pickedFile.path);
      if (croppedFile != null) {
        setState(() {
          _image = croppedFile;
        });
      }
    }
  }

//pick an image from the gallery
  Future<void> pickFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File? croppedFile = await cropImage(pickedFile.path);
      if (croppedFile != null) {
        setState(() {
          _image = croppedFile;
        });
      }
    }
  }

//crop the image
  Future<File?> cropImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatio: const CropAspectRatio(ratioX: 4, ratioY: 3),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          backgroundColor: Colors.blue.shade50,
          toolbarColor: Colors.blue.shade200,
          toolbarWidgetColor: const Color(0xFF080C27),
          hideBottomControls: true,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'Crop Image',
          resetAspectRatioEnabled: false,
          aspectRatioLockEnabled: true,
        ),
      ],
    );

    if (croppedFile != null) {
      return File(croppedFile.path);
    }
    return null;
  }

  //upload to cloud storage,add your cloudinary credentials
  Future<void> uploadImageToCloudinary(File image) async {
    final cloudinary = CloudinaryPublic('dxkaiqscs', 'myCloud', cache: false);
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path,
            resourceType: CloudinaryResourceType.Image),
      );
      setState(() {
        imageURL = response.secureUrl;
        //print('Image URL: $imageURL');
      });
    } catch (e) {
      _showErrorSnackbar("Failed to upload image. Please try again !");
    }
  }

  // Save URL in SharedPreferences
  Future<void> saveUrlToSharedPreferences(String url) async {
    try {
      final SharedPreferences localStorage =
          await SharedPreferences.getInstance();
      String key;

      switch (widget.pageCount) {
        case 1:
          key = 'fish_eye_url';
          break;
        case 2:
          key = 'fish_skin_url';
          break;
        case 3:
          key = 'fish_gills_url';
          break;
        default:
          return;
      }

      await localStorage.setString(key, url);
      final savedUrl = localStorage.getString(key);
      print("Saved URL: $savedUrl");
    } catch (e) {
     // print("Error saving URL in SharedPreferences: $e");
    }
  }

  //error snackbar message
  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.white,
            ),
            SizedBox(width: 10.w),
            Text(
              message,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue.shade200,
          elevation: 0,
          // leading: IconButton(
          //   icon: const Icon(
          //     Icons.arrow_back,
          //     color: Color(0xFF080C27),
          //     size: 30,
          //   ),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/splashlogo2.png",
                scale: 60.sp,
              ),
              Text(
                appBarTitles[widget.pageCount - 1],
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
          padding: EdgeInsets.only(left: 30.sp, right: 30.sp, bottom: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 20.h,
              ),
              _image == null
                  ? Container(
                      height: 225.sp,
                      width: 300.sp,
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
                            "Upload fish ${imageTitles[widget.pageCount - 1]} images here",
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: const Color(0xFF080C27).withOpacity(0.5),
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Image.file(
                      _image!,
                      height: 225.sp,
                      width: 300.sp,
                      fit: BoxFit.fill,
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
                onPressed: pickFromCamera,
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
                onPressed: pickFromGallery,
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
                  if (_image == null) {
                    _showErrorSnackbar(
                        "Please upload an image related to fish ${imageTitles[widget.pageCount - 1]} !");
                  } else if (_image != null) {
                    try {
                      await uploadImageToCloudinary(_image!);
                    } catch (e) {
                      _showErrorSnackbar(
                          "Failed to upload image. Please try again !");
                    }
                    if (imageURL.isNotEmpty) {
                      try {
                        await saveUrlToSharedPreferences(imageURL);
                      } catch (e) {
                        _showErrorSnackbar(
                            "Failed to upload image. Please try again !");
                      }
                      if (widget.pageCount < 3) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FishImageUploader(
                                pageCount: widget.pageCount + 1),
                          ),
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AnalysisScreen(),
                          ),
                        );
                      }
                    }
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
