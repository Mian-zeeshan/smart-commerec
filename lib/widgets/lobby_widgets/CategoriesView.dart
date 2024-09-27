import 'package:flutter/cupertino.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  CategoriesViewState createState() => CategoriesViewState();
}

class CategoriesViewState extends State<CategoriesView> {
  FontUtils fontUtils = FontUtils();
  Utils utils = Utils();

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
    return GetBuilder<ThemeController>(id: "0", builder: (theme) {
      return SizedBox(
        width: Get.width,
        height: 50.h,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for(var i = 0; i < categories.length; i++)
                  Container(
                    width: 130.h,
                    height: 50.h,
                    margin: EdgeInsets.only(right: 12.w, left: i == 0 ? 12.w : 0),
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/banners/cat_bg.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8.w),
                        color: theme.cardColor,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 1.w,
                              blurRadius: 4.w,
                              color: theme.textColor.withOpacity(0.1)
                          )
                        ]
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      children: [
                        Container(
                          width: Get.width,
                          height: Get.height,
                          color: theme.blackColor.withOpacity(0.4),
                        ),
                        Container(
                          padding: EdgeInsets.all(4.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/products/${categories[i]["image"]}",),
                              SizedBox(width: 4.w,),
                              Expanded(child: Text("${categories[i]["name"]}".tr, textAlign: TextAlign.center, style: fontUtils.h6BoldItalic(theme.whiteColor),))
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
      );
    });
  }

}