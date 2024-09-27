import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ProductController.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';
import 'package:smart_commerce/models/GetCoupenModel.dart';
import 'package:smart_commerce/models/OrderModel.dart';
import 'package:smart_commerce/pages/orders_page/OrderSuccessScreen.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreen createState() => _CheckoutScreen();
}

class _CheckoutScreen extends State<CheckoutScreen> {
  var utils = Utils();

  var phoneController = TextEditingController();

  // AddressModel? selectedAddress;
  var isRetailer = false;

  ProductController productCntr = ProductController();
  FontUtils fontUtils = FontUtils();
  // AddressModel? selectedBranch;
  double totalAmount = 0;
  double discountAmount = 0.0;
  var nameCntr = TextEditingController();

  var addressCntr = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // isRetailer = userController.user != null ? userController.user!.isRetailer? userController.user!.retailerModel!.approved ? true : false :false : false;
    // phoneController.text = userController.user!.phone;
    // emailController.text = userController.user!.email;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      id: "0",
      builder: (theme) {
        // checkAdminController = adminController;
        // if(checkAdminController.system.branches.length > 0){
        //   if(selectedBranch == null){
        //     selectedBranch = checkAdminController.system.branches[0];
        //   }
        // }
        return Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(
              elevation: 0,
              backgroundColor: theme.primaryColor,
            ),
          ),
          body: GetBuilder<ProductController>(
              id: "0",
              builder: (_productCntr) {
                countTotal(pd: _productCntr, isBuild: true);
                return SafeArea(
                  child: Container(
                    width: Get.width,
                    height: Get.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: Get.width,
                          color: theme.primaryColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    CupertinoIcons.arrow_left,
                                    size: 20,
                                    color: theme.cardColor,
                                  )),
                              Text(
                                "Checkout",
                                style: fontUtils.h6Bold(theme.cardColor),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                //   Row(
                                //     mainAxisAlignment: MainAxisAlignment.start,
                                //     crossAxisAlignment: CrossAxisAlignment.center,
                                //     children: [
                                //       Icon(
                                //         CupertinoIcons.table,
                                //         color: theme.textColor,
                                //         size: 20,
                                //       ),
                                //       SizedBox(
                                //         width: 12,
                                //       ),
                                // Expanded(
                                //   child: Container(
                                //     padding: EdgeInsets.symmetric(
                                //         horizontal: 12, vertical: 12),
                                //     decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(8),
                                //         border:
                                //             Border.all(color: theme.textColor)),
                                //     child: TextFormField(
                                //       style: fontUtils.label(theme.textColor),
                                //       decoration: InputDecoration.collapsed(
                                //         hintText: "Table No",
                                //         hintStyle:
                                //             fontUtils.label(theme.textColor),
                                //       ),
                                //       controller: tNoController,
                                //       keyboardType: TextInputType.number,
                                //     ),
                                //   ),
                                // )
                                //     ],
                                //   ),
                                // SizedBox(
                                //   height: 5,
                                // ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   crossAxisAlignment: CrossAxisAlignment.center,
                                //   children: [

                                //   ],
                                // ),
                                // SizedBox(
                                //   height: 5,
                                // ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   crossAxisAlignment: CrossAxisAlignment.center,
                                //   children: [

                                //     Expanded(
                                //       child: Container(
                                //         padding: EdgeInsets.symmetric(
                                //             horizontal: 12, vertical: 12),
                                //         decoration: BoxDecoration(
                                //             borderRadius: BorderRadius.circular(8),
                                //             border:
                                //                 Border.all(color: theme.textColor)),
                                //         child: TextFormField(
                                //           style: fontUtils.label(theme.textColor),
                                //           decoration: InputDecoration.collapsed(
                                //             hintText: "Email",
                                //             hintStyle:
                                //                 fontUtils.label(theme.textColor),
                                //           ),
                                //           controller: emailController,
                                //           keyboardType: TextInputType.emailAddress,
                                //         ),
                                //       ),
                                //     )
                                //   ],
                                // ),
                                // SizedBox(
                                //   height: 12,
                                // ),
                                // Container(
                                //   width: Get.width,
                                //   height: 1,
                                //   color: theme.textColor.withOpacity(0.3),
                                // ),

                                //order item cart
                                GetBuilder<ProductController>(
                                    id: "0",
                                    builder: (pd) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: Get.width,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 12),
                                            decoration: BoxDecoration(
                                              border: Border.all(color: theme.textColor.withOpacity(0.3)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: theme.cardColor,
                                            //     boxShadow:  [
                                            //         BoxShadow(
                                            // blurRadius: 1,
                                            // spreadRadius: 1,
                                            // offset: Offset(0, 2),
                                            // color: theme.textColor.withOpacity(0.2)
                                            // )
                                            //       // BoxShadow(
                                            //       //     blurRadius: 2,
                                            //       //     spreadRadius: 2,
                                            //       //     offset: Offset(0, 2),
                                            //       //     color: theme.textColor
                                            //       //         .withOpacity(0.3))
                                            //     ]
                                                ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Cart Items",
                                                  style: fontUtils.boldLabel(
                                                      theme.textColor),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Container(
                                                  height: 1.0,
                                                  color: theme.textColor
                                                      .withOpacity(0.4),
                                                ),
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                for (var i = 0;
                                                    i <
                                                        pd.orderModel.lineItems!
                                                            .length;
                                                    i++)
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 20.h),
                                                    child: IntrinsicHeight(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: 60.h,
                                                            height: 60.h,
                                                            decoration:
                                                                BoxDecoration(
                                                                    // border: Border.all(color: theme.textColor.withOpacity(0.3),width: 2.0),
                                                                    boxShadow: [
                                                                  BoxShadow(
                                            blurRadius: 1,
                                            spreadRadius: 1,
                                            offset: Offset(0, 2),
                                            color: theme.textColor.withOpacity(0.2)
                                            )
                                                                ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(8
                                                                            .w),
                                                                    color: theme
                                                                        .cardColor),
                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl: pd
                                                                      .orderModel
                                                                      .lineItems![
                                                                          i]
                                                                      .productImage ??
                                                                  "",
                                                              fit: BoxFit.cover,
                                                              placeholder: (_,
                                                                      __) =>
                                                                  SpinKitDancingSquare(
                                                                color: theme
                                                                    .primaryColor,
                                                              ),
                                                              errorWidget: (_,
                                                                      __,
                                                                      ___) =>
                                                                  Image.asset(
                                                                      "assets/images/place_holder.jpg"),
                                                            ),
                                                            //  Image.asset("assets/images/products/product_4.jpg", fit: BoxFit.cover,),
                                                          ),
                                                          SizedBox(
                                                            width: 6.w,
                                                          ),
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
                                                                "${pd.orderModel.lineItems![i].productName}"
                                                                    .tr,
                                                                style: fontUtils
                                                                    .label(theme
                                                                        .textColor),
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                              // Text("Brand: Rigix, Color: Red, unit: NOS".tr, style: fontUtils.small(theme.textColor.withOpacity(0.6)), maxLines: 1, overflow: TextOverflow.ellipsis,),
                                                              SizedBox(
                                                                height: 3.h,
                                                              ),
                                                              RichText(
                                                                  text: TextSpan(
                                                                      children: [
                                                                    TextSpan(
                                                                        text:
                                                                            "${pd.orderModel.lineItems![i].price}",
                                                                        style: fontUtils.label(theme
                                                                            .textColor
                                                                            .withOpacity(0.7))),
                                                                    TextSpan(
                                                                        text:
                                                                            "  ",
                                                                        style: fontUtils.label(theme
                                                                            .textColor
                                                                            .withOpacity(0.7))),
                                                                    TextSpan(
                                                                        text:
                                                                            "${pd.orderModel.lineItems![i].regularPrice}",
                                                                        style: fontUtils.label(
                                                                            theme.redColor.withOpacity(
                                                                                0.7),
                                                                            lineThrough:
                                                                                true)),
                                                                  ])),
                                                              SizedBox(
                                                                height: 3.h,
                                                              ),
                                                              // Text("-40% OFF".tr, style: fontUtils.boldSmall(theme.buttonColor.withOpacity(0.9)), maxLines: 1, overflow: TextOverflow.ellipsis,),
                                                            ],
                                                          )),
                                                          SizedBox(
                                                            width: 6.w,
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  int q = pd
                                                                          .orderModel
                                                                          .lineItems![
                                                                              i]
                                                                          .quantity ??
                                                                      0;
                                                                  int incQuantitiy =
                                                                      q + 1;
                                                                  pd
                                                                      .orderModel
                                                                      .lineItems![
                                                                          i]
                                                                      .quantity = incQuantitiy;
                                                                  pd.updateOrderModel(
                                                                      pd.orderModel);
                                                                  countTotal(
                                                                      pd: pd);
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 25.w,
                                                                  height: 15.h,
                                                                  decoration: BoxDecoration(
                                                                      color: theme
                                                                          .greenColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.w)),
                                                                  child: Icon(
                                                                    TablerIcons
                                                                        .plus,
                                                                    size: 12.w,
                                                                    color: theme
                                                                        .whiteColor,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 6.h,
                                                              ),
                                                              Text(
                                                                "${pd.orderModel.lineItems![i].quantity}"
                                                                    .tr,
                                                                style: fontUtils
                                                                    .h6Bold(theme
                                                                        .textColor),
                                                              ),
                                                              SizedBox(
                                                                height: 6.h,
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  int q = pd
                                                                          .orderModel
                                                                          .lineItems![
                                                                              i]
                                                                          .quantity ??
                                                                      0;
                                                                  if (q != 1) {
                                                                    int incQuantitiy =
                                                                        q - 1;
                                                                    pd
                                                                        .orderModel
                                                                        .lineItems![
                                                                            i]
                                                                        .quantity = incQuantitiy;
                                                                    pd.updateOrderModel(
                                                                        pd.orderModel);
                                                                  }
                                                                  countTotal(
                                                                      pd: pd);
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 25.w,
                                                                  height: 15.h,
                                                                  decoration: BoxDecoration(
                                                                      color: theme
                                                                          .redColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.w)),
                                                                  child: Icon(
                                                                    TablerIcons
                                                                        .minus,
                                                                    size: 12.w,
                                                                    color: theme
                                                                        .whiteColor,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    }),
                                const SizedBox(
                                  height: 12,
                                ),
                                //payment widget here========================
                                Container(
                                  width: Get.width,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: theme.cardColor,
                                       border: Border.all(color: theme.textColor.withOpacity(0.3)),
                                      // boxShadow:  [
                                      //     BoxShadow(
                                      //       blurRadius: 1,
                                      //       spreadRadius: 1,
                                      //       offset: Offset(0, 2),
                                      //       color: theme.textColor.withOpacity(0.2)
                                      //       )
                                      //   // BoxShadow(
                                      //   //     blurRadius: 2,
                                      //   //     spreadRadius: 2,
                                      //   //     offset: Offset(0, 2),
                                      //   //     color: theme.textColor.withOpacity(0.3))
                                      // ]
                                      ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Payment",
                                            style: fontUtils
                                                .boldLabel(theme.textColor),
                                          ),
                                        ],
                                      ),

                                      // Container(
                                      //   height: 1.0,
                                      //   color: theme.textColor.withOpacity(0.4),
                                      // ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        height: 40.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            border: Border.all(
                                                color: theme.textColor
                                                    .withOpacity(0.3))),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                CupertinoIcons
                                                    .check_mark_circled_solid,
                                                color: theme.greenColor,
                                                size: 25.h,
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Text(
                                                "Cash on delivery",
                                                style: fontUtils
                                                    .boldLabel(theme.textColor),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  width: Get.width,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: theme.cardColor,
                                       border: Border.all(color: theme.textColor.withOpacity(0.3)),
                                      // boxShadow:  [
                                      //   BoxShadow(
                                      //       blurRadius: 1,
                                      //       spreadRadius: 1,
                                      //       offset: Offset(0, 2),
                                      //       color: theme.textColor.withOpacity(0.2)
                                      //       )
                                      // ]
                                      ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Shipping Detail",
                                            style: fontUtils
                                                .boldLabel(theme.textColor),
                                          ),
                                        ],
                                      ),
                                      // SizedBox(
                                      //   height: 5.h,
                                      // ),
                                      // Container(
                                      //   height: 1.0,
                                      //   color: theme.textColor.withOpacity(0.4),
                                      // ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 12),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: theme.textColor
                                                    .withOpacity(0.3))),
                                        child: TextFormField(
                                          onChanged: (v) {
                                            _productCntr.orderModel.billing
                                                ?.firstName = v.toString();
                                            _productCntr.orderModel.shipping
                                                ?.firstName = v.toString();
                                          },
                                          style:
                                              fontUtils.label(theme.textColor),
                                          decoration: InputDecoration.collapsed(
                                            hintText: "Name",
                                            hintStyle: fontUtils
                                                .label(theme.textColor),
                                          ),
                                          controller: nameCntr,
                                          // keyboardType: TextInputType.,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 12),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: theme.textColor
                                                    .withOpacity(0.3))),
                                        child: TextFormField(
                                          onChanged: (v) {
                                            _productCntr.orderModel.billing
                                                ?.phone = v.toString();
                                          },
                                          style:
                                              fontUtils.label(theme.textColor),
                                          decoration: InputDecoration.collapsed(
                                            hintText: "Phone",
                                            hintStyle: fontUtils
                                                .label(theme.textColor),
                                          ),
                                          controller: phoneController,
                                          keyboardType: TextInputType.phone,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 12),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: theme.textColor
                                                    .withOpacity(0.3))),
                                        child: TextFormField(
                                          onChanged: (v) {
                                            _productCntr.orderModel.billing
                                                ?.address1 = v.toString();
                                            _productCntr.orderModel.shipping
                                                ?.address1 = v.toString();
                                          },
                                          style:
                                              fontUtils.label(theme.textColor),
                                          decoration: InputDecoration.collapsed(
                                            hintText: "Address",
                                            hintStyle: fontUtils
                                                .label(theme.textColor),
                                          ),
                                          controller: addressCntr,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                //order summery widget here--------------------------
                                Container(
                                  width: Get.width,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: theme.cardColor,
                                      boxShadow: const [
                                        // BoxShadow(
                                        //     blurRadius: 2,
                                        //     spreadRadius: 2,
                                        //     offset: Offset(0, 2),
                                        //     color: theme.textColor.withOpacity(0.3))
                                      ]),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Order Summary",
                                            style: fontUtils
                                                .boldLabel(theme.textColor),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            "Item Subtotal",
                                            style: fontUtils
                                                .label(theme.textColor),
                                          )),
                                          Expanded(
                                              child: Text(
                                            "${totalAmount ?? "-:-"}",
                                            style: fontUtils
                                                .boldLabel(theme.textColor),
                                            textAlign: TextAlign.end,
                                          ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            "Discount",
                                            style: fontUtils
                                                .label(theme.textColor),
                                          )),
                                          Expanded(
                                              child: Text(
                                            "${(discountAmount) ?? "-:-"}",
                                            style: fontUtils
                                                .boldLabel(theme.textColor),
                                            textAlign: TextAlign.end,
                                          ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            "Shipping",
                                            style: fontUtils
                                                .label(theme.textColor),
                                          )),
                                          Expanded(
                                              child: Text(
                                            "${0.0 ?? "-:-"}",
                                            style: fontUtils
                                                .boldLabel(theme.textColor),
                                            textAlign: TextAlign.end,
                                          ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Container(
                                        height: 1.h,
                                        color: theme.textColor.withOpacity(0.2),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            "Total",
                                            style: fontUtils
                                                .label(theme.textColor),
                                          )),
                                          Expanded(
                                              child: Text(
                                            "${(totalAmount - discountAmount) ?? "-:-"}",
                                            style: fontUtils
                                                .boldLabel(theme.textColor),
                                            textAlign: TextAlign.end,
                                          ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(
                                  height: 12,
                                ),
                              ],
                            ),
                          ),
                        )),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: utils.button(
                                theme.primaryColor,
                                "Order Now",
                                theme.whiteColor,
                                null,
                                null,
                                null,
                                null, () async {
                              print(_productCntr.orderModel.toJson());
                              if (nameCntr.text.isEmpty) {
                                Get.snackbar("Required", "Name is required",
                                    backgroundColor: theme.redColor,
                                    colorText: theme.whiteColor);

                                return;
                              } else if (phoneController.text.isEmpty) {
                                Get.snackbar("Required", "Phone No is required",
                                    backgroundColor: theme.redColor,
                                    colorText: theme.whiteColor);

                                return;
                              } else if (addressCntr.text.isEmpty) {
                                Get.snackbar("Required", "Address is required",
                                    backgroundColor: theme.redColor,
                                    colorText: theme.whiteColor);

                                return;
                              }
                              try {
                                EasyLoading.show(status: "Saving..");
                                var res = await _productCntr.apis.createOrder(
                                    _productCntr.orderModel.toJson());
                                print(res.body);
                                if (res.statusCode == 201) {
                                  OrderModel orderModel = OrderModel(
                                      lineItems: [],
                                      couponLines: [],
                                      paymentMethod: "cod",
                                      paymentMethodTitle: "Cash on Delivery",
                                      setPaid: null,
                                      billing: Billing(
                                          address1: "",
                                          address2: "",
                                          city: "",
                                          country: "",
                                          email: null,
                                          firstName: "",
                                          lastName: "",
                                          phone: "",
                                          postcode: "",
                                          state: ""),
                                      shipping: Shipping(
                                          address1: "",
                                          address2: "",
                                          city: "",
                                          country: "",
                                          firstName: "",
                                          lastName: "",
                                          postcode: "",
                                          state: ""));
                                  _productCntr.updateOrderModel(orderModel);
                                  Get.to(() => OrderSuccessScreen());
                                } else {
                                  Get.snackbar(
                                      "Failed", "${res.body['message']}",
                                      backgroundColor: theme.redColor,
                                      colorText: theme.whiteColor);
                                }
                              } catch (e) {
                                print(e.toString());
                              } finally {
                                EasyLoading.dismiss();
                              }
                            })),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        );
      },
    );
  }

  setData() {
    if (mounted) {
      setState(() {});
    }
  }

  Widget form(String hints, String label, TextEditingController controller,
      {onChange}) {
    return GetBuilder<ThemeController>(
        id: "0",
        builder: (theme) {
          return Container(
            height: MediaQuery.of(context).size.height / 12,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              onChanged: onChange,
              style: fontUtils.small(theme.textColor),
              decoration: InputDecoration(
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color: theme.textColor),
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: theme.textColor),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: label,
                  hintText: hints),
            ),
          );
        });
  }

  countTotal({required ProductController pd, bool isBuild = false}) {
    totalAmount = 0;

    for (int i = 0; i < pd.orderModel.lineItems!.length; i++) {
      double amunt = (pd.orderModel.lineItems![i].quantity ?? 1) *
          (pd.orderModel.lineItems![i].price ?? 0);
      totalAmount = totalAmount + amunt;
    }
    if ((pd.orderModel.couponLines?.length ?? 0) > 0) {
      CoupenModel? model = pd.listCoupenCodes.firstWhereOrNull(
        (e) =>
            e.code!.toLowerCase().toString() ==
            pd.orderModel.couponLines![0].code,
      );

      discountAmount = double.parse(model?.amount ?? "0");
    }

    if (!isBuild) {
      setData();
    }
  }
}
