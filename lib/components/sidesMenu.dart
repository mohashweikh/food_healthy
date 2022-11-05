import 'package:flutter/material.dart';
import 'package:food_healthy/Controller/HomeController.dart';
import 'package:get/get.dart';

import '../Model/Meal.dart';
import 'LongFoodItemCard.dart';

class sidesMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (logic) {
          return logic.sides.isEmpty
              ? Center(
                  child: Text(
                      'Nothing To Do.... \n You can add Sides Meal as you like'),
                )
              : ListView.builder(
                  itemCount: logic.sides.length,
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
        });
  }
}
