
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_commerce/app_constants/constants.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  FontUtils fontUtils = FontUtils();
  var box = GetStorage();

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 2), (timer) async {
      timer.cancel();
      var userMap = await box.read(currentUser);

      // Get.offAllNamed(homeRoute);
      if(userMap == null) {
        Get.offAllNamed(loginRoute);
      } else {
          Get.offAllNamed(homeRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(id: "0",builder: (theme) {
      EasyLoading.instance
        ..displayDuration = const Duration(milliseconds: 2000)
        ..indicatorType = EasyLoadingIndicatorType.fadingCube
        ..loadingStyle = EasyLoadingStyle.custom
        ..indicatorSize = 25.0
        ..radius = 10.0
        ..maskType = EasyLoadingMaskType.black
        ..progressColor = theme.textColor
        ..backgroundColor = theme.cardColor
        ..indicatorColor = theme.textColor.withOpacity(0.8)
        ..textColor = theme.textColor
        ..maskColor = theme.cardColor.withOpacity(0.3)
        ..textPadding = EdgeInsets.symmetric(vertical: 20.h, horizontal: 45.w)
        ..textStyle = fontUtils.label(theme.textColor)
        ..userInteractions = false
        ..dismissOnTap = false;

      return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          backgroundColor: theme.backgroundColor,
        ),
      ),
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          color: theme.backgroundColor,
          child: Stack(
            children: [
              // Container(
              //     width: Get.width,
              //     height: Get.height,
              //     decoration: BoxDecoration(
              //         color: theme.backgroundColor
              //     ),
              //     child: Image.asset("assets/illustrations/buildings.png", fit: BoxFit.cover,)
              // ),
              Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  decoration: BoxDecoration(
                      color: theme.backgroundColor.withOpacity(0.9)
                  ),
                  child: Animate(
                    delay: const Duration(milliseconds: 900),
                    effects: const [FadeEffect(), ScaleEffect()],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(theme.theme == "0" ? "assets/images/logo/almumtaz-electronics.png" : "assets/images/logo/almumtaz-electronics.png" , height: 100.h,),
                        // Image.asset(theme.theme == "0" ? "assets/images/logo/logo.png" : "assets/images/logo/logo.png" , height: 60,),
                        SizedBox(height: 20.h,),
                        SpinKitFadingCube(color: theme.primaryColor, size: 30.w,)
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
    });
  }

}