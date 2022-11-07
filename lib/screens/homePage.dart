import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_healthy/Controller/HomeController.dart';
import 'package:food_healthy/screens/resultsPage.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../components/BottomButton.dart';
import '../components/burgerMenu.dart';
import '../components/resusable_card.dart';
import '../components/sidesMenu.dart';
import '../components/variables.dart';

class homePage extends StatelessWidget {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Padding(
      padding: EdgeInsets.all(10.h),
      child: GetBuilder<HomeController>(
        builder: (logic) {
          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: 8.w, top: 4.h, bottom: 10.h),
                          child: ReusableCard(
                            cardColor: logic.selectedCategory == FoodCategory.burger
                                ? activeCardColor
                                : inactiveCardColor,
                            foodIcon: FontAwesomeIcons.hamburger,
                            iconText: 'Burgers',
                            onTap: () {
                              logic.setCategory(  FoodCategory.burger);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 8.w, top: 4.h, bottom: 10.h),
                          child: ReusableCard(
                            cardColor: logic.selectedCategory == FoodCategory.sides
                                ? activeCardColor
                                : inactiveCardColor,
                            foodIcon: FontAwesomeIcons.drumstickBite,
                            iconText: 'Sides',
                            onTap: () {
                             logic.setCategory( FoodCategory.sides);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 8.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          color: Colors.white,
                          boxShadow: boxShadow),
                      child: Padding(
                        padding: EdgeInsets.all(4.w),
                        child:
                        // BurgerMenu()
                       logic.selectedCategory == FoodCategory.burger
                            ? BurgerMenu()
                            : sidesMenu(),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BottomButton(
                          text: 'Total Calories',
                          onPressed: () {
                              Get.to( ResultsPage(
                                calorieSum: logic.calorieSum.toString(),
                                resultText: '',
                              ));
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: BottomButton(
                            onPressed: () {
                             logic.reset();
                            },
                            text: 'Reset'),
                      )
                    ],
                  )
                ],
              ),
              if (logic.bannerAd != null)  PositionedDirectional(
                 bottom: 80.h,
                  end: 0.w,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    width: 400.w,
                    height: 80.h,
                    child: AdWidget(ad: logic.bannerAd!),
                  )),
            ],
          );
        },
      ),
    );
  }
}


