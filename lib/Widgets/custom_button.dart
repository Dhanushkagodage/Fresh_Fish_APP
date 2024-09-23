// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomButton extends StatefulWidget {
//   final String text;
//   final IconData? icon; // Make icon nullable
//   const CustomButton({super.key, required this.text, this.icon});

//   @override
//   State<CustomButton> createState() => _CustomButtonState();
// }

// class _CustomButtonState extends State<CustomButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         height: 55.h,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.sp),
//           color: Colors.blue,
//         ),
//         child: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               if (widget.icon != null) // Check if icon is not null
//                 Icon(
//                   widget.icon, // Use the icon passed in widget
//                   color: Colors.white,
//                 ),
//               if (widget.icon != null) // Add space only if the icon is present
//                 SizedBox(
//                   width: 10.w,
//                 ),
//               Text(
//                 widget.text,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20.sp,
//                     color: Colors.white),
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

class CustomButton extends StatefulWidget {
  final String text;
  final IconData? icon; 
  final Future<void> Function() onPressed; 

  const CustomButton({
    super.key,
    required this.text,
    this.icon,
    required this.onPressed,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _isLoading
            ? null 
            : () async {
                setState(() {
                  _isLoading = true;
                });
                await widget.onPressed();
                setState(() {
                  _isLoading = false;
                });
              },
        child: Container(
          height: 55.h,
          width: double.infinity,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.sp),
            color:
                _isLoading ? Colors.blue.withOpacity(0.4) : Colors.blue,
          ),
          child: Center(
            child: _isLoading
                ? const CircularProgressIndicator(
                  
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.icon != null)
                        Icon(
                          widget.icon,
                          color: Colors.white,
                          size: 30.sp,
                        ),
                      if (widget.icon !=null) 
                        SizedBox(
                          width: 10.w,
                        ),
                      Text(
                        widget.text,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
