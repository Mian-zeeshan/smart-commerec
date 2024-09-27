import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:smart_commerce/app_configs/config.dart';
import 'package:smart_commerce/app_constants/constants.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  AuthenticationPageState createState() => AuthenticationPageState();
}

class AuthenticationPageState extends State<AuthenticationPage> {
  //** Controllers
  ThemeController theme = Get.find();

  //** Utils
  FontUtils fontUtils = FontUtils();
  Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: SizedBox(
                width: Get.width,
                height: Get.height,
              child: Stack(
                children: [
                  Container(
                      width: Get.width,
                      height: Get.height,
                      decoration: BoxDecoration(
                          color: theme.backgroundColor
                      ),
                      child: Image.asset("assets/illustrations/buildings.png", fit: BoxFit.cover,)
                  ),
                  Container(
                      width: Get.width,
                      height: Get.height,
                      decoration: BoxDecoration(
                          color: theme.backgroundColor.withOpacity(0.85)
                      ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: Get.width,
                          margin: EdgeInsets.symmetric(horizontal: 30.w),
                          child: utils.button(theme.redColor, "Login With E-mail", theme.whiteColor, TablerIcons.user, theme.whiteColor, null, null, (){
                            Get.toNamed(loginRoute);
                          }),
                        ),
                        SizedBox(height: 12.h,),
                        Container(
                          width: Get.width,
                          margin: EdgeInsets.symmetric(horizontal: 30.w),
                          child: utils.button(theme.buttonColor, "Register With E-mail", theme.whiteColor, TablerIcons.user_plus, theme.whiteColor, null, null, (){

                          }),
                        ),
                        SizedBox(height: 20.h,),
                        Container(
                          width: Get.width,
                          margin: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  width: Get.width,
                                  margin: EdgeInsets.only(right: 6.w),
                                  color: theme.textColor.withOpacity(0.3),
                                ),
                              ),
                              Text("or", style: fontUtils.boldDescription(theme.textColor.withOpacity(0.5)),),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  margin: EdgeInsets.only(left: 6.w),
                                  width: Get.width,
                                  color: theme.textColor.withOpacity(0.3),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: (){

                              },
                              icon: Icon(TablerIcons.brand_facebook_filled, size: 24.w, color: theme.blueColor.withOpacity(0.8)),
                            ),
                            SizedBox(width: 12.w,),
                            IconButton(
                              onPressed: (){

                              },
                              icon: Icon(TablerIcons.brand_google_filled, size: 24.w, color: theme.redColor.withOpacity(0.8)),
                            ),
                            SizedBox(width: 12.w,),
                            IconButton(
                              onPressed: (){

                              },
                              icon: Icon(TablerIcons.brand_twitter_filled, size: 24.w, color: theme.lightBlueColor.withOpacity(0.8)),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h,)
                      ],
                    ),
                  ),
                  Positioned(
                    top: 80.h,
                    left: 10.w,
                    child: SizedBox(
                      width: Get.width * 0.6,
                      child: Image.asset("assets/images/logo/logo.png", fit: BoxFit.cover,),
                    )
                  )
                ],
              ),
            )),
          ],
        )
      ),
    );
  }
}