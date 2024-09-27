import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';
import 'package:smart_commerce/widgets/order_widgets/OrderWidget.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});
  @override
  OrdersPageState createState() => OrdersPageState();
}

class OrdersPageState extends State<OrdersPage> with SingleTickerProviderStateMixin {
  FontUtils fontUtils = FontUtils();
  Utils utils = Utils();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(id: "0",builder: (theme) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            backgroundColor: theme.primaryColor,
          ),
        ),
        body: SafeArea(
          child: Container(
            width: Get.width,
            height: Get.height,
            color: theme.backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  decoration: BoxDecoration(
                      color: theme.primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: theme.primaryColor.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 12
                        )
                      ]
                  ),
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
                          Icon(TablerIcons.arrow_left, size: 18.w, color: theme.whiteColor,),
                          SizedBox(width: 12.w,),
                          Text("Orders".tr, style: fontUtils.h6Bold(theme.whiteColor),)
                        ],
                      )),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: (){},
                          icon:Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(TablerIcons.headset, size: 12.w, color: theme.whiteColor,),
                              SizedBox(width: 6.w,),
                              Text("Contact Support".tr, style: fontUtils.boldLabel(theme.whiteColor),),
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    boxShadow: [
                      BoxShadow(
                        color: theme.textColor.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 12
                      )
                    ]
                  ),
                  child: TabBar(
                    controller: _tabController,
                    tabAlignment: TabAlignment.start,
                    tabs: const [
                      Tab(icon: Icon(TablerIcons.truck), text: "All (109)"),
                      Tab(icon: Icon(TablerIcons.truck_loading), text: "Pending (0)"),
                      Tab(icon: Icon(TablerIcons.truck_return), text: "Processing (2)"),
                      Tab(icon: Icon(TablerIcons.truck_delivery), text: "Shipping (5)"),
                      Tab(icon: Icon(TablerIcons.package), text: "Received (98)"),
                    ],
                    dividerColor: theme.transparentColor,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      border: Border.all(color: theme.buttonColor)
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: theme.buttonColor,
                    unselectedLabelColor: theme.textColor.withOpacity(0.5),
                    isScrollable: true,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 10.h,),
                            for(var i = 0; i < 3; i++)
                              const OrdersWidget()
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 10.h,),
                            for(var i = 0; i < 3; i++)
                              const OrdersWidget()
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 10.h,),
                            for(var i = 0; i < 3; i++)
                              const OrdersWidget()
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 10.h,),
                            for(var i = 0; i < 3; i++)
                              const OrdersWidget()
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 10.h,),
                            for(var i = 0; i < 3; i++)
                              const OrdersWidget()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

}