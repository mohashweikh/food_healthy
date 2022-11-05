import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_healthy/screens/NewMealPage.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'components/variables.dart';
import 'screens/homePage.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: const Size(390, 830),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            primaryColor: primary_Color,
            scaffoldBackgroundColor: backgroundColor,
            textTheme: TextTheme(
                bodyText2: TextStyle(
              color: Colors.black,
            ))),
        home: child,
      );
    },
    child: Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              itemBuilder: (context)=>[
                PopupMenuItem<int>(
                  value: 0,
                  child: Text("Add Meal"),
                ),
              ],
            onSelected: (value){
                Get.to(NewMealPage());
            },
          )
        ],
        title: Text(
          "McDonald's Calorie Counter",
          style: TextStyle(
        color: Colors.white,
          ),
        ),
        backgroundColor: primary_Color,
      ),
      body: homePage(),
    ),
  ));
}
