import 'package:flutter/cupertino.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';

class OrdersWidget extends StatefulWidget {
  const OrdersWidget({super.key});

  @override
  OrdersWidgetState createState() => OrdersWidgetState();
}

class OrdersWidgetState extends State<OrdersWidget> {
  FontUtils fontUtils = FontUtils();
  Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(id: "0", builder: (theme) {
      return Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            color: theme.cardColor,
            boxShadow: [
              BoxShadow(
                  color: theme.textColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 12
              )
            ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60.h,
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      color: theme.backgroundColor
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset("assets/images/products/product_4.jpg", fit: BoxFit.cover,),
                ),
                SizedBox(width: 6.w,),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Refrigerator UX1900 Dawlance (Inverter & AC/DC)".tr, style: fontUtils.label(theme.textColor)),
                    Text("Brand: Rigix, Color: Red, unit: NOS".tr, style: fontUtils.small(theme.textColor.withOpacity(0.6)), maxLines: 1, overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 3.h,),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(
                              text: "AED 54.99",
                              style: fontUtils.label(theme.textColor.withOpacity(0.7))
                          ),
                          TextSpan(
                              text: "  ",
                              style: fontUtils.label(theme.textColor.withOpacity(0.7))
                          ),
                          TextSpan(
                              text: "AED 89.99",
                              style: fontUtils.label(theme.redColor.withOpacity(0.7), lineThrough: true)
                          ),
                        ]
                    )),
                    SizedBox(height: 3.h,),
                    Text("Quantity: 1".tr, style: fontUtils.boldSmall(theme.buttonColor.withOpacity(0.9)), maxLines: 1, overflow: TextOverflow.ellipsis,),
                  ],
                )),
              ],
            ),
            Container(
              width: Get.width,
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 4.h),
              color: theme.textColor.withOpacity(0.1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60.h,
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      color: theme.backgroundColor
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset("assets/images/products/product_3.jpg", fit: BoxFit.cover,),
                ),
                SizedBox(width: 6.w,),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Headset Audionic PK0900U Comboo Pack".tr, style: fontUtils.label(theme.textColor)),
                    Text("Brand: Audionic, Color: Red, unit: NOS".tr, style: fontUtils.small(theme.textColor.withOpacity(0.6)), maxLines: 1, overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 3.h,),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(
                              text: "AED 99.99",
                              style: fontUtils.label(theme.textColor.withOpacity(0.7))
                          ),
                          TextSpan(
                              text: "  ",
                              style: fontUtils.label(theme.textColor.withOpacity(0.7))
                          ),
                          TextSpan(
                              text: "AED 159.99",
                              style: fontUtils.label(theme.redColor.withOpacity(0.7), lineThrough: true)
                          ),
                        ]
                    )),
                    SizedBox(height: 3.h,),
                    Text("Quantity: 1".tr, style: fontUtils.boldSmall(theme.buttonColor.withOpacity(0.9)), maxLines: 1, overflow: TextOverflow.ellipsis,),
                  ],
                )),
              ],
            ),
            Container(
              width: Get.width,
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 4.h),
              color: theme.textColor.withOpacity(0.1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60.h,
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      color: theme.backgroundColor
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset("assets/images/products/product_2.jpg", fit: BoxFit.cover,),
                ),
                SizedBox(width: 6.w,),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mixer UX1900 Dawlance ".tr, style: fontUtils.label(theme.textColor)),
                    Text("Brand: Rigix, Color: Red, unit: NOS".tr, style: fontUtils.small(theme.textColor.withOpacity(0.6)), maxLines: 1, overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 3.h,),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(
                              text: "AED 36.99",
                              style: fontUtils.label(theme.textColor.withOpacity(0.7))
                          ),
                          TextSpan(
                              text: "  ",
                              style: fontUtils.label(theme.textColor.withOpacity(0.7))
                          ),
                          TextSpan(
                              text: "AED 69.99",
                              style: fontUtils.label(theme.redColor.withOpacity(0.7), lineThrough: true)
                          ),
                        ]
                    )),
                    SizedBox(height: 3.h,),
                    Text("Quantity: 1".tr, style: fontUtils.boldSmall(theme.buttonColor.withOpacity(0.9)), maxLines: 1, overflow: TextOverflow.ellipsis,),
                  ],
                )),
              ],
            ),
            Container(
              width: Get.width,
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 4.h),
              color: theme.textColor.withOpacity(0.1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Total Quantity: ",
                              style: fontUtils.small(theme.textColor.withOpacity(0.6))
                          ),
                          TextSpan(
                              text: "3",
                              style: fontUtils.boldLabel(theme.buttonColor)
                          ),
                        ]
                    )),
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Total Price: ",
                              style: fontUtils.small(theme.textColor.withOpacity(0.6))
                          ),
                          TextSpan(
                              text: "AED 239.98",
                              style: fontUtils.boldLabel(theme.primaryColor)
                          ),
                        ]
                    ))
                  ],
                )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(56.w),
                      color: theme.primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: theme.textColor.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 12
                        )
                      ]
                  ),
                  child: Text("See Details >>".tr, style: fontUtils.label(theme.whiteColor),),
                )
              ],
            )
          ],
        ),
      );
    });
  }

}