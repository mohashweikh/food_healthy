import 'package:food_healthy/Controller/HomeController.dart';

class Tmeal {
  int id;
  String name, image;
  FoodCategory category;
  int numCalories, counter;

  Tmeal(
      {required this.name,
      required this.id,
      required this.image,
      required this.category,
      required this.numCalories,
      required this.counter,
     });
}
