import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ProductController.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';
import 'package:smart_commerce/widgets/lobby_widgets/ProductsGridView.dart';
import 'package:smart_commerce/widgets/products_page/FiltersBottomSheet.dart';
import 'package:smart_commerce/widgets/products_page/SectionProductsDeligate.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  ProductsPageState createState() => ProductsPageState();
}

class ProductsPageState extends State<ProductsPage> {
  Utils utils = Utils();
  FontUtils fontUtils = FontUtils();

  var categories = [
    {
      "name": "Washing Machine",
      "image": "washing_machine.png"
    },
    {
      "name": "Refrigerator",
      "image": "refrigerator.png"
    },
    {
      "name": "Microwave Oven",
      "image": "oven.png"
    },
    {
      "name": "Inverter AC",
      "image": "ac.png"
    },
    {
      "name": "Air Cooler",
      "image": "cooler.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(id: "0",builder: (theme) {
      return GetBuilder<ProductController>(
        id: "0",
        builder: (_products) {
          return Scaffold(
            body: SizedBox(
              width: Get.width,
              height: Get.height,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 110.h,
                    floating: true,
                    elevation: 20.h,
                    leading: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(TablerIcons.arrow_left, color: theme.redColor,)
                    ),
                    titleSpacing: 0,
                    surfaceTintColor: theme.primaryColor,
                    pinned: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: Get.width,
                            padding: EdgeInsets.only(left: 6.w, right: 12.w, top: 6.h, bottom: 6.h),
                            decoration: BoxDecoration(
                                color: theme.cardColor,
                                borderRadius: BorderRadius.circular(6.w),
                                boxShadow: [
                                  BoxShadow(
                                      color: theme.primaryColor.withOpacity(0.1),
                                      blurRadius: 2,
                                      spreadRadius: 4
                                  )
                                ]
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  TablerIcons.search,
                                  size: 16.w,
                                  color: theme.textColor.withOpacity(0.5),
                                ),
                                SizedBox(width: 6.w,),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    style: fontUtils.label(theme.textColor),
                                    decoration: InputDecoration.collapsed(hintText: "Search...".tr),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    actions: [
                      IconButton(
                          onPressed: (){
                            Get.back();
                          },
                          icon: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(TablerIcons.shopping_cart, color: theme.whiteColor, size: 22.w),
                              Text("Cart".tr, style: fontUtils.xSmall(theme.whiteColor),)
                            ],
                          )
                      ),
                      IconButton(
                          onPressed: (){
                            Get.bottomSheet(const FiltersBottomSheet(), isScrollControlled: true);
                          },
                          icon: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(TablerIcons.adjustments_horizontal, color: theme.whiteColor, size: 22.w),
                              Text("Filters".tr, style: fontUtils.xSmall(theme.whiteColor),)
                            ],
                          )
                      ),
                    ],
                    backgroundColor: theme.primaryColor,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      titlePadding: EdgeInsets.zero,
                      background: Container(
                        width: Get.width,
                        height: 80.h,
                        decoration: BoxDecoration(
                            color: theme.primaryColor,
                            image: const DecorationImage(
                                image: AssetImage("assets/images/banners/bg_products.png"),
                                fit: BoxFit.cover
                            )
                        ),
                        child: Container(
                          color: theme.primaryColor.withOpacity(0.8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: Get.width,
                                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        for(var i = 0; i < categories.length; i++)
                                          Container(
                                          width: 70.w,
                                          height: 50.h,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.w),
                                              border: Border.all(color: theme.whiteColor.withOpacity(1), width: 2)
                                          ),
                                          margin: EdgeInsets.only(right: 8.w),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(TablerIcons.clothes_rack, size: 20.w, color: theme.whiteColor.withOpacity(1),),
                                              Text("${categories[i]["name"]}".tr, style: fontUtils.boldSmall(theme.whiteColor.withOpacity(1)), maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,)
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
                        ),
                      ),
                    ),
                 
                 
                  ),
                  SliverPersistentHeader(
                    delegate: SectionProductsDelegate("Section B", 35.h),
                    pinned: true,
                  ),
                 
                 
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: Get.width * 0.55,
                      mainAxisExtent: 230.h,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1/2,
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return ProductsGridView(index: index,item: _products.productsList[index],);
                      },
                      childCount: _products.productsList.length,
                    ),
                  )
                ],
              ),
            ),
          );
        }
      );
    });
  }

}