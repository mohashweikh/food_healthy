import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/BottomButton.dart';
import '../components/variables.dart';

class ResultsPage extends StatelessWidget {
  final String calorieSum;
  final String resultText;

  ResultsPage({required this.calorieSum, required this.resultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Center(
            child: Text(
          "McDonald's Calorie Counter",
          style: TextStyle(
            color: Colors.black,
          ),
        )),
        backgroundColor: primary_Color,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding:  EdgeInsets.only(bottom: 10.w),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: boxShadow,
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20.r))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(top: 10.h),
                        child: Text(
                          'TOTAL CALORIES',
                          style: TextStyle(
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            calorieSum,
                            style: TextStyle(
                                fontSize: 80.sp, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'cal',
                            style: TextStyle(fontSize: 30.sp),
                          ),
                        ],
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(
                          resultText,
                          style: TextStyle(fontSize: 20.sp),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(bottom: 15.h),
                        child: Column(
                          children: [
                            Text(
                              'Average daily intake for men is 2500 calories',
                              textAlign: TextAlign.center,
                              style: adviceTextStyle,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              'Average daily intake for women is 2000 calories',
                              textAlign: TextAlign.center,
                              style: adviceTextStyle,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            BottomButton(
              onPressed: () {
                Navigator.pop(context);
              },
              text: 'Recalculate',
            )
          ],
        ),
      ),
    );
  }
}
