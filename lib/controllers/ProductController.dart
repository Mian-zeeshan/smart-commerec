import 'dart:convert';

import 'package:get/get.dart';
import 'package:smart_commerce/models/GetBannerModel.dart';
import 'package:smart_commerce/models/GetCoupenModel.dart';
import 'package:smart_commerce/models/GetProductcategoryModel.dart';
import 'package:smart_commerce/models/GetProductsModel.dart';
import 'package:smart_commerce/models/OrderModel.dart';
import 'package:smart_commerce/services/ProductApis.dart';

class ProductController extends GetxController {
  GetProductsModel getProductsModel = GetProductsModel(images: [],attributes: []);
  List<BannerModel> listBanners=[];
  BannerModel bannerModel=BannerModel();
  List<CoupenModel> listCoupenCodes=[];
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
  List<GetProductsModel> productsList = [];
  List<ProductCategoryModel> productCategoryList = [];
  ProductApis apis = ProductApis();
  bool isLoading = false;
  String category="";
  updateValOfCategory(String val){
    category=val;
    update(['0']);
    notifyChildrens();
  }
  @override
  void onInit() {
    getCoupenCodes();
    getBanners();
    getProducts();
    getProductCategories();
    super.onInit();
  }

  updateOrderModel(model) {
    orderModel = model;
    update(['0']);
    notifyChildrens();
  }
getBanners()async{
  try{
    var res = await apis.getBanners();

    if(res.statusCode==200){
       List<dynamic> data = jsonDecode(jsonEncode(res.body));

        listBanners = data.map((json) => BannerModel.fromJson(json)).toList();

    }

  }
  catch(e){

  }
print("Lentgh of list banners -----------------${listBanners.length}");
  update(['0']);
  notifyChildrens();
}

getCoupenCodes()async{
  try{
    var res = await apis.getCoupenCodes();

    if(res.statusCode==200){
       List<dynamic> data = jsonDecode(jsonEncode(res.body));

        listCoupenCodes = data.map((json) => CoupenModel.fromJson(json)).toList();

    }

  }
  catch(e){

  }
print("Lentgh of list coupen Codes -----------------${listCoupenCodes.length}");
  update(['0']);
  notifyChildrens();
}

  getProducts({mounted = false, page = 1, pageSize = 20, search = ""}) async {
    print(page);
    try {
      if (mounted == true) {
        isLoading = true;
        update(['0']);
        notifyChildrens();
      }

      var res =
          await apis.getProducts(page: page, size: pageSize, search: search,category: category);

      if (res.statusCode == 200) {
        List<dynamic> data = jsonDecode(jsonEncode(res.body));

        var list = data.map((json) => GetProductsModel.fromJson(json)).toList();

        if (page == 1) {
          productsList = [];
          productsList = list;
        } else {
          productsList.addAll(list);
        }
      }
      else{
         productsList = [];
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading = false;
    }
    print("length of products list ${productsList.length}");
    update(['0']);
    notifyChildrens();
  }

  getProductCategories() async {
    try {
      var res = await apis.getProductsCategory();

      if (res.statusCode == 200) {
        List<dynamic> data = jsonDecode(jsonEncode(res.body));
        productCategoryList =
            data.map((json) => ProductCategoryModel.fromJson(json)).toList();
      }
    } catch (e) {
      print(e.toString());
    } finally {}
    print("length of products  categories list ${productCategoryList.length}");
    update(['0']);
    notifyChildrens();
  }
}
