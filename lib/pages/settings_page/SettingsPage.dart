import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';
import 'package:smart_commerce/pages/profile_page/ProfilePage.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
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
                                  Text("Settings".tr, style: fontUtils.h6Bold(theme.whiteColor),)
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
                                  Icon(TablerIcons.info_circle, size: 20.w, color: theme.whiteColor,),
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
                          InkWell(
                            onTap: (){
                              Get.to(() => const ProfilePage());
                            },
                            child: Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(TablerIcons.user_edit, size: 18.w, color: theme.textColor.withOpacity(0.8),),
                                  SizedBox(width: 12.w,),
                                  Expanded(child: Text("Edit Account".tr, style: fontUtils.h6Bold(theme.textColor.withOpacity(0.8)),)),
                                  Icon(TablerIcons.chevron_right, size: 18.w, color: theme.textColor.withOpacity(0.8),),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: Get.width,
                            height: 1,
                            color: theme.textColor.withOpacity(0.3),
                          ),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(TablerIcons.world, size: 18.w, color: theme.textColor.withOpacity(0.8),),
                                SizedBox(width: 12.w,),
                                Expanded(child: Text("Language".tr, style: fontUtils.h6Bold(theme.textColor.withOpacity(0.8)),)),
                                Text("English", style: fontUtils.h6Bold(theme.textColor.withOpacity(0.8)),)
                              ],
                            ),
                          ),
                          Container(
                            width: Get.width,
                            height: 1,
                            color: theme.textColor.withOpacity(0.3),
                          ),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(TablerIcons.location_pin, size: 18.w, color: theme.textColor.withOpacity(0.8),),
                                SizedBox(width: 12.w,),
                                Expanded(child: Text("Addresses".tr, style: fontUtils.h6Bold(theme.textColor.withOpacity(0.8)),)),
                                Icon(TablerIcons.chevron_right, size: 18.w, color: theme.textColor.withOpacity(0.8),),
                              ],
                            ),
                          ),
                          Container(
                            width: Get.width,
                            height: 1,
                            color: theme.textColor.withOpacity(0.3),
                          ),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(TablerIcons.sun_moon, size: 18.w, color: theme.textColor.withOpacity(0.8),),
                                SizedBox(width: 12.w,),
                                Expanded(child: Text("Theme".tr, style: fontUtils.h6Bold(theme.textColor.withOpacity(0.8)),)),
                                Text("Dark", style: fontUtils.h6Bold(theme.textColor.withOpacity(0.8)),)
                              ],
                            ),
                          ),
                          Container(
                            width: Get.width,
                            height: 1,
                            color: theme.textColor.withOpacity(0.3),
                          ),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(TablerIcons.lock_exclamation, size: 18.w, color: theme.textColor.withOpacity(0.8),),
                                SizedBox(width: 12.w,),
                                Expanded(child: Text("Change Password".tr, style: fontUtils.h6Bold(theme.textColor.withOpacity(0.8)),)),
                                Icon(TablerIcons.chevron_right, size: 18.w, color: theme.textColor.withOpacity(0.8),),
                              ],
                            ),
                          ),
                          Container(
                            width: Get.width,
                            height: 1,
                            color: theme.textColor.withOpacity(0.3),
                          ),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(TablerIcons.bell, size: 18.w, color: theme.textColor.withOpacity(0.8),),
                                SizedBox(width: 12.w,),
                                Expanded(child: Text("Notification Settings".tr, style: fontUtils.h6Bold(theme.textColor.withOpacity(0.8)),)),
                                Icon(TablerIcons.chevron_right, size: 18.w, color: theme.textColor.withOpacity(0.8),),
                              ],
                            ),
                          ),
                          Container(
                            width: Get.width,
                            height: 1,
                            color: theme.textColor.withOpacity(0.3),
                          ),
                          SizedBox(height: 20.h,),
                          Container(
                            width: Get.width,
                            margin: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
                            child: utils.button(theme.primaryColor, "LOGOUT", theme.whiteColor, TablerIcons.logout, theme.whiteColor, null, null, () {

                            }),
                          ),
                          SizedBox(height: 20.h,),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: 30.w,),
                                Expanded(child: SizedBox(
                                  width: Get.width,
                                  child: Center(
                                    child: Text("Terms of use".tr, style: fontUtils.label(theme.textColor.withOpacity(0.5), underline: true),),
                                  ),
                                )),
                                Container(
                                  width: 1,
                                  color: theme.textColor.withOpacity(0.3),
                                ),
                                Expanded(child: SizedBox(
                                  width: Get.width,
                                  child: Center(
                                    child: Text("About Us".tr, style: fontUtils.label(theme.textColor.withOpacity(0.5), underline: true),),
                                  ),
                                )),
                                Container(
                                  width: 1,
                                  color: theme.textColor.withOpacity(0.3),
                                ),
                                Expanded(child: SizedBox(
                                  width: Get.width,
                                  child: Center(
                                    child: Text("Privacy Policy".tr, style: fontUtils.label(theme.textColor.withOpacity(0.5), underline: true),),
                                  ),
                                )),
                                SizedBox(width: 30.w,),
                              ],
                            ),
                          ),
                          SizedBox(height: 30.h,),
                          SizedBox(
                            width: Get.width,
                            child: Center(
                              child: Text("version 1.0.0".tr, style: fontUtils.label(theme.textColor.withOpacity(0.5)),),
                            ),
                          )
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
