import 'dart:io';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_picker/image_picker.dart';

import '../addHelper.dart';
enum FoodCategory { burger, sides }
class HomeController extends GetxController{
  File? file;
  selectFile() async {
    XFile? imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    this.file = File(imageFile!.path);
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

  int bigMacCount = 0;
  int cheeseBurgerCount = 0;
  int chickenBurgerCount = 0;
  int quarterPounderCount = 0;

///////////////SIDES COUNTERS
  int largeFriesCount = 0;
  int chickenNuggetCount = 0;
  int largeCokeCount = 0;
  int softServeCount = 0;
// ///////////////

//////////////////Reset button

  void reset() {
    bigMacCount = 0;
    cheeseBurgerCount = 0;
    chickenBurgerCount = 0;
    quarterPounderCount = 0;
    largeFriesCount = 0;
    chickenNuggetCount = 0;
    largeCokeCount = 0;
    softServeCount = 0;
    update();
  }

  increaseLargeFriesCount(){
    this.largeFriesCount++;
    update();
  }

  decreaseLargeFriesCount(){
    if (largeFriesCount >= 1) largeFriesCount--;
    update();
  }

  increaseChickenNuggetCount(){
    chickenNuggetCount++;
update();
  }
  decreaseChickenNuggetCount(){
    if (chickenNuggetCount >= 1) chickenNuggetCount--;
  }

  increaselargeCokeCount(){
    largeCokeCount++;
    update();
  }
  decreaselargeCokeCount(){
    if (largeCokeCount >= 1) largeCokeCount--;
    update();
  }

  increaseSoftServeCount(){
    softServeCount++;
    update();
  }

  decreaseSoftServeCount(){
    if (softServeCount >= 1) softServeCount--;
    update();
  }

  increasebigMacCount(){
    bigMacCount++;
    update();
  }

  decreasebigMacCount(){
    if (bigMacCount >= 1) bigMacCount--;
    update();
  }

  increasecheeseBurgerCount(){
    cheeseBurgerCount++;
    update();
  }
  decreasecheeseBurgerCount(){
    if (cheeseBurgerCount >= 1) cheeseBurgerCount--;
    update();
  }

  increasequarterPounderCount(){
    quarterPounderCount++;
update();
  }

  decreasequarterPounderCount(){
    if (quarterPounderCount >= 1) quarterPounderCount--;
update();
  }

  increasechickenBurgerCount(){
    chickenBurgerCount++;
update();
  }
  decreasechickenBurgerCount(){
    if (chickenBurgerCount >= 1) chickenBurgerCount--;
update();
  }


}