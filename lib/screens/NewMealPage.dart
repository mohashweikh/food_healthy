import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_healthy/Controller/HomeController.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../components/variables.dart';

class NewMealPage extends StatelessWidget {
  const NewMealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (logic) {
        return Scaffold(
          backgroundColor: primary_Color,
          body: Column(
            children: [
              Text('Select Photo of Meal'),
              IconButton(
                  onPressed: logic.selectFile(), icon: Icon(Icons.camera_alt)),
              logic.file == null
                  ? Text('No photo found')
                  : Image.file(logic.file ?? File('')),
              Text('Select number of calories'),
              TextField(),
              Text('Select name of meal'),
              TextField(),
              Text('Select type of meal'),
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
                title: const Text('www.w3school.com'),
                leading: Radio(
                  value: FoodCategory.sides,
                  groupValue: logic.selectedCategory,
                  onChanged: (value) {
                    logic.setCategory(value!);
                  },
                ),
              ),
              Text('Select number of meal'),
              TextField(),
              Divider(),
              ElevatedButton(onPressed: () {}, child: Text('Save'))
            ],
          ),
        );
      },
    );
  }
}
