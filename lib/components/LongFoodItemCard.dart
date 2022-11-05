import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_healthy/components/variables.dart';

class LongFoodItemCard extends StatefulWidget {
  String foodName;
  String foodNameUnder;
  int calories;
  void Function() increase;
  void Function() decrease;
  String counterText;
  Image image;

  LongFoodItemCard({
    required this.counterText,
    required this.increase,
    required this.decrease,
    required this.image,
    required this.foodNameUnder,
    required this.foodName,
    required this.calories,
  });

  @override
  _LongFoodItemCardState createState() => _LongFoodItemCardState();
}

class _LongFoodItemCardState extends State<LongFoodItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 4.h),
      child: Row(
        children: [
          widget.image,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${widget.foodName}',
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                '${widget.foodNameUnder}',
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            '(${widget.calories.toString()} cal)',
            style: TextStyle(fontSize: 15.r),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.counterText,
                style: TextStyle(fontSize: 25.sp),
              ),
              Row(
                children: [
                  FloatingActionButton(
                    onPressed: widget.decrease,
                    heroTag: null,
                    mini: true,
                    backgroundColor: primary_Color,
                    foregroundColor: Colors.black,
                    child: Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: widget.increase,
                    heroTag: null,
                    child: Icon(Icons.add),
                    backgroundColor: primary_Color,
                    foregroundColor: Colors.black,
                    mini: true,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
