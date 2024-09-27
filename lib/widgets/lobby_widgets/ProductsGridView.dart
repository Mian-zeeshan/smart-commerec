import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';
import 'package:smart_commerce/models/GetProductsModel.dart';
import 'package:smart_commerce/pages/product_detail/ProductDetails.dart';

class ProductsGridView extends StatefulWidget {
  final int index;
  final GetProductsModel item;
  const ProductsGridView({super.key, required this.index, required this.item});

  @override
  ProductsGridState createState() => ProductsGridState();
}

class ProductsGridState extends State<ProductsGridView> {
  FontUtils fontUtils = FontUtils();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        id: "0",
        builder: (theme) {
          return GestureDetector(
            onTap: (){

              Get.to(()=>ProductDetails(item: widget.item,));
            },
            child: Container(
              width: Get.width,
              margin: EdgeInsets.only(left: 3.w, top: 10.h, right: 3.w),
              decoration: BoxDecoration(
              
                
                borderRadius: BorderRadius.circular(6.h)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width,
                    height: 200.h,
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                  blurRadius: 1.0,
                  color: theme.textColor.withOpacity(0.2),
                spreadRadius: 1.0,
                offset: Offset(0, 1)  
                )],
                      
                      color: theme.cardColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15),topRight: Radius.circular(15)),
                        // color: theme.backgroundColor,
                        // gradient: LinearGradient(
                        //     begin: Alignment.topRight,
                        //     end: Alignment.bottomLeft,
                        //     colors: [
                        //       // theme.backgroundColor.withOpacity(0.4),
                        //       // theme.backgroundColor.withOpacity(0.5),
                        //       // theme.buttonColor.withOpacity(0.1),
                        //       // theme.buttonColor.withOpacity(0.1),
                        //       // theme.backgroundColor.withOpacity(0.8),
                        //       // theme.backgroundColor.withOpacity(0.9),
                        //       // theme.backgroundColor
                        //     ])
                            ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      children: [
                        Container(
                          height: 140.h,
                          child: CachedNetworkImage(

                            imageUrl:  widget.item.images!.isNotEmpty?
                            ( widget.item.images?[0].src ?? ""):"",
                            fit: BoxFit.cover,
                            placeholder: (_, __) => SpinKitDancingSquare(
                              color: theme.primaryColor,
                            ),
                            errorWidget: (_, __, ___) =>
                                Image.asset("assets/images/avatars/placeholder.png"),
                          ),
                        ),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                                "${widget.item.name}".tr,
                                style: fontUtils.boldLabel(theme.textColor),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                          ),
                            SizedBox(
                              height: 2.h,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                 text:widget.item.price=="0"?"": "${widget.item.price}",
                                  style: fontUtils.label(theme.buttonColor)),
                              TextSpan(
                                  text: "   ",
                                  style: fontUtils.label(theme.buttonColor)),
                              TextSpan(
                                  text:widget.item.regularPrice=="0"?"": "${widget.item.regularPrice}",
                                  style: fontUtils.label(theme.redColor,
                                      lineThrough: true)),
                            ])),
                            // SizedBox(
                            //   height: 2.h,
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   crossAxisAlignment: CrossAxisAlignment.center,
                            //   children: [
                            //     Icon(
                            //       TablerIcons.star_filled,
                            //       color: theme.yellowColor,
                            //       size: 10.w,
                            //     ),
                            //     SizedBox(
                            //       width: 2.w,
                            //     ),
                            //     // Expanded(
                            //     //     child: Text(
                            //     //   "${widget.item.averageRating} (${widget.item.ratingCount})"
                            //     //       .tr,
                            //     //   style: fontUtils.xSmall(theme.textColor),
                            //     // )),
                            //     // Text(
                            //     //   "(${widget.item.stockQuantity} in stock)".tr,
                            //     //   style: fontUtils.xSmall(theme.textColor),
                            //     // )
                            //   ],
                            // )
                      ],
                    ),
                    //  Image.asset("assets/images/products/product_${widget.index % 2 == 0 ? "2" : widget.index % 3 == 0 ? "3" : widget.index % 4 == 0 ? "4" : widget.index % 5 == 0 ? "5" : "1"}.jpg", fit: BoxFit.cover,),
                  ),
                  // SizedBox(
                  //   height: 4.h,
                  // ),
                  // SizedBox(
                  //   width: Get.width,
                  //   height: 46.h,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Expanded(
                  //           child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             "${widget.item.name}".tr,
                  //             style: fontUtils.boldLabel(theme.textColor),
                  //             maxLines: 1,
                  //             overflow: TextOverflow.ellipsis,
                  //           ),
                  //           SizedBox(
                  //             height: 2.h,
                  //           ),
                  //           RichText(
                  //               text: TextSpan(children: [
                  //             TextSpan(
                  //                text:widget.item.price=="0"?"": "${widget.item.price}",
                  //                 style: fontUtils.label(theme.buttonColor)),
                  //             TextSpan(
                  //                 text: "   ",
                  //                 style: fontUtils.label(theme.buttonColor)),
                  //             TextSpan(
                  //                 text:widget.item.regularPrice=="0"?"": "${widget.item.regularPrice}",
                  //                 style: fontUtils.label(theme.redColor,
                  //                     lineThrough: true)),
                  //           ])),
                  //           // SizedBox(
                  //           //   height: 2.h,
                  //           // ),
                  //           // Row(
                  //           //   mainAxisAlignment: MainAxisAlignment.start,
                  //           //   crossAxisAlignment: CrossAxisAlignment.center,
                  //           //   children: [
                  //           //     Icon(
                  //           //       TablerIcons.star_filled,
                  //           //       color: theme.yellowColor,
                  //           //       size: 10.w,
                  //           //     ),
                  //           //     SizedBox(
                  //           //       width: 2.w,
                  //           //     ),
                  //           //     // Expanded(
                  //           //     //     child: Text(
                  //           //     //   "${widget.item.averageRating} (${widget.item.ratingCount})"
                  //           //     //       .tr,
                  //           //     //   style: fontUtils.xSmall(theme.textColor),
                  //           //     // )),
                  //           //     // Text(
                  //           //     //   "(${widget.item.stockQuantity} in stock)".tr,
                  //           //     //   style: fontUtils.xSmall(theme.textColor),
                  //           //     // )
                  //           //   ],
                  //           // )
                  //         ],
                  //       ))
                  //     ],
                  //   ),
                  // )
              
              
                ],
              ),
            ),
          );
        });
  }
}
