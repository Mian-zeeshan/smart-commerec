import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';

class TermConditionPage extends StatefulWidget {
  const TermConditionPage({super.key});

  @override
  State<TermConditionPage> createState() => _TermConditionPageState();
}

class _TermConditionPageState extends State<TermConditionPage> {
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
            backgroundColor: theme.backgroundColor,
            body: SafeArea(
                child: Container(
              width: Get.width,
              height: Get.height,
              color: theme.backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    decoration:
                        BoxDecoration(color: theme.primaryColor, boxShadow: [
                      BoxShadow(
                          color: theme.primaryColor.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 12)
                    ]),
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
                                Icon(
                                  TablerIcons.arrow_left,
                                  size: 18.w,
                                  color: theme.whiteColor,
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Text(
                                  "About Us".tr,
                                  style: fontUtils.h5(theme.whiteColor),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About Us",
                            style: fontUtils.h6(theme.textColor),
                          ),
                          Text(
                            "Al-Mumtaz Group of Electronics is the one of the best home appliances store in Pakistan who started its journey back in 1981. The company has hands on experience when it comes to dealing in home appliances and consumer electronics of all leading brands, with competitive prices, biggest variety and excellent customer service. We have both brick-and-mortar stores and online platform to provide ease to the customers. We have been regularly introducing brands like Haier, Gree, Dawlance, TCL who are market leaders today.",
                            style: fontUtils
                                .small(theme.textColor.withOpacity(0.7)),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Best Quality",
                            style: fontUtils.h6(theme.textColor),
                          ),
                          paragraphText(theme,
                              "Despite offering a wide range of home appliances all over Pakistan, we never compromise on quality.  Whether you are buying local or imported products, we ensure that our product range complies with international safety and quality standards."),
                          SizedBox(
                            height: 10.h,
                          ),
                        
                          paragraphHeadingText(
                              theme, "Fastest Delivery"),
                          paragraphText(theme,
                              "Do you want to buy a product of your choice and have it delivered as quickly as possible? Lahore Centre strives to deliver all home appliances in the shortest time possible."),
                          SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(
                              theme, "Sales & Offers"),
                          paragraphText(theme,
                              "Stay connected with us through our website and our other social media platforms for updated prices, discounts and packages on our products. Prices, discounts and packages are subject to change at any time without any prior notice."),
                          SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "Here at Al-Mumtaz we offer some hot sales and exciting exclusive offers to provide our worthy clients and customers a best level of comfort. Our sales for example December sale mela , Summer Sale ,Winter sale , End of the season sale , occasional sales and many more brings opportunities to get the same qualitied branded products at best prices. We also offer lucky draws for engagement of our esteemed customers. Through these lucky draws we provide our customers with wonderful surprises. So always stay tuned and get in touch always with Al-Mumtaz for Exciting offers."),
                        
                     SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                  )),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            )),
          );
        });
  }

  Widget paragraphText(theme, text) {
    return Text(text, style: fontUtils.small(theme.textColor.withOpacity(0.7)));
  }

  Widget paragraphHeadingText(theme, text) {
    return Text(text, style: fontUtils.h6(theme.textColor));
  }
}
