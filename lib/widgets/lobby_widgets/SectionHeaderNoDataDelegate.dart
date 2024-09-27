
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ProductController.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';

class SectionHeaderNoDat extends SliverPersistentHeaderDelegate {
  final String title;
  final double height;
  final bool isLoading;
  FontUtils fontUtils = FontUtils();

  SectionHeaderNoDat(this.title, this.isLoading,[this.height = 50]);
var utils=Utils();
  var tabs = [
    {
      "name": "Fast Delivery",
      "icon": TablerIcons.truck_delivery
    },
    {
      "name": "Top Selling",
      "icon": TablerIcons.flame
    },
    {
      "name": "New Arrival",
      "icon": TablerIcons.playlist_add
    },
    {
      "name": "Discounted",
      "icon": TablerIcons.discount
    },
  ];
int selectedIndex = 0; 
  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return GetBuilder<ThemeController>(id: "0", builder: (theme) {
      return GetBuilder<ProductController>(
        id: "0",
        builder: (_productController) {
          return Container(height: 120.h,child:
          isLoading?SpinKitDancingSquare(color: theme.primaryColor,):
          utils.noDataAvailableWidget(theme,showLottile: false));
         
        }
      );
    });
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}