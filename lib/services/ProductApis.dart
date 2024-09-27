import 'dart:convert';

import 'package:get/get.dart';
import 'package:smart_commerce/app_configs/config.dart';

class ProductApis extends GetConnect {
  @override
  void onInit() {
    httpClient.timeout = Duration(seconds: 60);
    httpClient.maxAuthRetries = 5;
    super.onInit();
  }

  Future<Response> getProducts({page, size, search, category}) {
    httpClient.timeout = Duration(seconds: 60);
    httpClient.maxAuthRetries = 5;
    return get(
        "https://www.almumtaz.com.pk/wp-json/wc/v3/products?consumer_key=$Consumerkey&consumer_secret=$Consumersecret&page=$page&per_page=$size&search=$search&category=$category");
  }

  Future<Response> getProductsCategory() {
    httpClient.timeout = Duration(seconds: 60);
    httpClient.maxAuthRetries = 5;
    return get(
        "https://www.almumtaz.com.pk/wp-json/wc/v3/products/categories?consumer_key=ck_3fa52cd518a95c526474206fb074623e0cfbdca1&consumer_secret=cs_d6a4402e823dc33eb0d38b755e34e9c8054723d3");
  }

  Future<Response> getBanners() {
    httpClient.timeout = Duration(seconds: 60);
    httpClient.maxAuthRetries = 5;
    return get("https://www.almumtaz.com.pk/wp-json/wp/v2/media?search=banner");
  }

  Future<Response> getCoupenCodes() {
    httpClient.timeout = Duration(seconds: 60);
    httpClient.maxAuthRetries = 5;
    return get(
        "https://www.almumtaz.com.pk/wp-json/wc/v3/coupons?consumer_key=ck_3fa52cd518a95c526474206fb074623e0cfbdca1&consumer_secret=cs_d6a4402e823dc33eb0d38b755e34e9c8054723d3");
  }

  Future<Response> createOrder(data) async {
    httpClient.timeout = Duration(seconds: 60);
    httpClient.maxAuthRetries = 5;
    final String credentials = '$Consumerkey:$Consumersecret';
    final String encodedCredentials = base64Encode(utf8.encode(credentials));

    return post(
      'https://www.almumtaz.com.pk/wp-json/wc/v3/orders',
      data,
      headers: {
        'Authorization': 'Basic $encodedCredentials',
        'Content-Type': 'application/json',
      },
    );
  }
}
