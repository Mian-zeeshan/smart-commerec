import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ProductController.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';

class FlashSaleView extends StatefulWidget {
  const FlashSaleView({super.key});

  @override
  FlashSaleViewState createState() => FlashSaleViewState();
}

class FlashSaleViewState extends State<FlashSaleView> {
  FontUtils fontUtils = FontUtils();
  Utils utils = Utils();

  var products = [
    {
      "name": "Hier 20 KG Washing Machine",
      "image": "washing_machine.png"
    },
    {
      "name": "Dawlence Dual Door Refrigerator",
      "image": "refrigerator.png"
    },
    {
      "name": "Super Asia Microwave Oven",
      "image": "oven.png"
    },
    {
      "name": "Hier Inverter AC 1.0 TON",
      "image": "ac.png"
    },
    {
      "name": "Super Asia 16900WU Air Cooler",
      "image": "cooler.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(id: "0", builder: (theme) {
      return GetBuilder<ProductController>(
        id: "0",
        builder: (_productController) {
          return Container(
            width: Get.width,
            margin: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.w),
                color: theme.cardColor,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 5,
                      color: theme.textColor.withOpacity(0.1)
                  )
                ]
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                  decoration: BoxDecoration(
                      color: theme.redColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(TablerIcons.bolt, size: 26.w, color: theme.whiteColor,),
                      SizedBox(width: 8.w,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                               Text("Top Categories".tr, style: fontUtils.h6BoldItalic(theme.whiteColor),),
                            // Text("FLASH SALES".tr, style: fontUtils.h6BoldItalic(theme.whiteColor),),
                            SizedBox(height: 2.h,),
                            // Text("Enjoy the 12.12 flash sale.".tr, style: fontUtils.small(theme.whiteColor.withOpacity(0.9)),),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.h),
                            color: theme.whiteColor
                        ),
                        child: Text("View All".tr, style: fontUtils.boldSmall(theme.primaryColor),),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.h,),
                SizedBox(
                  width: Get.width,
                  height: 130.h,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for(var i = 0 ; i < _productController.productCategoryList.length; i++)
                            Container(
                              width: 120.h,
                              height: 130.h,
                              margin: EdgeInsets.only(left: 8.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.h)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 120.h,
                                    height: 80.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6.h),
                                        color: theme.backgroundColor
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: 
                                    CachedNetworkImage(
                      imageUrl:   _productController.productCategoryList[i].image!=null? _productController.productCategoryList[i].image!.src??"":""
                     , fit: BoxFit.cover,
                      placeholder: (_, __) => SpinKitDancingSquare(
                        color: theme.primaryColor,
                      ),
                      errorWidget: (_, __, ___) =>
                          Image.asset("assets/images/place_holder.jpg"),
                    ),
                                    // Image.asset("assets/images/products/${products[i]["image"]}", fit: BoxFit.contain,),
                                  ),
                                  SizedBox(height: 4.h,),
                                  SizedBox(
                                    width: 120.h,
                                    height: 46.h,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("${  _productController.productCategoryList[i].name}".tr, style: fontUtils.xSmall(theme.textColor), maxLines: 1, overflow: TextOverflow.ellipsis,),
                                            SizedBox(height: 2.h,),
                                            RichText(text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                      text: "AED 50.45",
                                                      style: fontUtils.label(theme.buttonColor)
                                                  ),
                                                  TextSpan(
                                                      text: "   ",
                                                      style: fontUtils.label(theme.buttonColor)
                                                  ),
                                                  TextSpan(
                                                      text: "AED 110.90",
                                                      style: fontUtils.label(theme.redColor, lineThrough: true)
                                                  ),
                                                ]
                                            )),
                                            SizedBox(height: 2.h,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Icon(TablerIcons.star_filled, color: theme.yellowColor, size: 10.w,),
                                                SizedBox(width: 2.w,),
                                                Expanded(child: Text("4.5 (550)".tr, style: fontUtils.xSmall(theme.textColor),)),
                                                Text("(110 Sold)".tr, style: fontUtils.xSmall(theme.redColor),)
                                              ],
                                            )
                                          ],
                                        ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
      );
    });
  }

}