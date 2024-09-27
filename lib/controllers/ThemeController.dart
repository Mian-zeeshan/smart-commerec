import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_commerce/app_constants/constants.dart';

class ThemeController extends GetxController {
  String theme = "0";

  var isApplyTour = true;

  //** Light colors
  var primaryBlueColor = const Color(0xff1f2054);
  var primaryYellowColor = const Color(0xfff3a913);
  var primaryGreenColor = const Color(0xFF3AB54A);
  var primaryLightBlueColor = const Color(0xFF0B60CB);
  var primaryRedColor = const Color(0xFFFE3636);
  var secondaryBlueColor = const Color(0xff2e2f7a);
  var secondaryYellowColor = const Color(0xffffbf47);
  var secondaryLightBlueColor = const Color(0xFF0D6FEC);
  var secondaryRedColor = const Color(0xFFFC4848);
  var secondaryGreenColor = const Color(0xFF45D357);
  var primaryDarkColor = const Color(0xff171919);
  var secondaryDarkColor = const Color(0xff1d2121);
  var primaryColor = const Color(0xfff3a913);
  var secondaryColor = const Color(0xffffbf47);
  var transparentColor = const Color(0x00ffffff);

  //Light Colors
  var lightGrayColor = const Color(0xff9ca7ac);
  var lightWhiteColor = const Color(0xffffffff);
  var lightCardColor = const Color(0xffffffff);
  var lightTextColor = const Color(0xff222525);
  var lightButtonColor = const Color(0xff1f2054);
  var lightButtonTextColor = const Color(0xFFffffff);
  var lightBackgroundColor = const Color(0xfeedeffe);

  var grayColor = const Color(0xff9ca7ac);
  var whiteColor = const Color(0xffffffff);
  var cardColor = const Color(0xffffffff);
  var backgroundColor = const Color(0xfeedeffe);
  var blackColor = const Color(0xFF000000);
  var blueColor = const Color(0xFF0B438C);
  var lightBlueColor = const Color(0xFF0071FF);
  var redColor = const Color(0xFFFE3636);
  var yellowColor = const Color(0xffffbf47);
  var yellowLightColor = const Color(0xfff6cb7a);
  var ascentColor = const Color(0xFF3AE78C);
  var purpleColor = const Color(0xFF6B09B1);
  var brownColor = const Color(0xFFF47D35);
  var greenColor = const Color(0xFF3AB54A);
  var pinkColor = const Color(0xFFFC03BB);
  var burgundyColor = const Color(0xFF950B38);
  var textColor = const Color(0xff222525);
  var buttonColor = const Color(0xfff3a913);
  var buttonTextColor = const Color(0xFFffffff);

  //** Dark colors
  var darkGrayColor = const Color(0xffe0edf5);
  var darkCardColor = const Color(0xff161D31);
  var darkBackgroundColor = const Color(0xff1d2641);
  var darkTextColor = const Color(0xFFf3f3f4);

  var box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    updateData();
    getTour();
  }

  void updateData() async {
    await getTheme();
    update(["0"]);
  }

  updateWidget() {
    update(['0']);
    notifyChildrens();
  }
  int selectedIndex = -1; 
  updateSelectedIndex(val){
     selectedIndex = val; 
     update(['0']);
     notifyChildrens();
  }

  void updateTheme(selectedTheme) async {
    await box.write(storageTheme, selectedTheme);
    await getTheme();
    update(["0"]);
  }

  Future getTheme() async {
    var them = await box.read(storageTheme);
    if (them == null) {
      theme = "0";
      await box.write(storageTheme, them);
    } else {
      theme = them;
    }

    if (theme == "0") {
      // primaryColor = const Color(0xff133294);
      primaryColor=Color(0xff1E56AB);
      secondaryColor = Color(0xffDB001C);
      // primaryColor = primaryYellowColor;
      // secondaryColor = secondaryColor;
      textColor = lightTextColor;
      buttonColor = lightButtonColor;
      buttonTextColor = lightButtonTextColor;
      backgroundColor=whiteColor;
      // backgroundColor = lightBackgroundColor;
      grayColor = lightGrayColor;
      cardColor = lightCardColor;
    } else if (theme == "1") {
      primaryColor = primaryLightBlueColor;
      secondaryColor = secondaryLightBlueColor;
      textColor = lightTextColor;
      buttonColor = lightButtonColor;
      buttonTextColor = lightButtonTextColor;
      backgroundColor = lightBackgroundColor;
      grayColor = lightGrayColor;
      cardColor = lightCardColor;
    } else if (theme == "2") {
      primaryColor = primaryGreenColor;
      secondaryColor = secondaryGreenColor;
      textColor = lightTextColor;
      buttonColor = lightButtonColor;
      buttonTextColor = lightButtonTextColor;
      backgroundColor = lightBackgroundColor;
      grayColor = lightGrayColor;
      cardColor = lightCardColor;
    } else if (theme == "3") {
      primaryColor = primaryYellowColor;
      secondaryColor = secondaryYellowColor;
      textColor = lightTextColor;
      buttonColor = lightButtonColor;
      buttonTextColor = lightButtonTextColor;
      backgroundColor = lightBackgroundColor;
      grayColor = lightGrayColor;
      cardColor = lightCardColor;
    } else {
      primaryColor = primaryBlueColor;
      secondaryColor = secondaryBlueColor;
      textColor = darkTextColor;
      buttonColor = primaryBlueColor;
      buttonTextColor = buttonTextColor;
      backgroundColor = darkBackgroundColor;
      grayColor = darkGrayColor;
      cardColor = darkCardColor;
    }
  }

  void getTour() async {
    var value = await box.read(isTour);
    if (value != null) {
      isApplyTour = false;
    } else {
      isApplyTour = true;
    }
    update(["0"]);
  }

  setTour() async {
    await box.write(isTour, "false");
  }
}
