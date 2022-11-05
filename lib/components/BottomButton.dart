import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'variables.dart';

class BottomButton extends StatelessWidget {
  var onPressed;
  String text;

  BottomButton({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: boxShadow,
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(30.r))),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20.sp, fontWeight: FontWeight.bold, color: primary_Color),
        ),
        alignment: Alignment.center,
        height: 60.h,
        margin: EdgeInsets.only(bottom: 8.h),
      ),
    );
  }
}
