import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:food_healthy/Model/Meal.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_picker/image_picker.dart';
import '../Helper/addHelper.dart';

enum FoodCategory { burger, sides }

class HomeController extends GetxController {
  TextEditingController nameMeal = TextEditingController();
  TextEditingController nnumberMeal = TextEditingController();
  TextEditingController countMeal = TextEditingController();
  List<Tmeal> burger = [];
  List<Tmeal> sides = [];
  File? file;

  selectFile() async {
    XFile? imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    file = File(imageFile!.path);
    update();
  }

  var rng = Random();

  addMeal() {
    if (nameMeal.text.isNotEmpty &&
        countMeal.text.isNotEmpty &&
        nnumberMeal.text.isNotEmpty &&
        file != null) {
      if (selectedCategory == FoodCategory.burger) {
        burger.add(Tmeal(
          id: rng.nextInt(100),
          name: nameMeal.text,
          image: file!.path,
          category: selectedCategory,
          numCalories: int.parse(nnumberMeal.text),
          counter: int.parse(countMeal.text),
        ));
      } else {
        sides.add(Tmeal(
          id: rng.nextInt(100),
          name: nameMeal.text,
          image: file!.path,
          category: selectedCategory,
          numCalories: int.parse(nnumberMeal.text),
          counter: int.parse(countMeal.text),
        ));
      }
    clearController();
      Get.back();
    } else {
      Get.snackbar('', 'You must fill allfields', snackPosition: SnackPosition.BOTTOM);
    }
    update();
  }
  clearController(){
    file=null;
    nnumberMeal.clear();
    nameMeal.clear();
    countMeal.clear();
    update();
  }
  BannerAd? bannerAd;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd = ad as BannerAd;
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    );
    bannerAd!.load();
    update();
  }

  FoodCategory selectedCategory = FoodCategory.burger;

  setCategory(FoodCategory foodCategory) {
    selectedCategory = foodCategory;
    update();
  }

  icrease({required Tmeal meal}) {
    meal.counter++;
    update();
  }

  decrease({required Tmeal meal}) {
    meal.counter--;
    update();
  }

  int calorieSum = 0;

  getTotalBurger() {
    burger.forEach((element) {
      calorieSum += element.counter;
    });
    update();
  }

  String displayMessage() {
    if (calorieSum > 2000) {
      return 'Thats A LOT of calories and very unhealthy for you!';
    } else {
      return 'Excessive junk food can lead to heart attack, diabetes and high blood pressure.';
    }
  }

//////////////////Reset button

  void reset() {
    burger.map((e) => e.counter = 0);
    sides.map((e) => e.counter = 0);
    update();
  }
}
