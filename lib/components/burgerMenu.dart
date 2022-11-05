import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_healthy/Controller/HomeController.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'LongFoodItemCard.dart';
import 'variables.dart';

class BurgerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (logic) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LongFoodItemCard(
              image: assetImage('big_mac.png', 70.h, 70.w),
              calories: 550,
              foodName: 'Big',
              foodNameUnder: "Mac",
              counterText: '${logic.bigMacCount.toStringAsFixed(0)}',
              increase: () {
                logic.increasebigMacCount();
              },
              decrease: () {
                logic.decreasebigMacCount();
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
              image: assetImage('cheeseburger.png', 80.h, 80.w),
              calories: 313,
              foodName: 'Cheese',
              foodNameUnder: 'Burger',
              counterText: '${logic.cheeseBurgerCount.toStringAsFixed(0)}',
              increase: () {
                logic.increasecheeseBurgerCount();
              },
              decrease: () {
                logic.decreasecheeseBurgerCount();
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
              image: assetImage('Mc_Chicken.png', 75.h, 75.w),
              foodName: 'Chicken',
              foodNameUnder: 'Burger',
              counterText: '${logic.chickenBurgerCount.toStringAsFixed(0)}',
              calories: 357,
              increase: () {
                logic.increasechickenBurgerCount();
              },
              decrease: () {
                logic.decreasechickenBurgerCount();
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
              image: assetImage('quarter_pounder.png', 80.h, 80.w),
              foodName: 'Quarter',
              foodNameUnder: 'Pounder',
              counterText: '${logic.quarterPounderCount.toStringAsFixed(0)}',
              calories: 417,
              increase: () {
                logic.increasequarterPounderCount();
              },
              decrease: () {
                logic.decreasequarterPounderCount();
              },
            )
          ],
        );
      },
    );
  }
}
