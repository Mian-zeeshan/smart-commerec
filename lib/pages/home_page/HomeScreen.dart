import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ProductController.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';
import 'package:smart_commerce/views/account_view/AccountView.dart';
import 'package:smart_commerce/views/cart_view/CartView.dart';
import 'package:smart_commerce/views/lobby_view/LobbyView.dart';
import 'package:smart_commerce/views/notification_view/NotificationView.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  //** Controllers
  var hidePassword = true;
  late PersistentTabController _controller;
  var switchOrganization = false;

  //** Utils
  FontUtils fontUtils = FontUtils();
  Utils utils = Utils();
  var selectedMenu = "1";
  var openSubMenu = "1";
  var box = GetStorage();
ProductController _productController=Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(id: "0", builder: (theme) {
      return GetBuilder<ProductController>(
        id: "0",
        builder: (_product) {
          return PersistentTabView(
            controller: _controller,
            tabs: [
              PersistentTabConfig(
                onSelectedTabPressWhenNoScreensPushed: (){
theme.updateSelectedIndex(-1);
_product.updateValOfCategory("");
_productController.getProducts(mounted: true,page: 1,pageSize: 20);
                },
                
                screen:  LobbyView(_controller), item: ItemConfig(
                
                  activeForegroundColor: theme.primaryColor,
                  inactiveForegroundColor: theme.textColor.withOpacity(0.5),
                  icon: const Icon(TablerIcons.smart_home), title: "Home")
              ),
              PersistentTabConfig(screen: const CartView(), item: ItemConfig(
                  activeForegroundColor: theme.primaryColor,
                  inactiveForegroundColor: theme.textColor.withOpacity(0.5),
                  // activeColorSecondary: theme.buttonColor,
                  // activeForegroundColor: theme.buttonColor,
                  icon:(_product.orderModel.lineItems?.length??0) > 0? Badge(
                    label: Text("${_product.orderModel.lineItems?.length}".tr),
                    textColor: theme.whiteColor,
                    backgroundColor: theme.burgundyColor,
                    child: const Icon(
                      TablerIcons.shopping_cart,
                    ),
                  ):const Icon(
                      TablerIcons.shopping_cart,
                    ), title: "Cart")
              ),
              // PersistentTabConfig(screen: const NotificationView(), item: ItemConfig(
              //     activeColorSecondary: theme.buttonColor,
              //     activeForegroundColor: theme.buttonColor,
              //     icon: Badge(
              //       label: Text("99+".tr),
              //       textColor: theme.whiteColor,
              //       backgroundColor: theme.burgundyColor,
              //       child: const Icon(
              //           TablerIcons.bell,
              //       ),
              //     ), title: "Notifications")
              // ),
              PersistentTabConfig(screen: const AccountView(), item: ItemConfig(
                  // activeColorSecondary: theme.buttonColor,
                  activeForegroundColor: theme.primaryColor,
                  inactiveForegroundColor: theme.textColor.withOpacity(0.5),
                  icon: const Icon(TablerIcons.user_hexagon), title: "Account")
              ),
            ],
            backgroundColor: theme.backgroundColor, // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ), navBarBuilder: (NavBarConfig config) {
              return Style2BottomNavBar(
                navBarConfig: config,
                navBarDecoration: NavBarDecoration(
                  
                  color: theme.cardColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(4.w), topRight: Radius.circular(4.w))
                ),
              );
          },
          );
        }
      );
    });
  }
}