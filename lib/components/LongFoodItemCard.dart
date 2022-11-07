import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_healthy/Controller/HomeController.dart';
import 'package:food_healthy/components/variables.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get.dart';

import '../Model/Meal.dart';

class LongFoodItemCard extends StatelessWidget {
 Tmeal meal;

  LongFoodItemCard({
    required this.meal
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (logic) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5.h),
          padding: EdgeInsets.only(bottom: 4.h),
          child: Row(
            children: [
              Image.file(File(meal.image)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${meal.name}',
                    style: TextStyle(
                        fontSize: 17.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${meal.category.name}',
                    style: TextStyle(
                        fontSize: 17.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                '(${meal.numCalories.toString()} cal)',
                style: TextStyle(fontSize: 15.r),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    meal.counter.toString(),
                    style: TextStyle(fontSize: 25.sp),
                  ),
                  Row(
                    children: [
                      FloatingActionButton(
                        onPressed: logic.decrease(meal:meal),
                        heroTag: null,
                        mini: true,
                        backgroundColor: primary_Color,
                        foregroundColor: Colors.black,
                        child: Icon(Icons.remove),
                      ),
                      FloatingActionButton(
                        onPressed: logic.increase(meal:meal ),
                        heroTag: null,
                        child: Icon(Icons.add),
                        backgroundColor: primary_Color,
                        foregroundColor: Colors.black,
                        mini: true,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
