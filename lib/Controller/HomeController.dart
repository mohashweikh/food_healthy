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

  addMeal()async {
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
    } else {
      Get.snackbar('', 'You must fill allfields', snackPosition: SnackPosition.BOTTOM);
    }
    update();
    XFile? imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    file = File(imageFile!.path);
    update();
  }



   BannerAd?  bannerAd;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  bannerAd =   BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
            bannerAd = ad as BannerAd;
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    );
  bannerAd!.load();
     update();
  }
  FoodCategory selectedCategory = FoodCategory.burger;
  setCategory(FoodCategory foodCategory){
    this.selectedCategory=foodCategory;
    update();
  }


increase({required Tmeal meal}){
    if(meal.counter>=0)
  meal.counter++;
    update();
}
  decrease({required Tmeal meal}){
    meal.counter++;
    update();
  }
//////////////////Reset button
int calorieSum=0;
  getTotal(){
    burger.map((e) => calorieSum+=e.counter);
    sides.map((e) => calorieSum+=e.counter);
    update();
  }
  void reset() {
  burger.map((e) => e.counter=0);
  sides.map((e) => e.counter=0);
    update();
  }



}