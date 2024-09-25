import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldContainer extends StatefulWidget {
  final String hintText;
  final IconData icon;
  const TextFieldContainer(
      {super.key, required this.hintText, required this.icon});

  @override
  State<TextFieldContainer> createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.sp),
      child: TextField(
        obscureText: widget.hintText == "Password" ||
                widget.hintText == "Confirm Password"
            ? _isObscured
            : false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 2.h),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black.withOpacity(0.5),
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
                    widget.icon,
                    size: 20.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          suffixIcon: widget.hintText == "Password" ||
                  widget.hintText == "Confirm Password"
              ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
              : null,
          filled: true,
          fillColor: Colors.grey.shade100,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF0D4065), width: 1),
            borderRadius: BorderRadius.circular(10.sp),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 174, 173, 173), width: 1),
            borderRadius: BorderRadius.circular(10.sp),
          ),
        ),
      ),
    );
  }
}
