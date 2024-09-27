import 'dart:convert';

import 'package:get/get.dart';

class AuthApis extends GetConnect {
  Future<Response> loginApi(data) {
    httpClient.timeout = const Duration(seconds: 60);
    httpClient.maxAuthRetries = 5;
    return post("https://almumtaz.com.pk/wp-json/jwt-auth/v1/token", data);
  }

  Future<Response> signUPApi(data) {
    httpClient.timeout = const Duration(seconds: 60);
    httpClient.maxAuthRetries = 5;

    return post("https://almumtaz.com.pk/wp-json/wp/v2/users", data, headers: {
      "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hbG11bXRhei5jb20ucGsiLCJpYXQiOjE3MjcxNjc3MjEsIm5iZiI6MTcyNzE2NzcyMSwiZXhwIjoxNzI3NzcyNTIxLCJkYXRhIjp7InVzZXIiOnsiaWQiOiIxIn19fQ.xBX7AhLcrPnVGc8iDNW9LXeP_2pQV-_IOBk0bOqgclU"
    }
    
    );
  }

  Future<Response> getUserIdApi(email) {
    httpClient.timeout = const Duration(seconds: 60);
    httpClient.maxAuthRetries = 5;

    return get("https://almumtaz.com.pk/wp-json/wp/v2/users?search=$email",headers: {
      "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hbG11bXRhei5jb20ucGsiLCJpYXQiOjE3MjcxNjc3MjEsIm5iZiI6MTcyNzE2NzcyMSwiZXhwIjoxNzI3NzcyNTIxLCJkYXRhIjp7InVzZXIiOnsiaWQiOiIxIn19fQ.xBX7AhLcrPnVGc8iDNW9LXeP_2pQV-_IOBk0bOqgclU"
    });
  }

  Future<Response> deleteUserAccountApi(userId) {
    httpClient.timeout = const Duration(seconds: 60);
    httpClient.maxAuthRetries = 5;

    return delete(
        "https://almumtaz.com.pk/wp-json/wp/v2/users/$userId?reassign=0&force=true",headers: {
      "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3d3dy5hbG11bXRhei5jb20ucGsiLCJpYXQiOjE3MjcxNjc3MjEsIm5iZiI6MTcyNzE2NzcyMSwiZXhwIjoxNzI3NzcyNTIxLCJkYXRhIjp7InVzZXIiOnsiaWQiOiIxIn19fQ.xBX7AhLcrPnVGc8iDNW9LXeP_2pQV-_IOBk0bOqgclU"
    });
  }

// https://almumtaz.com.pk/wp-json/wp/v2/users/37?reassign=0&force=true
}
