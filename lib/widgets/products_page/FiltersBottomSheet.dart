import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/hatch_mark.dart';
import 'package:another_xlider/models/hatch_mark_label.dart';
import 'package:another_xlider/models/tooltip/tooltip.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:another_xlider/widgets/sized_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';

class FiltersBottomSheet extends StatefulWidget {
  const FiltersBottomSheet({super.key});

  @override
  FiltersBottomSheetState createState() => FiltersBottomSheetState();
}

class FiltersBottomSheetState extends State<FiltersBottomSheet> {
  FontUtils fontUtils = FontUtils();
  Utils utils = Utils();
  double _lowerValue = 99;
  double _upperValue = 9999;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(id: "0", builder: (theme) {
      return Container(
        width: Get.width,
        height: Get.height,
        margin: EdgeInsets.only(top: 40.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.w), topLeft: Radius.circular(20.w)),
          color: theme.cardColor
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){
                    Get.back();
                  }, icon: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(TablerIcons.arrow_left, color: theme.textColor, size: 20.w,),
                      SizedBox(width: 6.w,),
                      Text("Search Product".tr, style: fontUtils.boldDescription(theme.textColor),)
                    ],
                  ))
                ],
              ),
            ),
            Container(
              width: Get.width,
              height: 1,
              color: theme.textColor.withOpacity(0.1),
            ),
            Expanded(child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Categories:".tr, style: fontUtils.boldLabel(theme.textColor),),
                    SizedBox(height: 6.h,),
                    Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        for(var i = 0; i < 6; i++)
                          Container(
                            margin: EdgeInsets.only(right: 6.w, bottom: 6.h),
                            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.w),
                              color: theme.backgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  color: theme.backgroundColor.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 12
                                )
                              ]
                            ),
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(TablerIcons.circle_x_filled, color: theme.textColor.withOpacity(0.9), size: 16.w,),
                                SizedBox(width: 4.w,),
                                Text("Cool Machines".tr, style: fontUtils.small(theme.textColor.withOpacity(0.9)),)
                              ],
                            ),
                          ),
                        InkWell(
                          onTap: () {
                            Get.dialog(Container(
                              width: Get.width,
                              height: Get.height,
                              margin: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Get.width,
                                    height: Get.height * 0.6,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.w),
                                      color: theme.cardColor
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 12.w),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Expanded(child: Text("Categories".tr, style: fontUtils.boldLabel(theme.textColor),)),
                                              IconButton(onPressed: (){
                                                Get.back();
                                              }, icon: Icon(TablerIcons.circle_x_filled, color: theme.textColor,))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: Get.width,
                                          height: 1,
                                          color: theme.textColor.withOpacity(0.2),
                                        ),
                                        Expanded(child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              for(var i = 0; i < 20; i++)
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Checkbox(value: i < 6, onChanged: (val) {

                                                    }, activeColor: theme.buttonColor,),
                                                    Text("Cool Machine".tr, style: fontUtils.description(theme.textColor),)
                                                  ],
                                                )
                                            ],
                                          ),
                                        ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ));
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 5.w, bottom: 6.h),
                            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.w),
                                color: theme.backgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: theme.backgroundColor.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 12
                                  )
                                ]
                            ),
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(TablerIcons.circle_plus, color: theme.textColor.withOpacity(0.9), size: 16.w,),
                                SizedBox(width: 4.w,),
                                Text("Add Category".tr, style: fontUtils.small(theme.textColor.withOpacity(0.9)),)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Text("Sub Categories:".tr, style: fontUtils.boldLabel(theme.textColor),),
                    SizedBox(height: 6.h,),
                    Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        for(var i = 0; i < 6; i++)
                          Container(
                            margin: EdgeInsets.only(right: 6.w, bottom: 6.h),
                            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.w),
                              color: theme.backgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  color: theme.backgroundColor.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 12
                                )
                              ]
                            ),
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(TablerIcons.circle_x_filled, color: theme.textColor.withOpacity(0.9), size: 16.w,),
                                SizedBox(width: 4.w,),
                                Text("Cool Machines".tr, style: fontUtils.small(theme.textColor.withOpacity(0.9)),)
                              ],
                            ),
                          ),
                        InkWell(
                          onTap: () {
                            Get.dialog(Container(
                              width: Get.width,
                              height: Get.height,
                              margin: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Get.width,
                                    height: Get.height * 0.6,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.w),
                                      color: theme.cardColor
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 12.w),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Expanded(child: Text("Sub Categories".tr, style: fontUtils.boldLabel(theme.textColor),)),
                                              IconButton(onPressed: (){
                                                Get.back();
                                              }, icon: Icon(TablerIcons.circle_x_filled, color: theme.textColor,))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: Get.width,
                                          height: 1,
                                          color: theme.textColor.withOpacity(0.2),
                                        ),
                                        Expanded(child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              for(var i = 0; i < 20; i++)
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Checkbox(value: i < 6, onChanged: (val) {

                                                    }, activeColor: theme.buttonColor,),
                                                    Text("Cool Machine".tr, style: fontUtils.description(theme.textColor),)
                                                  ],
                                                )
                                            ],
                                          ),
                                        ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ));
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 5.w, bottom: 6.h),
                            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.w),
                                color: theme.backgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: theme.backgroundColor.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 12
                                  )
                                ]
                            ),
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(TablerIcons.circle_plus, color: theme.textColor.withOpacity(0.9), size: 16.w,),
                                SizedBox(width: 4.w,),
                                Text("Add Sub Category".tr, style: fontUtils.small(theme.textColor.withOpacity(0.9)),)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Text("Brands:".tr, style: fontUtils.boldLabel(theme.textColor),),
                    SizedBox(height: 6.h,),
                    Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        for(var i = 0; i < 3; i++)
                          Container(
                            margin: EdgeInsets.only(right: 6.w, bottom: 6.h),
                            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.w),
                              color: theme.backgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  color: theme.backgroundColor.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 12
                                )
                              ]
                            ),
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(TablerIcons.circle_x_filled, color: theme.textColor.withOpacity(0.9), size: 16.w,),
                                SizedBox(width: 4.w,),
                                Text("Dawlence".tr, style: fontUtils.small(theme.textColor.withOpacity(0.9)),)
                              ],
                            ),
                          ),
                        InkWell(
                          onTap: () {
                            Get.dialog(Container(
                              width: Get.width,
                              height: Get.height,
                              margin: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Get.width,
                                    height: Get.height * 0.6,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.w),
                                      color: theme.cardColor
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: Get.width,
                                          padding: EdgeInsets.only(left: 12.w),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Expanded(child: Text("Brands".tr, style: fontUtils.boldLabel(theme.textColor),)),
                                              IconButton(onPressed: (){
                                                Get.back();
                                              }, icon: Icon(TablerIcons.circle_x_filled, color: theme.textColor,))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: Get.width,
                                          height: 1,
                                          color: theme.textColor.withOpacity(0.2),
                                        ),
                                        Expanded(child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              for(var i = 0; i < 20; i++)
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Checkbox(value: i < 6, onChanged: (val) {

                                                    }, activeColor: theme.buttonColor,),
                                                    Text("Dawlance".tr, style: fontUtils.description(theme.textColor),)
                                                  ],
                                                )
                                            ],
                                          ),
                                        ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ));
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 5.w, bottom: 6.h),
                            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.w),
                                color: theme.backgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: theme.backgroundColor.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 12
                                  )
                                ]
                            ),
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(TablerIcons.circle_plus, color: theme.textColor.withOpacity(0.9), size: 16.w,),
                                SizedBox(width: 4.w,),
                                Text("Add Brand".tr, style: fontUtils.small(theme.textColor.withOpacity(0.9)),)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Text("Price Range:".tr, style: fontUtils.boldLabel(theme.textColor),),
                    SizedBox(height: 6.h,),
                    FlutterSlider(
                      values: [_lowerValue, _upperValue],
                      max: 9999,
                      min: 99,
                      hatchMark: FlutterSliderHatchMark(
                        density: 0.5, // means 50 lines, from 0 to 100 percent
                        labels: [
                          FlutterSliderHatchMarkLabel(percent: 0, label: Text('\$99', style: fontUtils.small(theme.textColor),)),
                          FlutterSliderHatchMarkLabel(percent: 20, label: Text('\$1999', style: fontUtils.small(theme.textColor))),
                          FlutterSliderHatchMarkLabel(percent: 50, label: Text('\$4999', style: fontUtils.small(theme.textColor))),
                          FlutterSliderHatchMarkLabel(percent: 80, label: Text('\$7999', style: fontUtils.small(theme.textColor))),
                          FlutterSliderHatchMarkLabel(percent: 100, label: Text('\$9999', style: fontUtils.small(theme.textColor))),
                        ],
                        linesDistanceFromTrackBar: 0.h,
                        labelsDistanceFromTrackBar: 40.h,
                        displayLines: true,
                        smallLine: FlutterSliderSizedBox(
                          width: 1.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: theme.textColor
                          )
                        ),
                          bigLine: FlutterSliderSizedBox(
                          width: 1.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            color: theme.textColor
                          )
                        )
                      ),
                      trackBar: FlutterSliderTrackBar(
                        inactiveTrackBar: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: theme.buttonColor,
                          border: Border.all(width: 3, color: theme.buttonColor),
                        ),
                        activeTrackBar: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.blue.withOpacity(0.5)
                        ),
                      ),
                      tooltip: FlutterSliderTooltip(
                        leftPrefix: const Icon(Icons.attach_money, size: 19, color: Colors.black45,),
                        rightSuffix: const Icon(Icons.attach_money, size: 19, color: Colors.black45,),
                      ),
                      rangeSlider: true,
                      onDragging: (handlerIndex, lowerValue, upperValue) {
                        _lowerValue = lowerValue;
                        _upperValue = upperValue;
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 12.h,),
                    Text("Sort:".tr, style: fontUtils.boldLabel(theme.textColor),),
                    SizedBox(height: 6.h,),
                    Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                       Container(
                         margin: EdgeInsets.only(right: 6.w, bottom: 6.h),
                         child: Wrap(
                           alignment: WrapAlignment.start,
                           crossAxisAlignment: WrapCrossAlignment.center,
                           children: [
                             Radio(activeColor: theme.primaryColor, value: "0", groupValue: "0", onChanged: (val){

                             }),
                             SizedBox(width: 4.w,),
                             Text("High To Low".tr, style: fontUtils.small(theme.textColor.withOpacity(0.9)),)
                           ],
                         ),
                       ),
                        Container(
                         margin: EdgeInsets.only(right: 6.w, bottom: 6.h),
                         child: Wrap(
                           alignment: WrapAlignment.start,
                           crossAxisAlignment: WrapCrossAlignment.center,
                           children: [
                             Radio(activeColor: theme.primaryColor, value: "0", groupValue: "1", onChanged: (val){

                             }),
                             SizedBox(width: 4.w,),
                             Text("Low to High".tr, style: fontUtils.small(theme.textColor.withOpacity(0.9)),)
                           ],
                         ),
                       ),
                        Container(
                         margin: EdgeInsets.only(right: 6.w, bottom: 6.h),
                         child: Wrap(
                           alignment: WrapAlignment.start,
                           crossAxisAlignment: WrapCrossAlignment.center,
                           children: [
                             Radio(activeColor: theme.primaryColor, value: "0", groupValue: "1", onChanged: (val){

                             }),
                             SizedBox(width: 4.w,),
                             Text("Newest First".tr, style: fontUtils.small(theme.textColor.withOpacity(0.9)),)
                           ],
                         ),
                       ),
                        Container(
                         margin: EdgeInsets.only(right: 6.w, bottom: 6.h),
                         child: Wrap(
                           alignment: WrapAlignment.start,
                           crossAxisAlignment: WrapCrossAlignment.center,
                           children: [
                             Radio(activeColor: theme.primaryColor, value: "0", groupValue: "1", onChanged: (val){

                             }),
                             SizedBox(width: 4.w,),
                             Text("Oldest First".tr, style: fontUtils.small(theme.textColor.withOpacity(0.9)),)
                           ],
                         ),
                       ),
                      ],
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      );
    });
  }

}