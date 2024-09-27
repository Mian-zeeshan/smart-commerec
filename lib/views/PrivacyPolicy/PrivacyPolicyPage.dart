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

class Privacypolicypage extends StatefulWidget {
  const Privacypolicypage({super.key});

  @override
  State<Privacypolicypage> createState() => _PrivacypolicypageState();
}

class _PrivacypolicypageState extends State<Privacypolicypage> {
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
                                  "Privacy Policy".tr,
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
                            "Privacy Policy",
                            style: fontUtils.h6(theme.textColor),
                          ),
                          Text(
                            "This site is claimed and worked by Al-Mumtaz Group of Electronics (referred to as “Al-Mumtaz”, “we”, “us”, or “our” thus). We are focused on securing the protection of our user while they collaborate with our site.We may gather following data when you visit or utilize our site. Furthermore, we consequently get and record data on our worker logs from your program including your IP address, treat data and the page you mentioned.",
                            style: fontUtils
                                .small(theme.textColor.withOpacity(0.7)),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "1 – What is done with your Information?",
                            style: fontUtils.h6(theme.textColor),
                          ),
                          paragraphText(theme,
                              "At the point when you buy something from our store, as a feature of the purchasing and selling measure, we gather the individual data you give us like your name, address and email address.At the point when you peruse our store, we additionally naturally accept your PC’s web convention (IP) address to give us data that assists us with finding out about your program and working framework.Email promoting (if appropriate): With your consent, we may send you messages about our store, new items and different updates."),
                          SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "2 – Consent"),
                          paragraphHeadingText(
                              theme, "How would you get my consent?"),
                          paragraphText(theme,
                              "At the point when you give us individual data to finish an exchange, confirm your Visa, put in a request, mastermind a conveyance or return a buy, we suggest that you agree to our gathering it and utilizing it for that particular explanation as it were.In the event that we request your own data for an optional explanation, such as advertising, we will either ask you straightforwardly for your communicated assent, or give you a chance to say no."),
                          SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(
                              theme, "How would I Drawback my Consent?"),
                          paragraphText(theme,
                              "On the off chance that after you select in, you alter your perspective, you may pull out your agree for us to get in touch with you, for the proceeded with assortment, use or divulgence of your data, whenever, by reaching us at info@almumtaz.com.pk"),
                          SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "3 – Disclosure"),
                          paragraphText(theme,
                              "We may reveal your own data in the event that we are legally necessary to do as such or on the off chance that you disregard our Terms of Service."),
                          SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "4 – Payment"),
                          paragraphText(theme,
                              "On the off chance that you decide to pay through Visa, no information is put away on our workers. Your exchange data is straightforwardly shipped off the bank through encoded channel (SSL-Secure Socket Layer)All immediate installment entryways hold fast to the principles set by PCI-DSS as overseen by the PCI Security Standards Council, which is a joint exertion of brands like Visa, MasterCard, Jazz Cash and Easy paisa.PCI-DSS prerequisites help guarantee the protected treatment of charge card data by our store and its specialist organizations."),
                          SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "5 – Links"),
                          paragraphText(theme,
                              "At the point when you click on joins on our store, they may guide you away from our site. We are not answerable for the protection practices of different destinations and urge you to peruse their security explanations."),
                          SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "6 – Security"),
                          paragraphText(theme,
                              "To ensure your own data, we avoid potential risk and follow industry best practices to ensure it isn’t improperly lost, abused, got to, revealed, adjusted or obliterated.In the event that you give us your Visa data, the data is encoded utilizing secure attachment layer innovation (SSL) and put away with an AES-256 encryption. Albeit no technique for transmission over the Internet or electronic stockpiling is 100% secure, we follow all PCI-DSS necessities and execute extra commonly acknowledged industry principles."),
                          SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "7 – Cookies"),
                          paragraphText(theme,
                              "A treat is a little book document that is saved to, and, during ensuing visits, recovered from your PC or cell phone. almumtaz.com.pkWe utilizes treats to improve and work on your visit. We don’t utilize treats to store individual data or to unveil data to outsiders.There are two sorts of treats: perpetual and brief (meeting treats). Perpetual treats are put away as a document on your PC or cell phone for no longer than a year. Meeting treats are put away briefly and vanish when you close your program meeting.We utilize lasting treats to store your decision of start page and to store your subtleties. We use meeting treats when you utilize the item filtration work and to check in the event that you are signed in. You can undoubtedly eradicate treats from your PC or cell phone utilizing your program.We utilize outsider treats to gather insights in total structure in examination devices like Google Analytics and Core Metrics. The treats utilized are both lasting and impermanent treats (meeting treats). The lasting treats are put away on your PC or cell phone for no longer than two years."),
                         SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "8 – Age Of Consent"),
                          paragraphText(theme, "By utilizing this site, you address that you are in any event the time of greater part in your state or area of home, or that you are the period of lion’s share in your state or territory of home and you have given us your agree to permit any of your minor wards to utilize this site."),
                         SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "9 – Changes To This Privacy Policy"),
                          paragraphText(theme, "We maintain all authority to adjust this protection strategy whenever, so if it’s not too much trouble, survey it habitually. Changes and explanations will produce results quickly upon their posting on the site. In the event that we roll out material improvements to this approach, we will tell you here that it has been refreshed, so you know about what data we gather, how we use it, and under what conditions, assuming any, we use as well as reveal it.In the event that our store is gained or converged with another organization, your data might be moved to the new proprietors so we may keep on offering items to you."),
                         SizedBox(
                            height: 10.h,
                          ),
                          paragraphHeadingText(theme, "Question & Contact Information"),
                          paragraphText(theme, "In the event that you might want to: access, right, correct or erase any close to home data we have about you, register an objection, or just need more data contact our Privacy Compliance Officer at info@almumtaz.com.pk"),
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
