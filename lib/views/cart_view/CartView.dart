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
import 'package:smart_commerce/pages/CheckOut_Page/CheckOutPage.dart';
import 'package:smart_commerce/pages/orders_page/OrdersPage.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});
  @override
  CartViewState createState() => CartViewState();
}

class CartViewState extends State<CartView> {
  FontUtils fontUtils = FontUtils();
  Utils utils = Utils();
  double totalAmount = 0;
  double discountAmount = 0;
  ProductController _productController = Get.find();
  var coupenCntr = TextEditingController();
  @override
  void initState() {
    if ((_productController.orderModel.couponLines?.length ?? 0) > 0) {
      coupenCntr.text =
          "${_productController.orderModel.couponLines?.first.code ?? ""}";
    }

    countTotal();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        id: "0",
        builder: (theme) {
          return GetBuilder<ProductController>(
              id: "0",
              builder: (_productCntr) {
                countTotal(isBuild: true);
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
                                      color:
                                          theme.primaryColor.withOpacity(0.1),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // Icon(
                                        //   TablerIcons.arrow_left,
                                        //   size: 18.w,
                                        //   color: theme.whiteColor,
                                        // ),
                                        SizedBox(
                                          width: 12.w,
                                        ),
                                        Text(
                                          "Cart (${_productCntr.orderModel.lineItems!.length})"
                                              .tr,
                                          style: fontUtils
                                              .h5(theme.whiteColor),
                                        )
                                      ],
                                    )),
                                Expanded(child: Container()),
                                IconButton(
                                    onPressed: () {
                                      _productCntr.orderModel.lineItems = [];

                                      _productCntr.updateOrderModel(
                                          _productCntr.orderModel);
                                    },
                                    icon: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          TablerIcons.trash,
                                          size: 12.w,
                                          color: theme.whiteColor,
                                        ),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        Text(
                                          "Delete".tr,
                                          style: fontUtils
                                              .boldLabel(theme.whiteColor),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                         
                         
                          Expanded(
                              child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                for (var i = 0;
                                    i <
                                        _productCntr
                                            .orderModel.lineItems!.length;
                                    i++)
                                  Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(2),
                                        margin: EdgeInsets.symmetric(
                                          vertical: 0.h,
                                        ),
                                        child: Container(
                                          width: Get.width,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12.w, vertical: 6.h),
                                          margin: EdgeInsets.symmetric(
                                              vertical: 4.h, horizontal: 12.w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.w),
                                              color: theme.cardColor,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: theme.textColor
                                                        .withOpacity(0.1),
                                                    spreadRadius: 1,
                                                    blurRadius: 12)
                                              ]),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 60.h,
                                                height: 60.h,
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      width: 60.h,
                                                      height: 60.h,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.w),
                                                          color: theme
                                                              .backgroundColor),
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      child: CachedNetworkImage(
                                                        imageUrl: _productCntr
                                                                .orderModel
                                                                .lineItems![i]
                                                                .productImage ??
                                                            "",
                                                        fit: BoxFit.cover,
                                                        placeholder: (_, __) =>
                                                            SpinKitDancingSquare(
                                                          color: theme
                                                              .primaryColor,
                                                        ),
                                                        errorWidget: (_, __,
                                                                ___) =>
                                                            Image.asset(
                                                                "assets/images/place_holder.jpg"),
                                                      ),
                                                      //  Image.asset("assets/images/products/product_4.jpg", fit: BoxFit.cover,),
                                                    ),
                                                    Positioned(
                                                        top: -10,
                                                        left: -10,
                                                        child: Checkbox(
                                                          value: true,
                                                          activeColor: theme
                                                              .primaryColor,
                                                          checkColor:
                                                              theme.whiteColor,
                                                          side: BorderSide(
                                                              color: theme
                                                                  .primaryColor,
                                                              width: 2),
                                                          onChanged:
                                                              (bool? value) {},
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 6.w,
                                              ),
                                              Expanded(
                                                  child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${_productCntr.orderModel.lineItems![i].productName}"
                                                        .tr,
                                                    style: fontUtils
                                                        .label(theme.textColor),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  // Text("Brand: Rigix, Color: Red, unit: NOS".tr, style: fontUtils.small(theme.textColor.withOpacity(0.6)), maxLines: 1, overflow: TextOverflow.ellipsis,),
                                                  SizedBox(
                                                    height: 3.h,
                                                  ),
                                                  RichText(
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                        text:
                                                            "${_productCntr.orderModel.lineItems![i].price}",
                                                        style: fontUtils.label(
                                                            theme
                                                                .textColor
                                                                .withOpacity(
                                                                    0.7))),
                                                    TextSpan(
                                                        text: "  ",
                                                        style: fontUtils.label(
                                                            theme
                                                                .textColor
                                                                .withOpacity(
                                                                    0.7))),
                                                    TextSpan(
                                                        text:
                                                            "${_productCntr.orderModel.lineItems![i].regularPrice}",
                                                        style: fontUtils.label(
                                                            theme.redColor
                                                                .withOpacity(
                                                                    0.7),
                                                            lineThrough: true)),
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
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      int q = _productCntr
                                                              .orderModel
                                                              .lineItems![i]
                                                              .quantity ??
                                                          0;
                                                      int incQuantitiy = q + 1;
                                                      _productCntr
                                                              .orderModel
                                                              .lineItems![i]
                                                              .quantity =
                                                          incQuantitiy;
                                                      _productCntr
                                                          .updateOrderModel(
                                                              _productCntr
                                                                  .orderModel);
                                                      countTotal();
                                                    },
                                                    child: Container(
                                                      width: 25.w,
                                                      height: 15.h,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              theme.greenColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.w)),
                                                      child: Icon(
                                                        TablerIcons.plus,
                                                        size: 12.w,
                                                        color: theme.whiteColor,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 6.h,
                                                  ),
                                                  Text(
                                                    "${_productCntr.orderModel.lineItems![i].quantity}"
                                                        .tr,
                                                    style: fontUtils.h6Bold(
                                                        theme.textColor),
                                                  ),
                                                  SizedBox(
                                                    height: 6.h,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      int q = _productCntr
                                                              .orderModel
                                                              .lineItems![i]
                                                              .quantity ??
                                                          0;
                                                      if (q != 1) {
                                                        int incQuantitiy =
                                                            q - 1;
                                                        _productCntr
                                                                .orderModel
                                                                .lineItems![i]
                                                                .quantity =
                                                            incQuantitiy;
                                                        _productCntr
                                                            .updateOrderModel(
                                                                _productCntr
                                                                    .orderModel);
                                                      }
                                                      countTotal();
                                                    },
                                                    child: Container(
                                                      width: 25.w,
                                                      height: 15.h,
                                                      decoration: BoxDecoration(
                                                          color: theme.redColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.w)),
                                                      child: Icon(
                                                        TablerIcons.minus,
                                                        size: 12.w,
                                                        color: theme.whiteColor,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 5.w,
                                        child: GestureDetector(
                                          onTap: () {
                                            _productCntr.orderModel.lineItems!
                                                .removeAt(i);
                                            // _productCntr.orderModel.lineItems=[];

                                            _productCntr.updateOrderModel(
                                                _productCntr.orderModel);
                                            countTotal();
                                          },
                                          child: Container(
                                              padding: EdgeInsets.all(1),
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: theme.textColor
                                                          .withOpacity(0.1),
                                                      blurRadius: 1.0,
                                                      offset: Offset(0, 2),
                                                      spreadRadius: 1.0)
                                                ],
                                                color: theme.cardColor,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Icon(
                                                Icons.close,
                                                color: theme.redColor,
                                              )),
                                        ),
                                      ),
                                    ],
                                  )
                              ],
                            ),
                          )),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 6.h),
                            decoration: BoxDecoration(
                                color: theme.cardColor,
                                boxShadow: [
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
                                    child: utils.borderedInputField(
                                        "Coupon Code",
                                        theme.textColor.withOpacity(0.5),
                                        theme.textColor.withOpacity(0.4),
                                        null,
                                        null,
                                        theme.textColor,
                                        null,
                                        null,
                                        null,
                                        false,
                                        true,
                                        coupenCntr, (val) {
                                  _productCntr.orderModel.couponLines = [];
                                  _productCntr.orderModel.couponLines?.add(val);
                                  _productCntr.updateOrderModel(
                                      _productCntr.orderModel);
                                })),
                                GestureDetector(
                                  onTap: () {
                                    EasyLoading.show(status: "Verifying..");
                                    try {
                                      String coupenVal = coupenCntr.text
                                          .toLowerCase()
                                          .toString();

                                      CoupenModel? model = _productCntr
                                          .listCoupenCodes
                                          .firstWhereOrNull(
                                        (e) =>
                                            e.code!.toLowerCase().toString() ==
                                            coupenVal,
                                      );
                                      if (model == null) {
                                        Get.snackbar(
                                            "Invalid", "In-Valid coupen code",
                                            backgroundColor: theme.redColor,
                                            colorText: theme.whiteColor);
                                        return;
                                      } else if (model != null) {
                                        if (model.usageCount == 1) {
                                          Get.snackbar("Invalid",
                                              "Coupon usage limit has been reached.",
                                              backgroundColor: theme.redColor,
                                              colorText: theme.whiteColor);
                                          return;
                                        } else {
                                          _productCntr.orderModel.couponLines =
                                              [];
                                          _productCntr.orderModel.couponLines!
                                              .add(CouponLines(
                                                  code: model.code));

                                          _productCntr.updateOrderModel(
                                              _productCntr.orderModel);

                                          discountAmount =
                                              double.parse(model.amount ?? "0");
                                          setState(() {});
                                          countTotal();
                                          coupenCntr.clear();
                                        }
                                      }
                                    } catch (e) {
                                      print(e.toString());
                                    } finally {
                                      EasyLoading.dismiss();
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 4.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.w),
                                        color: theme.redColor),
                                    child: Text(
                                      "Apply".tr,
                                      style: fontUtils
                                          .boldDescription(theme.whiteColor),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 20.h),
                            decoration: BoxDecoration(
                                color: theme.buttonColor,
                                boxShadow: [
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
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text: "Discount:".tr,
                                        style: fontUtils.label(
                                            theme.whiteColor.withOpacity(0.8)),
                                      ),
                                      TextSpan(
                                        text: "  ".tr,
                                        style:
                                            fontUtils.label(theme.whiteColor),
                                      ),
                                      TextSpan(
                                        text: "${discountAmount}".tr,
                                        style: fontUtils
                                            .boldLabel(theme.whiteColor),
                                      ),
                                    ])),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                        text: "Total:".tr,
                                        style: fontUtils.label(
                                            theme.whiteColor.withOpacity(0.8)),
                                      ),
                                      TextSpan(
                                        text: "  ".tr,
                                        style:
                                            fontUtils.label(theme.whiteColor),
                                      ),
                                      TextSpan(
                                        text: "PKR $totalAmount".tr,
                                        style: fontUtils
                                            .boldLabel(theme.whiteColor),
                                      ),
                                    ])),
                                  ],
                                )),
                                GestureDetector(
                                  onTap: () {
                                    if (_productCntr
                                            .orderModel.lineItems!.length >
                                        0) {
                                      Get.to(() => CheckoutScreen(),
                                          arguments: discountAmount);
                                    } else {
                                      Get.snackbar(
                                          "Warning", "Not selected product",
                                          backgroundColor: theme.redColor,
                                          colorText: theme.whiteColor);
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 4.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.w),
                                        color: theme.primaryColor),
                                    child: Text(
                                      "Checkout".tr,
                                      style: fontUtils
                                          .boldDescription(theme.whiteColor),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }

  countTotal({isBuild = false}) {
    totalAmount = 0;

    _productController.orderModel.lineItems;
    for (int i = 0; i < _productController.orderModel.lineItems!.length; i++) {
      double amunt =
          (_productController.orderModel.lineItems![i].quantity ?? 1) *
              (_productController.orderModel.lineItems![i].price ?? 0);
      totalAmount = totalAmount + amunt;
    }
    if ((_productController.orderModel.couponLines?.length ?? 0) > 0) {
      CoupenModel? model = _productController.listCoupenCodes.firstWhereOrNull(
        (e) =>
            e.code!.toLowerCase().toString() ==
            _productController.orderModel.couponLines![0].code,
      );

      discountAmount = double.parse(model?.amount ?? "0");
    }
    totalAmount = totalAmount - discountAmount;
    if (mounted && isBuild == false) {
      setState(() {});
    }
  }
}
