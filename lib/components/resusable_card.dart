import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:core';

import 'package:food_healthy/components/variables.dart';

class ReusableCard extends StatelessWidget {
  final Color cardColor;
  final IconData foodIcon;
  final String iconText;
  final VoidCallback onTap;

  ReusableCard(
      {required this.cardColor,
      required this.foodIcon,
      required this.iconText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.w)),
            color: cardColor,
            boxShadow: boxShadow),
        height: 130.h,
        child: GestureDetector(
          onTap: onTap,
          //switch to active card colour
          // switch to burger menu display
          // ,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                foodIcon,
                size: 65.sp,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                iconText,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
              )
            ],
            //burger icon
            // text 'burger'
          ),
        ));
  }
}
