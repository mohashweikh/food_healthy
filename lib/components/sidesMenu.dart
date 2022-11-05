import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_healthy/Controller/HomeController.dart';
import 'package:food_healthy/components/variables.dart';
import 'package:get/get.dart';

import 'LongFoodItemCard.dart';

class sidesMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (getx) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LongFoodItemCard(
              image: assetImage('large_fries.png', 70.h, 70.w),
              calories: 366,
              foodName: 'Large',
              foodNameUnder: 'Fries',
              increase: () {
                getx.increaseLargeFriesCount();
              },
              decrease: () {
              getx.decreaseLargeFriesCount();

              },
              counterText: '${getx.largeFriesCount.toStringAsFixed(0)}',
            ),
            SizedBox(
              width: double.infinity,
              height: 1,
              child: Container(
                color: Color(0xff2C000000),
              ),
            ),
            LongFoodItemCard(
              image: assetImage('chicken_nuggets.png', 80.h, 80.w),
              calories: 42,
              counterText: '${getx.chickenNuggetCount.toStringAsFixed(0)}',
              foodName: '1 Chicken',
              foodNameUnder: 'Nugget',
              increase: () {
              getx.increaseChickenNuggetCount();
              },
              decrease: () {
                getx.decreaseChickenNuggetCount();
              },
            ),
            SizedBox(
              width: double.infinity,
              height: 1,
              child: Container(
                color: Color(0xff2C000000),
              ),
            ),
            LongFoodItemCard(
              image: assetImage('large_coke.png', 80.h, 75.w),
              foodName: 'Large',
              foodNameUnder: 'Coke',
              counterText: '${getx.largeCokeCount.toStringAsFixed(0)}',
              calories: 224,
              increase: () {
                 getx.increaselargeCokeCount();
              },
              decrease: () {
               getx.decreaselargeCokeCount();
              },
            ),
            SizedBox(
              width: double.infinity,
              height: 1,
              child: Container(
                color: Color(0xff2C000000),
              ),
            ),
            LongFoodItemCard(
              image: assetImage('soft_serve.png', 90.h, 80.w),
              foodName: 'Soft',
              foodNameUnder: 'Serve',
              counterText: '${getx.softServeCount.toStringAsFixed(0)}',
              calories: 200,
              increase: () {
               getx.increaseSoftServeCount();
              },
              decrease: () {
               getx.decreaseSoftServeCount();
              },
            )
          ],
        );
      }
    );
  }
}
