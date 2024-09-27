import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_commerce/app_configs/config.dart';
import 'package:smart_commerce/app_constants/constants.dart';
import 'package:smart_commerce/app_utils/world_language.dart';
import 'package:smart_commerce/controllers/LocaleController.dart';
import 'package:smart_commerce/controllers/ProductController.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';
import 'package:smart_commerce/controllers/UserController.dart';
import 'package:smart_commerce/pages/home_page/HomeScreen.dart';
import 'package:smart_commerce/pages/orders_page/OrdersPage.dart';
import 'package:smart_commerce/pages/regester_page/SignUp.dart';

import 'pages/authentication_page/AuthenticationPage.dart';
import 'pages/login_page/LoginPage.dart';
import 'pages/splash_page/SplashScreen.dart';
import 'pages/walk_through/WalkThrough.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //** Init the local storage
  await GetStorage.init();

  //** Init Controllers
  Get.put(LocaleController());
  Get.put(ThemeController());
  Get.put(ProductController());
  Get.put(UserController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        builder : (context, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: appName.tr,
          transitionDuration: const Duration(milliseconds: 700),
          translations: WorldLanguage(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ], supportedLocales: const [
            Locale('en', 'US'),
            Locale('ar', 'AR'),
          ],
          locale: const Locale('en', 'US'), initialRoute: splashRoute,
          getPages: [
            GetPage(name: splashRoute , page: () => const SplashScreen(), transition: Transition.fadeIn),
            GetPage(name: walkThroughRoute , page: () => const WalkThrough(), transition: Transition.fadeIn),
            GetPage(name: authenticationRoute , page: () => const AuthenticationPage(), transition: Transition.downToUp),
            GetPage(name: loginRoute , page: () => const LoginPage(), transition: Transition.downToUp),
            GetPage(name: homeRoute , page: () => const HomePage(), transition: Transition.downToUp),
            GetPage(name: ordersRoute , page: () => const OrdersPage(), transition: Transition.downToUp),
            GetPage(name: signUpRoute, page: ()=>const SignUpPage(),transition: Transition.downToUp),
          ],
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          builder: (context, child) {
            child = EasyLoading.init()(context, child);
            return GetBuilder<LocaleController>(
                id: "0", builder: (localeController) {
              return Directionality(
                textDirection: localeController.locale == english ? TextDirection
                    .ltr : TextDirection.rtl,
                child: child!,
              );
            });
          },
        )
    );
  }
}