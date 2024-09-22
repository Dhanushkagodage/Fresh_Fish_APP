import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldContainer extends StatefulWidget {
  const TextFieldContainer({super.key});

  @override
  State<TextFieldContainer> createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.sp),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 2.h),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: 'Password',
          hintStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          prefixIcon: Container(
            width: 26.sp,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 30.sp,
                  height: 30.sp,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
                Center(
                  child: Icon(
                    Icons.account_circle,
                    size: 20.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.visibility_off,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF0D4065), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 174, 173, 173), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
