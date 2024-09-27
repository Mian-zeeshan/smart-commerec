import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  FontUtils fontUtils = FontUtils();
  Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        id: "0",
        builder: (theme) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: AppBar(
                backgroundColor: theme.primaryColor,
              ),
            ),
            body: SafeArea(
              child: SizedBox(
                width: Get.width,
                height: Get.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      decoration: BoxDecoration(
                          color: theme.primaryColor
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(TablerIcons.arrow_left, size: 20.w, color: theme.whiteColor,),
                                  SizedBox(width: 6.w,),
                                  Text("Account Details".tr, style: fontUtils.h6Bold(theme.whiteColor),)
                                ],
                              )
                          ),
                          Expanded(child: Container()),
                          IconButton(
                              onPressed: () {},
                              icon: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Save".tr, style: fontUtils.boldLabel(theme.whiteColor),)
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h,),
                          SizedBox(
                            width: Get.width,
                            height: 100.h,
                            child: Center(
                              child: SizedBox(
                                width: 100.h,
                                height: 100.h,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 100.h,
                                      height: 100.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: theme.cardColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: theme.textColor.withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 12
                                          )
                                        ]
                                      ),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Image.asset("assets/images/avatars/1.png", fit: BoxFit.cover,),
                                    ),
                                    Positioned(bottom: 0, right: 0, child: Container(
                                      width: 30.w,
                                      height: 30.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: theme.primaryColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: theme.primaryColor,
                                            spreadRadius: 1,
                                            blurRadius: 2
                                          )
                                        ]
                                      ),
                                      child: Center(
                                        child: Icon(TablerIcons.edit, size: 16.w, color: theme.whiteColor,),
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: utils.borderedInputField("First Name", theme.textColor.withOpacity(0.5), theme.textColor.withOpacity(0.5), null, null, theme.textColor, null, null, null, false, true, TextEditingController(), (val) => {

                                }))
                              ],
                            ),
                          ),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: utils.borderedInputField("Last Name", theme.textColor.withOpacity(0.5), theme.textColor.withOpacity(0.5), null, null, theme.textColor, null, null, null, false, true, TextEditingController(), (val) => {

                                }))
                              ],
                            ),
                          ),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: utils.borderedInputField("Phone", theme.textColor.withOpacity(0.5), theme.textColor.withOpacity(0.5), null, null, theme.textColor, null, null, null, false, true, TextEditingController(), (val) => {

                                }))
                              ],
                            ),
                          ),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: utils.borderedInputField("Email", theme.textColor.withOpacity(0.5), theme.textColor.withOpacity(0.5), null, null, theme.textColor, null, null, null, false, true, TextEditingController(), (val) => {

                                }))
                              ],
                            ),
                          ),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: utils.borderedInputField("Gender", theme.textColor.withOpacity(0.5), theme.textColor.withOpacity(0.5), null, null, theme.textColor, null, null, null, false, true, TextEditingController(), (val) => {

                                }))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          );
        });
  }

}