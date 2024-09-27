import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ProductController.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';
import 'package:smart_commerce/models/GetProductsModel.dart';
import 'package:html/parser.dart';

import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:smart_commerce/models/OrderModel.dart';
import 'package:smart_commerce/pages/CheckOut_Page/CheckOutPage.dart';

class ProductDetails extends StatefulWidget {
  final GetProductsModel item;
  const ProductDetails({super.key, required this.item});

  @override
  ProductDetailsState createState() => ProductDetailsState();
}

class ProductDetailsState extends State<ProductDetails> {
  Utils utils = Utils();
  FontUtils fontUtils = FontUtils();
  CarouselController carouselController = CarouselController();
  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
  var productsw = [
    {"name": "Hier 20 KG Washing Machine", "image": "product_4.jpg"},
    {"name": "Dawlence Dual Door Refrigerator", "image": "product_3.jpg"},
    {"name": "Super Asia Microwave Oven", "image": "product_2.jpg"},
    {"name": "Hier Inverter AC 1.0 TON", "image": "ac.png"},
    {"name": "Super Asia 16900WU Air Cooler", "image": "cooler.png"}
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      id: "0",
      builder: (theme) {
        return GetBuilder<ProductController>(
            id: "0",
            builder: (product) {
              return Scaffold(
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: AppBar(
                    backgroundColor: theme.primaryColor,
                  ),
                ),
                body: SafeArea(
                  child: SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          decoration:
                              BoxDecoration(color: theme.cardColor, boxShadow: [
                            BoxShadow(
                                color: theme.textColor.withOpacity(0.1),
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
                                  icon: Icon(
                                    TablerIcons.arrow_left,
                                    color: theme.textColor,
                                  )),
                              Expanded(
                                  child: Text(
                                    "${widget.item.name}"
                                // "Audionic Headset U89009R (Wireless + Chargeable)"
                                    .tr,
                                style:
                                    fontUtils.boldDescription(theme.textColor),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )),
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    TablerIcons.shopping_cart,
                                    color: theme.textColor,
                                  )),
                            ],
                          ),
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                    //         if( widget.item.images!.isNotEmpty) 
                    //          SizedBox(
                    //             width: Get.width,
                    //             height: 180.h,
                    //             child: FlutterCarousel(
                    //               options: CarouselOptions(
                    //                 controller: carouselController,
                    //                 onPageChanged: (page, reason) {},
                    //                 autoPlay: true,
                    //                 autoPlayAnimationDuration:
                    //                     const Duration(seconds: 1),
                    //                 autoPlayInterval:
                    //                     const Duration(seconds: 10),
                    //                 viewportFraction: 16 / 9,
                    //                 height: Get.height,
                    //                 showIndicator: true,
                    //                 slideIndicator: CircularSlideIndicator(
                    //                     slideIndicatorOptions:
                    //                         SlideIndicatorOptions(
                    //                             indicatorBackgroundColor: theme
                    //                                 .primaryColor
                    //                                 .withOpacity(0.5),
                    //                             currentIndicatorColor:
                    //                                 theme.primaryColor)),
                    //               ),
                    //               items: widget.item.images!.map((i) {
                    //                 return Builder(
                    //                   builder: (BuildContext context) {
                    //                     return AspectRatio(
                    //                       aspectRatio: 16 / 9,
                    //                       child: InkWell(
                    //                         onTap: () {
                    //                           // MultiImageProvider
                    //                           //     multiImageProvider =
                    //                           //     MultiImageProvider([
                    //                           //   const AssetImage(
                    //                           //       "assets/images/products/product_1.jpg"),
                    //                           //   const AssetImage(
                    //                           //       "assets/images/products/product_2.jpg"),
                    //                           //   const AssetImage(
                    //                           //       "assets/images/products/product_3.jpg"),
                    //                           //   const AssetImage(
                    //                           //       "assets/images/products/product_4.jpg"),
                    //                           // ]);

                    //                           // showImageViewerPager(
                    //                           //     context, multiImageProvider,
                    //                           //     onPageChanged: (page) {},
                    //                           //     onViewerDismissed: (page) {});
                    //                         },
                    //                         child: Container(
                    //                             width: Get.width,
                    //                             height: Get.height,
                    //                             decoration: BoxDecoration(
                    //                                 color: theme.cardColor),
                    //                             foregroundDecoration:
                    //                                 BoxDecoration(
                    //                                     color: theme
                    //                                         .primaryColor
                    //                                         .withOpacity(0.1)),
                    //                             child: 
                    //                             CachedNetworkImage(
                    //   imageUrl:i.src??"",
                    //   fit: BoxFit.contain,
                    //   placeholder: (_, __) => SpinKitDancingSquare(
                    //     color: theme.primaryColor,
                    //   ),
                    //   errorWidget: (_, __, ___) =>
                    //       Image.asset("assets/images/place_holder.jpg"),
                    // ),
                                                
                    //                             // Image.asset(
                    //                             //   "assets/images/products/$i",
                    //                             //   fit: BoxFit.cover,
                    //                             // )
                                                
                    //                             ),
                    //                       ),
                    //                     );
                    //                   },
                    //                 );
                    //               }).toList(),
                    //             ),
                    //           ),
                            
                              SizedBox(
                                height: 6.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Expanded(
                                      child: Text(
                                   "${widget.item.name}"
                                        .tr,
                                    style:
                                        fontUtils.description(theme.textColor),
                                  )),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        TablerIcons.star_filled,
                                        color: theme.yellowColor,
                                        size: 14.w,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        "${widget.item.averageRating} (${widget.item.ratingCount})".tr,
                                        style: fontUtils.label(theme.textColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Expanded(
                                      child:        HtmlWidget(
                     "${_parseHtmlString(widget.item.shortDescription??"")}",
                         
                      // shrinkWrap: false,
                      // style: {
                      // "body": Style(
                      // fontSize: FontSize(12.0),
                      // fontWeight: FontWeight.normal,
                      //   color: themeController.textColor
                      // )},
                      textStyle: fontUtils.small(
                          theme.blackColor.withOpacity(0.7)),
                    )
                                  
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                ],
                              ),
                              // SizedBox(
                              //   height: 6.h,
                              // ),
                              // Container(
                              //   width: Get.width,
                              //   margin: EdgeInsets.symmetric(horizontal: 6.w),
                              //   padding: EdgeInsets.symmetric(
                              //       horizontal: 12.w, vertical: 6.h),
                              //   decoration: BoxDecoration(
                              //       boxShadow: [
                              //         BoxShadow(
                              //             color:
                              //                 theme.textColor.withOpacity(0.1),
                              //             spreadRadius: 2,
                              //             blurRadius: 12),
                              //       ],
                              //       borderRadius: BorderRadius.circular(8.w),
                              //       color: theme.cardColor),
                              //   child: Column(
                              //     mainAxisAlignment: MainAxisAlignment.start,
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       Text(
                              //         "Colors".tr,
                              //         style: fontUtils
                              //             .boldDescription(theme.textColor),
                              //       ),
                              //       SizedBox(
                              //         height: 6.h,
                              //       ),
                              //       Wrap(
                              //         alignment: WrapAlignment.start,
                              //         crossAxisAlignment:
                              //             WrapCrossAlignment.center,
                              //         children: [
                              //           for (var i = 0; i < 4; i++)
                              //             Container(
                              //               width: 30.w,
                              //               height: 30.w,
                              //               padding: EdgeInsets.all(1.w),
                              //               margin: EdgeInsets.only(
                              //                   right: 6.w, bottom: 6.h),
                              //               decoration: BoxDecoration(
                              //                   borderRadius:
                              //                       BorderRadius.circular(8.w),
                              //                   border: Border.all(
                              //                       color: i == 0
                              //                           ? theme.primaryColor
                              //                           : theme
                              //                               .transparentColor)),
                              //               child: Container(
                              //                 width: 30.w,
                              //                 height: 30.w,
                              //                 decoration: BoxDecoration(
                              //                     color: i == 0
                              //                         ? theme.redColor
                              //                         : i == 1
                              //                             ? theme.brownColor
                              //                             : i == 2
                              //                                 ? theme.blueColor
                              //                                 : theme
                              //                                     .yellowColor,
                              //                     borderRadius:
                              //                         BorderRadius.circular(
                              //                             6.w)),
                              //               ),
                              //             )
                              //         ],
                              //       ),
                              //       SizedBox(
                              //         height: 6.h,
                              //       ),
                              //       Text(
                              //         "Sizes".tr,
                              //         style: fontUtils
                              //             .boldDescription(theme.textColor),
                              //       ),
                              //       SizedBox(
                              //         height: 6.h,
                              //       ),
                              //       Wrap(
                              //         alignment: WrapAlignment.start,
                              //         crossAxisAlignment:
                              //             WrapCrossAlignment.center,
                              //         children: [
                              //           Container(
                              //             padding: EdgeInsets.symmetric(
                              //                 vertical: 1.w, horizontal: 8.w),
                              //             margin: EdgeInsets.only(
                              //                 right: 6.w, bottom: 6.h),
                              //             decoration: BoxDecoration(
                              //                 borderRadius:
                              //                     BorderRadius.circular(4.w),
                              //                 border: Border.all(
                              //                     color: theme.primaryColor)),
                              //             child: Text(
                              //               "Extra Large".tr,
                              //               style: fontUtils
                              //                   .label(theme.buttonColor),
                              //             ),
                              //           ),
                              //           Container(
                              //             padding: EdgeInsets.symmetric(
                              //                 vertical: 1.w, horizontal: 8.w),
                              //             margin: EdgeInsets.only(
                              //                 right: 6.w, bottom: 6.h),
                              //             decoration: BoxDecoration(
                              //                 borderRadius:
                              //                     BorderRadius.circular(4.w),
                              //                 border: Border.all(
                              //                     color: theme.primaryColor)),
                              //             child: Text(
                              //               "Large".tr,
                              //               style: fontUtils
                              //                   .label(theme.buttonColor),
                              //             ),
                              //           ),
                              //           Container(
                              //             padding: EdgeInsets.symmetric(
                              //                 vertical: 1.w, horizontal: 8.w),
                              //             margin: EdgeInsets.only(
                              //                 right: 6.w, bottom: 6.h),
                              //             decoration: BoxDecoration(
                              //                 borderRadius:
                              //                     BorderRadius.circular(4.w),
                              //                 border: Border.all(
                              //                     color: theme.primaryColor)),
                              //             child: Text(
                              //               "Small".tr,
                              //               style: fontUtils
                              //                   .label(theme.buttonColor),
                              //             ),
                              //           ),
                              //           Container(
                              //             padding: EdgeInsets.symmetric(
                              //                 vertical: 1.w, horizontal: 8.w),
                              //             margin: EdgeInsets.only(
                              //                 right: 6.w, bottom: 6.h),
                              //             decoration: BoxDecoration(
                              //                 borderRadius:
                              //                     BorderRadius.circular(4.w),
                              //                 border: Border.all(
                              //                     color: theme.primaryColor)),
                              //             child: Text(
                              //               "Extra Small".tr,
                              //               style: fontUtils
                              //                   .label(theme.buttonColor),
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //       SizedBox(
                              //         height: 6.h,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                             
                              SizedBox(height: 6.h),
                              Container(
                                  width: Get.width,
                                  margin: EdgeInsets.symmetric(horizontal: 6.w),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.w, vertical: 6.h),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: theme.textColor
                                                .withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 12),
                                      ],
                                      borderRadius: BorderRadius.circular(8.w),
                                      color: theme.cardColor),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Description".tr,
                                          style: fontUtils
                                              .boldDescription(theme.textColor),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),

                                         HtmlWidget(
                     "${_parseHtmlString(widget.item.description??"")}",
                         
                      // shrinkWrap: false,
                      // style: {
                      // "body": Style(
                      // fontSize: FontSize(12.0),
                      // fontWeight: FontWeight.normal,
                      //   color: themeController.textColor
                      // )},
                      textStyle: fontUtils.small(
                          theme.blackColor.withOpacity(0.7)),
                    )
                                        // Text(
                                        //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                                        //       .tr,
                                        //   style: fontUtils.small(
                                        //       theme.textColor.withOpacity(0.8)),
                                        // ),
                                      ])),
                              SizedBox(height: 6.h),
                              // Container(
                              //     width: Get.width,
                              //     margin: EdgeInsets.symmetric(horizontal: 6.w),
                              //     padding: EdgeInsets.symmetric(
                              //         horizontal: 12.w, vertical: 6.h),
                              //     decoration: BoxDecoration(
                              //         boxShadow: [
                              //           BoxShadow(
                              //               color: theme.textColor
                              //                   .withOpacity(0.1),
                              //               spreadRadius: 2,
                              //               blurRadius: 12),
                              //         ],
                              //         borderRadius: BorderRadius.circular(8.w),
                              //         color: theme.cardColor),
                              //     child: Column(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.start,
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.start,
                              //         children: [
                              //           Text(
                              //             "Rating & Reviews".tr,
                              //             style: fontUtils
                              //                 .boldDescription(theme.textColor),
                              //           ),
                              //           SizedBox(
                              //             height: 3.h,
                              //           ),
                              //           Text(
                              //             "See what people tell us about this product"
                              //                 .tr,
                              //             style: fontUtils.small(
                              //                 theme.textColor.withOpacity(0.8)),
                              //           ),
                              //           SizedBox(
                              //             height: 6.h,
                              //           ),
                              //           for (var i = 0; i < 3; i++)
                              //             Column(
                              //               mainAxisAlignment:
                              //                   MainAxisAlignment.start,
                              //               crossAxisAlignment:
                              //                   CrossAxisAlignment.center,
                              //               children: [
                              //                 SizedBox(
                              //                   width: Get.width,
                              //                   child: Row(
                              //                     mainAxisAlignment:
                              //                         MainAxisAlignment.start,
                              //                     crossAxisAlignment:
                              //                         CrossAxisAlignment.start,
                              //                     children: [
                              //                       Container(
                              //                         width: 40.h,
                              //                         height: 40.h,
                              //                         decoration: BoxDecoration(
                              //                             borderRadius:
                              //                                 BorderRadius
                              //                                     .circular(
                              //                                         6.w),
                              //                             color:
                              //                                 theme.cardColor,
                              //                             boxShadow: [
                              //                               BoxShadow(
                              //                                   color: theme
                              //                                       .textColor
                              //                                       .withOpacity(
                              //                                           0.1),
                              //                                   spreadRadius: 1,
                              //                                   blurRadius: 12)
                              //                             ]),
                              //                         clipBehavior: Clip
                              //                             .antiAliasWithSaveLayer,
                              //                         child: Image.asset(
                              //                           "assets/images/avatars/1.png",
                              //                           fit: BoxFit.cover,
                              //                         ),
                              //                       ),
                              //                       SizedBox(
                              //                         width: 5.w,
                              //                       ),
                              //                       Expanded(
                              //                           child: Column(
                              //                         mainAxisAlignment:
                              //                             MainAxisAlignment
                              //                                 .start,
                              //                         crossAxisAlignment:
                              //                             CrossAxisAlignment
                              //                                 .start,
                              //                         children: [
                              //                           Row(
                              //                             mainAxisAlignment:
                              //                                 MainAxisAlignment
                              //                                     .start,
                              //                             crossAxisAlignment:
                              //                                 CrossAxisAlignment
                              //                                     .center,
                              //                             children: [
                              //                               Text(
                              //                                 "Alex Whales".tr,
                              //                                 style: fontUtils
                              //                                     .boldLabel(theme
                              //                                         .textColor
                              //                                         .withOpacity(
                              //                                             0.8)),
                              //                               ),
                              //                               SizedBox(
                              //                                 width: 8.w,
                              //                               ),
                              //                               Icon(
                              //                                 TablerIcons
                              //                                     .star_filled,
                              //                                 color: theme
                              //                                     .yellowColor,
                              //                                 size: 10.w,
                              //                               ),
                              //                               SizedBox(
                              //                                 width: 2.w,
                              //                               ),
                              //                               Expanded(
                              //                                   child: Text(
                              //                                 "4.5".tr,
                              //                                 style: fontUtils
                              //                                     .xSmall(theme
                              //                                         .textColor),
                              //                               )),
                              //                               Text(
                              //                                 "a week ago".tr,
                              //                                 style: fontUtils
                              //                                     .xSmall(theme
                              //                                         .textColor
                              //                                         .withOpacity(
                              //                                             0.5)),
                              //                               ),
                              //                             ],
                              //                           ),
                              //                           SizedBox(
                              //                             height: 6.h,
                              //                           ),
                              //                           Text(
                              //                             "I ordered this headset. The delivery time was okay. and product is also very good. Overall its Good ❤️."
                              //                                 .tr,
                              //                             style: fontUtils
                              //                                 .small(theme
                              //                                     .textColor
                              //                                     .withOpacity(
                              //                                         0.8)),
                              //                           ),
                              //                         ],
                              //                       )),
                              //                       SizedBox(
                              //                         width: 5.w,
                              //                       ),
                              //                     ],
                              //                   ),
                              //                 ),
                              //                 Container(
                              //                   width: Get.width,
                              //                   height: 1,
                              //                   margin: EdgeInsets.symmetric(
                              //                       vertical: 4.h),
                              //                   color: theme.textColor
                              //                       .withOpacity(0.1),
                              //                 ),
                              //               ],
                              //             ),
                              //           Row(
                              //             mainAxisAlignment:
                              //                 MainAxisAlignment.center,
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.center,
                              //             children: [
                              //               TextButton(
                              //                   isSemanticButton: true,
                              //                   onPressed: () {},
                              //                   child: Text(
                              //                     "View All".tr,
                              //                     style: fontUtils
                              //                         .label(theme.blueColor),
                              //                   ))
                              //             ],
                              //           )
                              //         ])),
                              // SizedBox(height: 6.h),
                            
                            
                              Container(
                                  width: Get.width,
                                  margin: EdgeInsets.symmetric(horizontal: 6.w),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.w, vertical: 6.h),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: theme.textColor
                                                .withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 12),
                                      ],
                                      borderRadius: BorderRadius.circular(8.w),
                                      color: theme.cardColor),
                                  child: GetBuilder<ProductController>(
                                    id: "0",
                                    builder: (_prd) {
                                      return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Key Features".tr,
                                              style: fontUtils
                                                  .boldDescription(theme.textColor),
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                      
                                      for(int i =0;i<widget.item.attributes!.length;i++)
                                            Column(
                                              children: [
                                                IntrinsicHeight(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                        "${widget.item.attributes![i].name}".tr,
                                                        style: fontUtils
                                                            .label(theme.textColor),
                                                      )),
                                                      Container(
                                                        width: 1,
                                                        color: theme.textColor
                                                            .withOpacity(0.1),
                                                        margin: EdgeInsets.symmetric(
                                                            horizontal: 12.w),
                                                      ),
                                                      Expanded(
                                                          child: Text(
                                                       "${widget.item.attributes![i].options!.first}".tr,
                                                        style: fontUtils
                                                            .label(theme.textColor),
                                                      )),
                                                    ],
                                                  ),
                                                ),
                                              Container(
                                              width: Get.width,
                                              height: 1,
                                              color:
                                                  theme.textColor.withOpacity(0.1),
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 6.h),
                                            ),
                                           
                                              ],
                                            ),
                                          
                                            // IntrinsicHeight(
                                            //   child: Row(
                                            //     mainAxisAlignment:
                                            //         MainAxisAlignment.start,
                                            //     crossAxisAlignment:
                                            //         CrossAxisAlignment.center,
                                            //     children: [
                                            //       Expanded(
                                            //           child: Text(
                                            //         "Frequency".tr,
                                            //         style: fontUtils
                                            //             .label(theme.textColor),
                                            //       )),
                                            //       Container(
                                            //         width: 1,
                                            //         color: theme.textColor
                                            //             .withOpacity(0.1),
                                            //         margin: EdgeInsets.symmetric(
                                            //             horizontal: 12.w),
                                            //       ),
                                            //       Expanded(
                                            //           child: Text(
                                            //         "2.4 GHz".tr,
                                            //         style: fontUtils
                                            //             .label(theme.textColor),
                                            //       )),
                                            //     ],
                                            //   ),
                                            // ),
                                            // Container(
                                            //   width: Get.width,
                                            //   height: 1,
                                            //   color:
                                            //       theme.textColor.withOpacity(0.1),
                                            //   margin: EdgeInsets.symmetric(
                                            //       vertical: 6.h),
                                            // ),
                                            // IntrinsicHeight(
                                            //   child: Row(
                                            //     mainAxisAlignment:
                                            //         MainAxisAlignment.start,
                                            //     crossAxisAlignment:
                                            //         CrossAxisAlignment.center,
                                            //     children: [
                                            //       Expanded(
                                            //           child: Text(
                                            //         "Wireless".tr,
                                            //         style: fontUtils
                                            //             .label(theme.textColor),
                                            //       )),
                                            //       Container(
                                            //         width: 1,
                                            //         color: theme.textColor
                                            //             .withOpacity(0.1),
                                            //         margin: EdgeInsets.symmetric(
                                            //             horizontal: 12.w),
                                            //       ),
                                            //       Expanded(
                                            //           child: Text(
                                            //         "Yes".tr,
                                            //         style: fontUtils
                                            //             .label(theme.textColor),
                                            //       )),
                                            //     ],
                                            //   ),
                                            // ),
                                            // Container(
                                            //   width: Get.width,
                                            //   height: 1,
                                            //   color:
                                            //       theme.textColor.withOpacity(0.1),
                                            //   margin: EdgeInsets.symmetric(
                                            //       vertical: 6.h),
                                            // ),
                                            // IntrinsicHeight(
                                            //   child: Row(
                                            //     mainAxisAlignment:
                                            //         MainAxisAlignment.start,
                                            //     crossAxisAlignment:
                                            //         CrossAxisAlignment.center,
                                            //     children: [
                                            //       Expanded(
                                            //           child: Text(
                                            //         "Range".tr,
                                            //         style: fontUtils
                                            //             .label(theme.textColor),
                                            //       )),
                                            //       Container(
                                            //         width: 1,
                                            //         color: theme.textColor
                                            //             .withOpacity(0.1),
                                            //         margin: EdgeInsets.symmetric(
                                            //             horizontal: 12.w),
                                            //       ),
                                            //       Expanded(
                                            //           child: Text(
                                            //         "50-80 meters".tr,
                                            //         style: fontUtils
                                            //             .label(theme.textColor),
                                            //       )),
                                            //     ],
                                            //   ),
                                            // ),
                                            // Container(
                                            //   width: Get.width,
                                            //   height: 1,
                                            //   color:
                                            //       theme.textColor.withOpacity(0.1),
                                            //   margin: EdgeInsets.symmetric(
                                            //       vertical: 6.h),
                                            // ),
                                            // IntrinsicHeight(
                                            //   child: Row(
                                            //     mainAxisAlignment:
                                            //         MainAxisAlignment.start,
                                            //     crossAxisAlignment:
                                            //         CrossAxisAlignment.center,
                                            //     children: [
                                            //       Expanded(
                                            //           child: Text(
                                            //         "Water Pack".tr,
                                            //         style: fontUtils
                                            //             .label(theme.textColor),
                                            //       )),
                                            //       Container(
                                            //         width: 1,
                                            //         color: theme.textColor
                                            //             .withOpacity(0.1),
                                            //         margin: EdgeInsets.symmetric(
                                            //             horizontal: 12.w),
                                            //       ),
                                            //       Expanded(
                                            //           child: Text(
                                            //         "No".tr,
                                            //         style: fontUtils
                                            //             .label(theme.textColor),
                                            //       )),
                                            //     ],
                                            //   ),
                                            // ),
                                            // Container(
                                            //   width: Get.width,
                                            //   height: 1,
                                            //   color:
                                            //       theme.textColor.withOpacity(0.1),
                                            //   margin: EdgeInsets.symmetric(
                                            //       vertical: 6.h),
                                            // ),
                                            // IntrinsicHeight(
                                            //   child: Row(
                                            //     mainAxisAlignment:
                                            //         MainAxisAlignment.start,
                                            //     crossAxisAlignment:
                                            //         CrossAxisAlignment.center,
                                            //     children: [
                                            //       Expanded(
                                            //           child: Text(
                                            //         "Size".tr,
                                            //         style: fontUtils
                                            //             .label(theme.textColor),
                                            //       )),
                                            //       Container(
                                            //         width: 1,
                                            //         color: theme.textColor
                                            //             .withOpacity(0.1),
                                            //         margin: EdgeInsets.symmetric(
                                            //             horizontal: 12.w),
                                            //       ),
                                            //       Expanded(
                                            //           child: Text(
                                            //         "12 x 16 inches".tr,
                                            //         style: fontUtils
                                            //             .label(theme.textColor),
                                            //       )),
                                            //     ],
                                            //   ),
                                            // ),
                                            // Container(
                                            //   width: Get.width,
                                            //   height: 1,
                                            //   color:
                                            //       theme.textColor.withOpacity(0.1),
                                            //   margin: EdgeInsets.symmetric(
                                            //       vertical: 6.h),
                                            // ),
                                            // IntrinsicHeight(
                                            //   child: Row(
                                            //     mainAxisAlignment:
                                            //         MainAxisAlignment.start,
                                            //     crossAxisAlignment:
                                            //         CrossAxisAlignment.center,
                                            //     children: [
                                            //       Expanded(
                                            //           child: Text(
                                            //         "Foldable".tr,
                                            //         style: fontUtils
                                            //             .label(theme.textColor),
                                            //       )),
                                            //       Container(
                                            //         width: 1,
                                            //         color: theme.textColor
                                            //             .withOpacity(0.1),
                                            //         margin: EdgeInsets.symmetric(
                                            //             horizontal: 12.w),
                                            //       ),
                                            //       Expanded(
                                            //           child: Text(
                                            //         "Yes".tr,
                                            //         style: fontUtils
                                            //             .label(theme.textColor),
                                            //       )),
                                            //     ],
                                            //   ),
                                            // ),
                                            // Container(
                                            //   width: Get.width,
                                            //   height: 1,
                                            //   color:
                                            //       theme.textColor.withOpacity(0.1),
                                            //   margin: EdgeInsets.symmetric(
                                            //       vertical: 6.h),
                                            // ),
                                         
                                         
                                          ]);
                                    }
                                  )),
                              SizedBox(
                                height: 12.w,
                              ),
                              Container(
                                width: Get.width,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 6.h),
                                child: Text(
                                  "You might also like".tr,
                                  style: fontUtils
                                      .boldDescription(theme.textColor),
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              SizedBox(
                                width: Get.width,
                                height: 130.h,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        for (var i = 0;
                                            i < product.productsList.length;
                                            i++)
                                          InkWell(
                                            onTap: () {
                                             Get.back();
                                             Get.to(()=>ProductDetails(item: product.productsList[i], ));
                                         // utils.productAlert(theme: theme);
                                            },
                                            child: Container(
                                              width: 120.h,
                                              height: 130.h,
                                              margin:
                                                  EdgeInsets.only(left: 8.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.h)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 120.h,
                                                    height: 80.h,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6.h),
                                                        color: theme
                                                            .backgroundColor),
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    child: CachedNetworkImage(
                                                      imageUrl: 
                                                        product.productsList[i]
                                                              .images!.isNotEmpty ?

                                                    (  product.productsList[i]
                                                              .images![0].src ??
                                                          ""):"",
                                                      fit: BoxFit.cover,
                                                      placeholder: (_, __) =>
                                                          SpinKitDancingSquare(
                                                        color:
                                                            theme.primaryColor,
                                                      ),
                                                      errorWidget: (_, __,
                                                              ___) =>
                                                          Image.asset("assets/images/avatars/placeholder.png"),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 4.h,
                                                  ),
                                                  SizedBox(
                                                    width: 120.h,
                                                    height: 46.h,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                            child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "${widget.item.name}"
                                                                  .tr,
                                                              style: fontUtils
                                                                  .xSmall(theme
                                                                      .textColor),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            SizedBox(
                                                              height: 2.h,
                                                            ),
                                                            RichText(
                                                                text: TextSpan(
                                                                    children: [
                                                                  TextSpan(
                                                                         text: "${widget.item.regularPrice}",
                                                                      style: fontUtils
                                                                          .label(
                                                                              theme.buttonColor)),
                                                                  TextSpan(
                                                                      text:
                                                                          "   ",
                                                                      style: fontUtils
                                                                          .label(
                                                                              theme.buttonColor)),
                                                                  TextSpan(
                                                                          text: "${widget.item.salePrice}",
                                                                      style: fontUtils.label(
                                                                          theme
                                                                              .redColor,
                                                                          lineThrough:
                                                                              true)),
                                                                ])),
                                                            SizedBox(
                                                              height: 2.h,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  TablerIcons
                                                                      .star_filled,
                                                                  color: theme
                                                                      .yellowColor,
                                                                  size: 10.w,
                                                                ),
                                                                SizedBox(
                                                                  width: 2.w,
                                                                ),
                                                                Expanded(
                                                                    child: Text(
                                                                  "4.5 (550)"
                                                                      .tr,
                                                                  style: fontUtils
                                                                      .xSmall(theme
                                                                          .textColor),
                                                                )),
                                                                Text(
                                                                  "(110 Sold)"
                                                                      .tr,
                                                                  style: fontUtils
                                                                      .xSmall(theme
                                                                          .redColor),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ))
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        )),
                       
                     if((double.parse(widget.item.price??"0")) >1)   Container(
                          width: Get.width,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 4.h),
                          decoration:
                              BoxDecoration(color: theme.cardColor, boxShadow: [
                            BoxShadow(
                                color: theme.textColor.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 12)
                          ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: utils.button(
                                      theme.redColor,
                                      "Add to Cart",
                                      theme.whiteColor,
                                      TablerIcons.shopping_cart,
                                      theme.whiteColor,
                                      null,
                                      null,
                                      () {
product.orderModel.lineItems!.add(LineItems(price: double.parse(widget.item.price??"0") ,productId:widget.item.id ,productImage: widget.item.images!.first.src??"",productName: widget.item.name,quantity: 1,regularPrice: double.parse(widget.item.regularPrice??"0"),));

product.updateOrderModel(product.orderModel);
Get.back();
Get.snackbar("Success", "Successfully add to cart product",backgroundColor: theme.greenColor,colorText: theme.whiteColor);

                                      })),
                              SizedBox(
                                width: 12.w,
                              ),
                              Expanded(
                                  child: utils.button(
                                      theme.primaryColor,
                                      "Buy Now",
                                      theme.whiteColor,
                                      TablerIcons.circle_number_0,
                                      theme.whiteColor,
                                      null,
                                      null,
                                      () {
                                        product.orderModel.lineItems!.add(LineItems(price: double.parse(widget.item.price??"0") ,productId:widget.item.id ,productImage: widget.item.images!.first.src??"",productName: widget.item.name,quantity: 1,regularPrice: double.parse(widget.item.regularPrice??"0"),));

product.updateOrderModel(product.orderModel);
  Get.to(()=> CheckoutScreen());
                                      })),
                              SizedBox(
                                width: 12.w,
                              ),
                            ],
                          ),
                        )
                     ,SizedBox(height: 5.h,)
                   
                   
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
