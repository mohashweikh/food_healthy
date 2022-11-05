import 'package:flutter/material.dart';
import 'package:food_healthy/Controller/HomeController.dart';
import 'package:food_healthy/Model/Meal.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'LongFoodItemCard.dart';

class BurgerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (logic) {
        return logic.burger.isEmpty
            ? Center(
                child: Text(
                    'Nothing To Do.... \n You can add Burger Meal as you like'),
              )
            : ListView.builder(
                itemCount: logic.burger.length,
                itemBuilder: (context, index) {
                  final meal = logic.burger[index];
                  Tmeal tmeal = Tmeal(
                    name: meal.name,
                    id: meal.id,
                    image: meal.image,
                    category: meal.category,
                    counter: meal.counter,
                    numCalories: meal.numCalories,
                  );
                  return LongFoodItemCard(meal: tmeal);
                });
      },
    );
  }
}
