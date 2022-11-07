import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_healthy/Controller/HomeController.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../components/variables.dart';

class NewMealPage extends StatelessWidget {
  const NewMealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (logic) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              'New Meal',
              style: TextStyle(color: Colors.black87),
            ),
          ),
          backgroundColor: Colors.yellow.shade800,
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: GestureDetector(
                        onTap: logic.selectFile,
                        child: logic.file == null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.camera_alt),
                                  Text('Select photo of meal')
                                ],
                              )
                            : Image.file(
                                logic.file ?? File(''),
                                height: 200.h,
                              )),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: logic.nnumberMeal,
                    decoration: InputDecoration(
                        hintText: 'Enter Number of Calories',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    controller: logic.nameMeal,
                    decoration: InputDecoration(
                        hintText: 'Enter Name of Calories',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(height: 10.h),
                  const Text('Select type of meal'),
                  ListTile(
                    title: const Text('Burger'),
                    leading: Radio(
                      value: FoodCategory.burger,
                      groupValue: logic.selectedCategory,
                      onChanged: (value) {
                        logic.setCategory(value!);
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Side'),
                    leading: Radio(
                      value: FoodCategory.sides,
                      groupValue: logic.selectedCategory,
                      onChanged: (value) {
                        logic.setCategory(value!);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: logic.countMeal,
                    decoration: InputDecoration(
                        hintText: 'Enter Count of Meals',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const Divider(),
                  Center(
                      child: GestureDetector(
                          onTap: logic.addMeal,
                          child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(child: Text('Add Meal')))))
                ],
              ),
            ),
          )  );
      },
    );
  }
}
