import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:smart_commerce/app_constants/constants.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ProductController.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';
import 'package:smart_commerce/controllers/UserController.dart';
import 'package:smart_commerce/pages/TermCondition/TermConditionPage.dart';
import 'package:smart_commerce/pages/profile_page/ProfilePage.dart';
import 'package:smart_commerce/views/PrivacyPolicy/PrivacyPolicyPage.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  AccountViewState createState() => AccountViewState();
}

class AccountViewState extends State<AccountView> {
  FontUtils fontUtils = FontUtils();
  // CarouselController carouselController = CarouselController();
  UserController _userController = Get.find();
  Utils utils = Utils();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        id: "0",
        builder: (theme) {
          return GetBuilder<ProductController>(
              id: "0",
              builder: (_products) {
                return Scaffold(
                    backgroundColor: theme.backgroundColor,
                    body: SizedBox(
                        width: Get.width,
                        height: Get.height,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: CustomScrollView(
                                slivers: [
                                  SliverAppBar(
                                      expandedHeight: 40.h,
                                      floating: true,
                                      elevation: 20.h,
                                      title: Row(
                                        children: [
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            "Account".tr,
                                            style:
                                                fontUtils.h5(theme.whiteColor),
                                          ),
                                        ],
                                      ),
                                      // leading: IconButton(
                                      //   icon: Container(
                                      //       width: 40.w,
                                      //       height: 40.w,
                                      //       decoration: BoxDecoration(
                                      //           shape: BoxShape.circle,
                                      //           color: theme.whiteColor),
                                      //       padding: EdgeInsets.all(1.w),
                                      //       child: Center(
                                      //         child: Container(
                                      //           width: 40.w,
                                      //           height: 40.w,
                                      //           decoration: BoxDecoration(
                                      //               shape: BoxShape.circle,
                                      //               color: theme.buttonColor),
                                      //           child: Image.asset(
                                      //             "assets/images/avatars/1.png",
                                      //           ),
                                      //         ),
                                      //       )),
                                      //   onPressed: () {},
                                      // ),
                                      titleSpacing: 0,
                                      //   flexibleSpace:
                                      //     _products.listBanners.isNotEmpty?
                                      //  FlexibleSpaceBar(
                                      //   centerTitle: true,
                                      //   titlePadding: EdgeInsets.zero,
                                      //   background: Container(

                                      //     width: Get.width,
                                      //     height: 180.h,
                                      //     color: theme.backgroundColor,
                                      //     child: Stack(

                                      //       children: [
                                      //         SizedBox(
                                      //           // color: theme.blackColor,
                                      //           width: Get.width,
                                      //           height: 180.h,

                                      //           child: FlutterCarousel(
                                      //             options: CarouselOptions(
                                      //               // controller: carouselController,
                                      //               onPageChanged: (page, reason) {

                                      //               },
                                      //               autoPlay: true,
                                      //               autoPlayAnimationDuration: const Duration(seconds: 1),
                                      //               autoPlayInterval: const Duration(seconds: 10),
                                      //               // viewportFraction: 16/9,
                                      //               height: Get.height,
                                      //               showIndicator: false,

                                      //               slideIndicator: CircularSlideIndicator(
                                      //                 slideIndicatorOptions: SlideIndicatorOptions( indicatorBackgroundColor: theme.buttonColor.withOpacity(0.5),
                                      //                   currentIndicatorColor: theme.buttonColor),

                                      //               ),
                                      //             ),
                                      //             items:  _products.listBanners .map((i) {
                                      //               return Builder(
                                      //                 builder: (BuildContext context) {
                                      //                   return Container(
                                      //                       width: Get.width,
                                      //                       height: Get.height,
                                      //                       decoration: BoxDecoration(
                                      //                           color: theme.cardColor
                                      //                       ),
                                      //                       foregroundDecoration: BoxDecoration(
                                      //                           color: theme.primaryColor.withOpacity(0.1)
                                      //                       ),
                                      //                       child:
                                      //                       CachedNetworkImage(
                                      //                       imageUrl: i.mediaDetails?.sizes?.large?.sourceUrl??"",
                                      //                       fit: BoxFit.fill,
                                      //                       placeholder: (_, __) =>
                                      //                           SpinKitDancingSquare(
                                      //                         color:
                                      //                             theme.primaryColor,
                                      //                       ),

                                      //                       errorWidget:( _ ,
                                      //                                       __,
                                      //                                       ___) =>
                                      //                                  Image.network( _products.listBanners[0].mediaDetails?.sizes?.large?.sourceUrl??"", fit:
                                      //                                   BoxFit.fill,)
                                      //                     ),

                                      //                       //  Image.asset("assets/images/banners/$i", fit: BoxFit.cover,)
                                      //                   );
                                      //                 },
                                      //               );
                                      //             }).toList(),
                                      //           ),
                                      //         ),

                                      //       ],
                                      //     ),
                                      //   ),
                                      // )
                                      // :const SizedBox.shrink(),

                                      surfaceTintColor: theme.primaryColor,
                                      pinned: true,
                                      actions: const [
                                        // IconButton(
                                        //     onPressed: () {
                                        //       Get.to(() => const SettingsPage());
                                        //     },
                                        //     icon: Column(
                                        //       mainAxisAlignment:
                                        //           MainAxisAlignment.start,
                                        //       crossAxisAlignment:
                                        //           CrossAxisAlignment.center,
                                        //       children: [
                                        //         Icon(TablerIcons.settings_2,
                                        //             color: theme.whiteColor,
                                        //             size: 22.w),
                                        //         Text(
                                        //           "Settings".tr,
                                        //           style: fontUtils
                                        //               .xSmall(theme.whiteColor),
                                        //         )
                                        //       ],
                                        //     )),
                                      ],
                                      backgroundColor: theme.primaryColor),
                                  SliverToBoxAdapter(
                                      child: Container(
                                          color: theme.backgroundColor,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                // Container(
                                                //   width: Get.width,
                                                //   decoration: BoxDecoration(
                                                //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.w), bottomRight: Radius.circular(12.w)),
                                                //     color: theme.buttonColor
                                                //   ),
                                                //   padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                                //   child: Column(
                                                //     mainAxisAlignment: MainAxisAlignment.start,
                                                //     crossAxisAlignment: CrossAxisAlignment.center,
                                                //     children: [
                                                //       SizedBox(height: 20.h,),
                                                //       IntrinsicHeight(
                                                //         child: Row(
                                                //           mainAxisAlignment: MainAxisAlignment.start,
                                                //           crossAxisAlignment: CrossAxisAlignment.center,
                                                //           children: [
                                                //             Expanded(child: Container(
                                                //               width: Get.width,
                                                //               padding: EdgeInsets.all(4.w),
                                                //               decoration: BoxDecoration(
                                                //                 borderRadius: BorderRadius.circular(4.w),
                                                //                 border: Border.all(color: theme.whiteColor),
                                                //                 boxShadow: [
                                                //                   BoxShadow(
                                                //                     color: theme.textColor.withOpacity(0.1),
                                                //                     blurRadius: 12,
                                                //                     spreadRadius: 2
                                                //                   )
                                                //                 ]
                                                //               ),
                                                //               child: Column(
                                                //                 mainAxisAlignment: MainAxisAlignment.center,
                                                //                 crossAxisAlignment: CrossAxisAlignment.center,
                                                //                 children: [
                                                //                   Icon(TablerIcons.headset, color: theme.whiteColor, size: 14.w,),
                                                //                   SizedBox(height: 2.h,),
                                                //                   Text("Customer Support".tr, style: fontUtils.xSmall(theme.whiteColor), textAlign: TextAlign.center,)
                                                //                 ],
                                                //               ),
                                                //             )),
                                                //             SizedBox(width: 10.w,),
                                                //             Expanded(child: Container(
                                                //               width: Get.width,
                                                //               padding: EdgeInsets.all(4.w),
                                                //               decoration: BoxDecoration(
                                                //                 borderRadius: BorderRadius.circular(4.w),
                                                //                 border: Border.all(color: theme.whiteColor),
                                                //                 boxShadow: [
                                                //                   BoxShadow(
                                                //                     color: theme.textColor.withOpacity(0.1),
                                                //                     blurRadius: 12,
                                                //                     spreadRadius: 2
                                                //                   )
                                                //                 ]
                                                //               ),
                                                //               child: Column(
                                                //                 mainAxisAlignment: MainAxisAlignment.center,
                                                //                 crossAxisAlignment: CrossAxisAlignment.center,
                                                //                 children: [
                                                //                   Icon(TablerIcons.info_circle, color: theme.whiteColor, size: 14.w,),
                                                //                   SizedBox(height: 2.h,),
                                                //                   Text("About Us".tr, style: fontUtils.xSmall(theme.whiteColor), textAlign: TextAlign.center,)
                                                //                 ],
                                                //               ),
                                                //             )),
                                                //             SizedBox(width: 10.w,),
                                                //             Expanded(child: Container(
                                                //               width: Get.width,
                                                //               padding: EdgeInsets.all(4.w),
                                                //               decoration: BoxDecoration(
                                                //                 borderRadius: BorderRadius.circular(4.w),
                                                //                 border: Border.all(color: theme.whiteColor),
                                                //                 boxShadow: [
                                                //                   BoxShadow(
                                                //                     color: theme.textColor.withOpacity(0.1),
                                                //                     blurRadius: 12,
                                                //                     spreadRadius: 2
                                                //                   )
                                                //                 ]
                                                //               ),
                                                //               child: Column(
                                                //                 mainAxisAlignment: MainAxisAlignment.center,
                                                //                 crossAxisAlignment: CrossAxisAlignment.center,
                                                //                 children: [
                                                //                   Icon(TablerIcons.message, color: theme.whiteColor, size: 14.w,),
                                                //                   SizedBox(height: 2.h,),
                                                //                   Text("Live Chat".tr, style: fontUtils.xSmall(theme.whiteColor), textAlign: TextAlign.center,)
                                                //                 ],
                                                //               ),
                                                //             )),
                                                //             SizedBox(width: 10.w,),
                                                //             Expanded(child: Container(
                                                //               width: Get.width,
                                                //               padding: EdgeInsets.all(4.w),
                                                //               decoration: BoxDecoration(
                                                //                 borderRadius: BorderRadius.circular(4.w),
                                                //                 border: Border.all(color: theme.whiteColor),
                                                //                 boxShadow: [
                                                //                   BoxShadow(
                                                //                     color: theme.textColor.withOpacity(0.1),
                                                //                     blurRadius: 12,
                                                //                     spreadRadius: 2
                                                //                   )
                                                //                 ]
                                                //               ),
                                                //               child: Column(
                                                //                 mainAxisAlignment: MainAxisAlignment.center,
                                                //                 crossAxisAlignment: CrossAxisAlignment.center,
                                                //                 children: [
                                                //                   Icon(TablerIcons.question_mark, color: theme.whiteColor, size: 14.w,),
                                                //                   SizedBox(height: 2.h,),
                                                //                   Text("FAQ".tr, style: fontUtils.xSmall(theme.whiteColor), textAlign: TextAlign.center,)
                                                //                 ],
                                                //               ),
                                                //             )),
                                                //           ],
                                                //         ),
                                                //       ),
                                                //       SizedBox(height: 20.h,),
                                                //     ],
                                                //   ),
                                                // ),

                                                // SizedBox(height: 10.h,),
                                                // Container(
                                                //   width: Get.width,
                                                //   margin: EdgeInsets.symmetric(horizontal: 12.w),
                                                //   decoration: BoxDecoration(
                                                //     borderRadius: BorderRadius.circular(4.w),
                                                //     color: theme.cardColor,
                                                //     boxShadow: [
                                                //       BoxShadow(
                                                //         color: theme.textColor.withOpacity(0.1),
                                                //         spreadRadius: 2,
                                                //         blurRadius: 12
                                                //       )
                                                //     ]
                                                //   ),
                                                //   child: Column(
                                                //     mainAxisAlignment: MainAxisAlignment.start,
                                                //     crossAxisAlignment: CrossAxisAlignment.center,
                                                //     children: [
                                                //       Row(
                                                //         mainAxisAlignment: MainAxisAlignment.start,
                                                //         crossAxisAlignment: CrossAxisAlignment.center,
                                                //         children: [
                                                //           SizedBox(width: 12.w,),
                                                //           Expanded(child: Text("Running Orders".tr, style: fontUtils.boldDescription(theme.textColor),)),
                                                //           SizedBox(width: 12.w,),
                                                //           TextButton(onPressed: (){ }, child: Text("View All>>".tr, style: fontUtils.label(theme.blueColor),))
                                                //         ],
                                                //       ),
                                                //       Container(
                                                //         width: Get.width,
                                                //         height: 1,
                                                //         color: theme.textColor.withOpacity(0.3),
                                                //       ),
                                                //       Container(
                                                //         width: Get.width,
                                                //         padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                                //         decoration: BoxDecoration(
                                                //             borderRadius: BorderRadius.circular(8.w),
                                                //             color: theme.cardColor
                                                //         ),
                                                //         child: Column(
                                                //           mainAxisAlignment: MainAxisAlignment.start,
                                                //           crossAxisAlignment: CrossAxisAlignment.start,
                                                //           children: [
                                                //             Row(
                                                //               mainAxisAlignment: MainAxisAlignment.start,
                                                //               crossAxisAlignment: CrossAxisAlignment.center,
                                                //               children: [
                                                //                 Container(
                                                //                   width: 40.h,
                                                //                   height: 40.h,
                                                //                   decoration: BoxDecoration(
                                                //                       borderRadius: BorderRadius.circular(8.w),
                                                //                       color: theme.backgroundColor
                                                //                   ),
                                                //                   clipBehavior: Clip.antiAliasWithSaveLayer,
                                                //                   child: Image.asset("assets/images/products/product_4.jpg", fit: BoxFit.cover,),
                                                //                 ),
                                                //                 SizedBox(width: 6.w,),
                                                //                 Expanded(child: Column(
                                                //                   mainAxisAlignment: MainAxisAlignment.start,
                                                //                   crossAxisAlignment: CrossAxisAlignment.start,
                                                //                   children: [
                                                //                     Text("1- Refrigerator UX1900 Dawlance (Inverter & AC/DC) x 1".tr, style: fontUtils.label(theme.textColor)),
                                                //                     SizedBox(height: 2.h,),
                                                //                     Text("2- AC UT1800U Hier (Inverter & AC/DC) x 1".tr, style: fontUtils.label(theme.textColor)),
                                                //                     SizedBox(height: 2.h,),
                                                //                     Text("3- Microwave Oven Hier x 1".tr, style: fontUtils.label(theme.textColor)),
                                                //                     SizedBox(height: 3.h,),
                                                //                   ],
                                                //                 )),
                                                //               ],
                                                //             ),
                                                //             Container(
                                                //               width: Get.width,
                                                //               height: 1,
                                                //               margin: EdgeInsets.symmetric(vertical: 4.h),
                                                //               color: theme.textColor.withOpacity(0.1),
                                                //             ),
                                                //             Row(
                                                //               mainAxisAlignment: MainAxisAlignment.end,
                                                //               crossAxisAlignment: CrossAxisAlignment.center,
                                                //               children: [
                                                //                 Expanded(child: Column(
                                                //                   mainAxisAlignment: MainAxisAlignment.start,
                                                //                   crossAxisAlignment: CrossAxisAlignment.start,
                                                //                   children: [
                                                //                     RichText(text: TextSpan(
                                                //                         children: [
                                                //                           TextSpan(
                                                //                               text: "Total Quantity: ",
                                                //                               style: fontUtils.small(theme.textColor.withOpacity(0.6))
                                                //                           ),
                                                //                           TextSpan(
                                                //                               text: "3",
                                                //                               style: fontUtils.boldLabel(theme.buttonColor)
                                                //                           ),
                                                //                         ]
                                                //                     )),
                                                //                     RichText(text: TextSpan(
                                                //                         children: [
                                                //                           TextSpan(
                                                //                               text: "Total Price: ",
                                                //                               style: fontUtils.small(theme.textColor.withOpacity(0.6))
                                                //                           ),
                                                //                           TextSpan(
                                                //                               text: "AED 239.98",
                                                //                               style: fontUtils.boldLabel(theme.primaryColor)
                                                //                           ),
                                                //                         ]
                                                //                     ))
                                                //                   ],
                                                //                 )),
                                                //                 Container(
                                                //                   padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                                //                   decoration: BoxDecoration(
                                                //                       borderRadius: BorderRadius.circular(56.w),
                                                //                       color: theme.primaryColor,
                                                //                       boxShadow: [
                                                //                         BoxShadow(
                                                //                             color: theme.textColor.withOpacity(0.1),
                                                //                             spreadRadius: 2,
                                                //                             blurRadius: 12
                                                //                         )
                                                //                       ]
                                                //                   ),
                                                //                   child: Text("Track Order".tr, style: fontUtils.label(theme.whiteColor),),
                                                //                 )
                                                //               ],
                                                //             )
                                                //           ],
                                                //         ),
                                                //       ),
                                                //     ],
                                                //   ),
                                                // ),
                                                // SizedBox(height: 10.h,),

                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    if (GetPlatform.isAndroid)
                                                      InkWell(
                                                        onTap: () {
                                                          Get.to(() =>
                                                              const ProfilePage());
                                                        },
                                                        child: Container(
                                                          width: Get.width,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      12.w,
                                                                  vertical:
                                                                      12.h),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                TablerIcons
                                                                    .user_edit,
                                                                size: 18.w,
                                                                color: theme
                                                                    .textColor
                                                                    .withOpacity(
                                                                        0.8),
                                                              ),
                                                              SizedBox(
                                                                width: 12.w,
                                                              ),
                                                              Expanded(
                                                                  child: Text(
                                                                "Edit Account"
                                                                    .tr,
                                                                style: fontUtils
                                                                    .h6Bold(theme
                                                                        .textColor
                                                                        .withOpacity(
                                                                            0.8)),
                                                              )),
                                                              Icon(
                                                                TablerIcons
                                                                    .chevron_right,
                                                                size: 18.w,
                                                                color: theme
                                                                    .textColor
                                                                    .withOpacity(
                                                                        0.8),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                   
                                                     Container(
                                                      width: Get.width,
                                                      height: 1,
                                                      color: theme.textColor
                                                          .withOpacity(0.3),
                                                    ),
                                                    Container(
                                                      width: Get.width,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 12.w,
                                                              vertical: 12.h),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                             TablerIcons
                                                                    .user,
                                                            size: 18.w,
                                                            color: theme
                                                                .textColor
                                                                .withOpacity(
                                                                    0.8),
                                                          ),
                                                          SizedBox(
                                                            width: 12.w,
                                                          ),
                                                          Expanded(
                                                              child: Text(
                                                            "Profile".tr,
                                                            style: fontUtils
                                                                .h6Bold(theme
                                                                    .textColor
                                                                    .withOpacity(
                                                                        0.8)),
                                                          )),
                                                          Column(
                                                            children: [
                                                              Text(
                                                                "${_userController.userModel.userDisplayName??"--:--"}",
                                                                style: fontUtils
                                                                    .label(theme
                                                                        .textColor
                                                                        .withOpacity(
                                                                            0.8)),
                                                              ),
                                                              Text(
                                                                "${_userController.userModel.userEmail??"--:--"}",
                                                                style: fontUtils
                                                                    .xSmall(theme
                                                                        .textColor
                                                                        .withOpacity(
                                                                            0.8)),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                   
                                                    Container(
                                                      width: Get.width,
                                                      height: 1,
                                                      color: theme.textColor
                                                          .withOpacity(0.3),
                                                    ),
                                                    Container(
                                                      width: Get.width,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 12.w,
                                                              vertical: 12.h),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            TablerIcons.world,
                                                            size: 18.w,
                                                            color: theme
                                                                .textColor
                                                                .withOpacity(
                                                                    0.8),
                                                          ),
                                                          SizedBox(
                                                            width: 12.w,
                                                          ),
                                                          Expanded(
                                                              child: Text(
                                                            "Language".tr,
                                                            style: fontUtils
                                                                .h6Bold(theme
                                                                    .textColor
                                                                    .withOpacity(
                                                                        0.8)),
                                                          )),
                                                          Text(
                                                            "English",
                                                            style: fontUtils
                                                                .h6Bold(theme
                                                                    .textColor
                                                                    .withOpacity(
                                                                        0.8)),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                   
                                                  
                                                    Container(
                                                      width: Get.width,
                                                      height: 1,
                                                      color: theme.textColor
                                                          .withOpacity(0.3),
                                                    ),
                                                    Container(
                                                      width: Get.width,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 12.w,
                                                              vertical: 12.h),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            TablerIcons
                                                                .sun_moon,
                                                            size: 18.w,
                                                            color: theme
                                                                .textColor
                                                                .withOpacity(
                                                                    0.8),
                                                          ),
                                                          SizedBox(
                                                            width: 12.w,
                                                          ),
                                                          Expanded(
                                                              child: Text(
                                                            "Theme".tr,
                                                            style: fontUtils
                                                                .h6Bold(theme
                                                                    .textColor
                                                                    .withOpacity(
                                                                        0.8)),
                                                          )),
                                                          Text(
                                                            "Light",
                                                            style: fontUtils
                                                                .h6Bold(theme
                                                                    .textColor
                                                                    .withOpacity(
                                                                        0.8)),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: Get.width,
                                                      height: 1,
                                                      color: theme.textColor
                                                          .withOpacity(0.3),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        utils.alert(
                                                            theme: theme,
                                                            title:
                                                                "Account Deletion",
                                                            message:
                                                                "Are you sure you want to permanently delete your account?",
                                                            type: "warning",positiveText: "Cancel",negativeText: "Delete",onNegativePress: (){

                                                              Get.back();
EasyLoading.show(status: "Deleting..");
_userController.deleteAccount(email: _userController.userModel.userEmail??"",theme: theme);

                                                            },onPositivePress: (){Get.back();});
                                                      },
                                                      child: Container(
                                                        width: Get.width,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    12.w,
                                                                vertical: 12.h),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              CupertinoIcons
                                                                  .person_badge_minus,
                                                              size: 18.w,
                                                              color: theme
                                                                  .textColor
                                                                  .withOpacity(
                                                                      0.8),
                                                            ),
                                                            SizedBox(
                                                              width: 12.w,
                                                            ),
                                                            Expanded(
                                                                child: Text(
                                                              "Delete Account"
                                                                  .tr,
                                                              style: fontUtils
                                                                  .h6Bold(theme
                                                                      .textColor
                                                                      .withOpacity(
                                                                          0.8)),
                                                            )),
                                                            Icon(
                                                              TablerIcons
                                                                  .chevron_right,
                                                              size: 18.w,
                                                              color: theme
                                                                  .textColor
                                                                  .withOpacity(
                                                                      0.8),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    // Container(
                                                    //   width: Get.width,
                                                    //   height: 1,
                                                    //   color: theme.textColor.withOpacity(0.3),
                                                    // ),
                                                    // Container(
                                                    //   width: Get.width,
                                                    //   padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                                                    //   child: Row(
                                                    //     mainAxisAlignment: MainAxisAlignment.start,
                                                    //     crossAxisAlignment: CrossAxisAlignment.center,
                                                    //     children: [
                                                    //       Icon(TablerIcons.bell, size: 18.w, color: theme.textColor.withOpacity(0.8),),
                                                    //       SizedBox(width: 12.w,),
                                                    //       Expanded(child: Text("Notification Settings".tr, style: fontUtils.h6Bold(theme.textColor.withOpacity(0.8)),)),
                                                    //       Icon(TablerIcons.chevron_right, size: 18.w, color: theme.textColor.withOpacity(0.8),),
                                                    //     ],
                                                    //   ),
                                                    // ),

                                                    Container(
                                                      width: Get.width,
                                                      height: 1,
                                                      color: theme.textColor
                                                          .withOpacity(0.3),
                                                    ),
                                                    SizedBox(
                                                      height: 20.h,
                                                    ),
                                                    Container(
                                                      width: Get.width,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  Get.width *
                                                                      0.2),
                                                      child: utils.button(
                                                          theme.primaryColor,
                                                          "LOGOUT",
                                                          theme.whiteColor,
                                                          TablerIcons.logout,
                                                          theme.whiteColor,
                                                          null,
                                                          null, () {
                                                        _userController.box
                                                            .erase();

                                                        Get.offAllNamed(
                                                            loginRoute);
                                                      }),
                                                    ),
                                                    SizedBox(
                                                      height: 20.h,
                                                    ),
                                                    IntrinsicHeight(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            width: 30.w,
                                                          ),
                                                          Expanded(
                                                              child: SizedBox(
                                                            width: Get.width,
                                                            child: Center(
                                                              child:
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Get.to(() =>
                                                                            TermConditionPage());
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        "Terms Of Use"
                                                                            .tr,
                                                                        style: fontUtils.label(
                                                                            theme.textColor.withOpacity(
                                                                                0.5),
                                                                            underline:
                                                                                true),
                                                                      )),
                                                            ),
                                                          )),
                                                          Container(
                                                            width: 1,
                                                            color: theme
                                                                .textColor
                                                                .withOpacity(
                                                                    0.3),
                                                          ),
                                                          Expanded(
                                                              child: SizedBox(
                                                            width: Get.width,
                                                            child: Center(
                                                              child: Text(
                                                                "About Us".tr,
                                                                style: fontUtils.label(
                                                                    theme
                                                                        .textColor
                                                                        .withOpacity(
                                                                            0.5),
                                                                    underline:
                                                                        true),
                                                              ),
                                                            ),
                                                          )),
                                                          Container(
                                                            width: 1,
                                                            color: theme
                                                                .textColor
                                                                .withOpacity(
                                                                    0.3),
                                                          ),
                                                          Expanded(
                                                              child: SizedBox(
                                                            width: Get.width,
                                                            child: Center(
                                                              child:
                                                                  GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Get.to(() =>
                                                                            Privacypolicypage());
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        "Privacy Policy"
                                                                            .tr,
                                                                        style: fontUtils.label(
                                                                            theme.textColor.withOpacity(
                                                                                0.5),
                                                                            underline:
                                                                                true),
                                                                      )),
                                                            ),
                                                          )),
                                                          SizedBox(
                                                            width: 30.w,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 30.h,
                                                    ),
                                                    SizedBox(
                                                      width: Get.width,
                                                      child: Center(
                                                        child: Text(
                                                          "version 1.0.0".tr,
                                                          style: fontUtils
                                                              .label(theme
                                                                  .textColor
                                                                  .withOpacity(
                                                                      0.5)),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )

                                                // Text("Coupons Available".tr, style: fontUtils.boldDescription(theme.textColor.withOpacity(0.8)),),
                                                // SizedBox(height: 10.h,),
                                                // const CouponBanners(),
                                                // SizedBox(height: 10.h,),
                                                // Text("Smart Wallet".tr, style: fontUtils.boldDescription(theme.textColor.withOpacity(0.8)),),
                                                // SizedBox(height: 10.h,),
                                                // Container(
                                                //   width: Get.width,
                                                //   margin: EdgeInsets.symmetric(horizontal: 12.w),
                                                //   decoration: BoxDecoration(
                                                //       borderRadius: BorderRadius.circular(4.w),
                                                //       color: theme.primaryColor,
                                                //       boxShadow: [
                                                //         BoxShadow(
                                                //             color: theme.primaryColor.withOpacity(0.1),
                                                //             spreadRadius: 2,
                                                //             blurRadius: 12
                                                //         )
                                                //       ]
                                                //   ),
                                                //   child: Column(
                                                //     mainAxisAlignment: MainAxisAlignment.start,
                                                //     crossAxisAlignment: CrossAxisAlignment.center,
                                                //     children: [
                                                //       Container(
                                                //         width: Get.width,
                                                //         height: 1,
                                                //         color: theme.whiteColor.withOpacity(0.3),
                                                //       ),
                                                //       IntrinsicHeight(
                                                //         child: Row(
                                                //           mainAxisAlignment: MainAxisAlignment.start,
                                                //           crossAxisAlignment: CrossAxisAlignment.center,
                                                //           children: [
                                                //             Expanded(child: SizedBox(
                                                //               width: Get.width,
                                                //               height: 60.h,
                                                //               child: Column(
                                                //                 mainAxisAlignment: MainAxisAlignment.center,
                                                //                 crossAxisAlignment: CrossAxisAlignment.center,
                                                //                 children: [
                                                //                   Text("Available Balance".tr, style: fontUtils.small(theme.whiteColor.withOpacity(0.9)),),
                                                //                   Text("12,000".tr, style: fontUtils.boldDescription(theme.whiteColor.withOpacity(1)),),
                                                //                 ],
                                                //               ),
                                                //             )),
                                                //             Container(
                                                //               width: 1,
                                                //               color: theme.whiteColor.withOpacity(0.8),
                                                //               margin: EdgeInsets.symmetric(vertical: 20.h),
                                                //             ),
                                                //             Expanded(child: SizedBox(
                                                //               width: Get.width,
                                                //               height: 60.h,
                                                //               child: Column(
                                                //                 mainAxisAlignment: MainAxisAlignment.center,
                                                //                 crossAxisAlignment: CrossAxisAlignment.center,
                                                //                 children: [
                                                //                   Text("Used Balance".tr, style: fontUtils.small(theme.whiteColor.withOpacity(0.9)),),
                                                //                   Text("16,450".tr, style: fontUtils.boldDescription(theme.whiteColor.withOpacity(1)),),
                                                //                 ]
                                                //               )
                                                //             )),
                                                //           ],
                                                //         ),
                                                //       )
                                                //     ],
                                                //   ),
                                                // ),
                                              ])))
                                ],
                              ))
                            ])));
              });
        });
  }
}
