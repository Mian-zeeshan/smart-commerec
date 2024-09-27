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
                                  "Terms Of Use".tr,
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
                            "Terms Of Use",
                            style: fontUtils.h6(theme.textColor),
                          ),
                          Text(
                            "We at Al-Mumtaz ensure our clients are Satisfied/Happy/Cheerful with our Services and Products. To accomplish this we need to follow a precise framework, comprising of smooth and trustworthy rules and regulations. Here we Represent/depict a portion of our user friendly/customer centered key agreements.",
                            style: fontUtils
                                .small(theme.textColor.withOpacity(0.7)),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Availability",
                            style: fontUtils.h6(theme.textColor),
                          ),
                          paragraphText(theme,
                              "Special Offer Items/Seasonal Sales Items availability is open to all our valued/esteemed customers but restricted for that specific period and also depends on the availability of such products/items."),
                          SizedBox(
                            height: 10.h,
                          ),
                        
                          paragraphHeadingText(
                              theme, "Cancellation"),
                          paragraphText(theme,
                              "Our valued customers have legitimate right to cancel/drop the product request but before the dispatch/delivery of the product. Standard charges may apply if an order is canceled/dropped after dispatch/delivery of product."),
                          SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(
                              theme, "Change in Prices"),
                          paragraphText(theme,
                              "Stay connected with us through our website and our other social media platforms for updated prices, discounts and packages on our products. Prices, discounts and packages are subject to change at any time without any prior notice."),
                          SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "Client Engagement"),
                          paragraphText(theme,
                              "We at Al-Mumtaz love to remain connected with our customers to respond to their questions and queries using different medium of exchanges oral, written or verbal. Any conversation or information related to prices, discounts and product packages shared through all these means can be changed without any prior notice."),
                          SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "Delivery"),
                          paragraphText(theme,
                              "We make an honest effort to deliver your requested product to your doorstep before as quickly as possible, however there can be certain factors beyond human control due to which delivery may be delayed like, storm, rain, road blockage, flood etc."),
                          SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "Incorrect Information"),
                          paragraphText(theme,
                              "Primary responsibility to provide correct information rests with the customers .We are not accountable for any inaccurate data given by the client or customer to benefit from our products or services"),
                          SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "Modification"),
                          paragraphText(theme,
                              "To provide updated products to our valued customers we (Al-Mumtaz) preserve the right to change prices, discounts, and offers at whatever time."),
                          SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "Right to Refuse"),
                          paragraphText(theme,
                              "Our offers, deals and packages are for one and all without any bias. We reserve the right to refuse our services at any time due to circumstances such as delay in payment, last time changes in order by the client, unavailability of product, distance etc."),
                         SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "Unauthorized Use"),
                          paragraphText(theme, "To guard our valued customers from pirated content by utilizing our services you consent not to share or reuse any of our services for any unauthorized purpose without prior approval."),
                         SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "Warranty"),
                          paragraphText(theme, "We provide genuine and authentic products to our customers containing original brand warranty with the products. All warranty claims shall be headed to Manufacturer’s warranty claim centers or customer service centers"),
                         SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "Promotional Activities"),
                          paragraphText(theme, "We are irresponsible for misunderstanding of information displayed on our social media banners and posts. Any special voucher is legitimate to be utilized just a single time, and numerous use by choosing different unapproved ways is unlawful."),
                       
                         SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "Brand Name"),
                          paragraphText(theme, "Brand names, logos, designs on our site may not be utilized/reused for any services that are not being given by us."),
                         SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "Typographical Errors"),
                          paragraphText(theme, "We reserve the right to correct any typographical errors caused by human error on our social media platforms or web without any earlier notice."),
                         SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "Clients Feedback"),
                          paragraphText(theme, "We reserve the right to use or produce customer’s feedback, comments, suggestions, reviews or recommendations anytime without prior approval that customers send through different platforms. We preserve the right to upgrade our terms and conditions at any time. It is customer’s responsibility to remain aware of such renewal in terms and conditions on our website."),
                       
                          SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "(By utilizing almumtaz.com.pk site you consent to the above mentioned terms and conditions).")
                        , SizedBox(
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
