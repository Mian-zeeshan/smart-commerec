import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:popup_menu_plus/popup_menu_plus.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/app_utils/Utils.dart';
import 'package:smart_commerce/controllers/ProductController.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';
import 'package:smart_commerce/pages/profile_page/ProfilePage.dart';
import 'package:smart_commerce/pages/settings_page/SettingsPage.dart';
import 'package:smart_commerce/widgets/lobby_widgets/ProductsGridView.dart';
import 'package:smart_commerce/widgets/lobby_widgets/PromotionalBanners.dart';
import 'package:smart_commerce/widgets/lobby_widgets/SectionHeaderDelegate.dart';
import 'package:smart_commerce/widgets/lobby_widgets/SectionHeaderNoDataDelegate.dart';

class LobbyView extends StatefulWidget {
  PersistentTabController controller;
   LobbyView(this.controller ,{super.key});

  @override
  LobbyViewState createState() => LobbyViewState();
}

class LobbyViewState extends State<LobbyView> {
  // CarouselController carouselController = CarouselController();
  // CarouselController carouselController =CarouselController();
  //  CarouselController buttonCarouselController = CarouselController();
  FontUtils fontUtils = FontUtils();
  Utils utils = Utils();
  TextEditingController searchCntr = TextEditingController();
  var page = 1;
  ProductController _productController = Get.find();
  ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  //** Menu
  PopupMenu? menu;
  GlobalKey profileKey = GlobalKey();
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_focusNode.hasFocus) {
        _focusNode.unfocus();
      }
      _productController = Get.find();
      print(_scrollController.position.pixels);
      print(_scrollController.position.maxScrollExtent);
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        if (!_productController.isLoading) {
          page++;
          _productController.getProducts(mounted: true, page: page);
        }
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (theme) {
      return GetBuilder<ProductController>(
          id: "0",
          builder: (_products) {
            return Scaffold(
              appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: AppBar(
                    backgroundColor: theme.primaryColor,
                  )),
              backgroundColor: theme.backgroundColor,
              body: SafeArea(
                child: SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          color: theme.whiteColor,
                          backgroundColor: theme.primaryColor,
                          onRefresh: () {
                            setState(() {
                              page = 1;
                            });
                            _products.updateValOfCategory("");
                            theme.updateSelectedIndex(-2);
                            _products.getProducts(mounted: true, page: 1);

                            return Future.delayed(const Duration(seconds: 1));
                          },
                          child: CustomScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            controller: _scrollController,
                            scrollDirection: Axis.vertical,
                            slivers: [
                              SliverAppBar(
                                shadowColor: theme.textColor.withOpacity(0.6),
                                  expandedHeight: 130.h,
                                  floating: false,
                                  // elevation: 20.h,
                                  leading:  IconButton(
                                      onPressed: (){
                                      widget.controller.jumpToTab(2);
                                        // Get.toNamed(ordersRoute);
                                      },
                                      icon: Icon(TablerIcons.menu_4, color: theme.primaryColor, size: 22.w)
                                    ),
                                  // leading: IconButton(
                                  //     key: profileKey,
                                  //     onPressed: () => listMenu(theme),
                                  //     icon: Container(
                                  //         width: 40.w,
                                  //         height: 40.w,
                                  //         decoration: BoxDecoration(
                                  //             shape: BoxShape.circle,
                                  //             color: theme.whiteColor),
                                  //         padding: EdgeInsets.all(1.w),
                                  //         child: Center(
                                  //           child: Container(
                                  //             width: 40.w,
                                  //             height: 40.w,
                                  //             decoration: BoxDecoration(
                                  //                 shape: BoxShape.circle,
                                  //                 color: theme.cardColor),
                                  //             child: Image.asset(
                                  //               "assets/images/logo/almumtaz-electronics.png"
                                  //               // "assets/images/avatars/1.png",
                                  //             ),
                                  //           ),
                                  //         ))),
                                  titleSpacing: 0,
                                  surfaceTintColor: theme.cardColor,
                                  pinned: true,
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                   
                                     Image.asset("assets/images/logo/almumtaz-electronics.png",height: 40.h,),
                                      
                                    ],
                                  ),
                                  actions: [ 
                                    
                                  if(GetPlatform.isAndroid)   IconButton(
                                      onPressed: (){
                                          Get.to(() => const ProfilePage());
                                        // Get.toNamed(ordersRoute);
                                      },
                                      icon: Icon(Icons.person_outline, color: theme.primaryColor, size: 22.w)
                                    ),

                                    if(GetPlatform.isIOS)SizedBox(height: 22.h,width: 22.h,)
                                    // IconButton(
                                    //   onPressed: (){
                                    //     // Get.toNamed(ordersRoute);
                                    //   },
                                    //   icon: Column(
                                    //     mainAxisAlignment: MainAxisAlignment.start,
                                    //     crossAxisAlignment: CrossAxisAlignment.center,
                                    //     children: [
                                    //       Icon(TablerIcons.shopping_bag, color: theme.primaryColor, size: 22.w),
                                    //       Text("Orders".tr, style: fontUtils.xSmall(theme.whiteColor),)
                                    //     ],
                                    //   )
                                    // ),

                                    // IconButton(
                                    //   onPressed: (){},
                                    //   icon: Column(
                                    //     mainAxisAlignment: MainAxisAlignment.start,
                                    //     crossAxisAlignment: CrossAxisAlignment.center,
                                    //     children: [
                                    //       Icon(TablerIcons.coins, color: theme.whiteColor, size: 22.w),
                                    //       Text("Coins".tr, style: fontUtils.xSmall(theme.whiteColor),)
                                    //     ],
                                    //   )
                                    // ),
                                  ],
                                  backgroundColor: theme.cardColor,
                                  // flexibleSpace: _products.listBanners.length >
                                  //         0
                                  //     ? FlexibleSpaceBar(
                                  //         centerTitle: true,
                                  //         titlePadding: EdgeInsets.zero,
                                  //         background: Padding(
                                  //           padding: EdgeInsets.only(top: 50.h),
                                  //           child: Container(
                                  //             width: Get.width,
                                  //             // height: 300.h,
                                  //             color: theme.backgroundColor,
                                  //             child: Stack(
                                  //               children: [
                                  //                 Container(
                                  //                   // color: theme.blackColor,
                                  //                   width: Get.width,
                                  //                   height: 130.h,

                                  //                   child: FlutterCarousel(
                                  //                     options: CarouselOptions(
                                  //                       // controller: carouselController,
                                  //                       onPageChanged:
                                  //                           (page, reason) {},
                                  //                       autoPlay: true,
                                  //                       autoPlayAnimationDuration:
                                  //                           const Duration(
                                  //                               seconds: 1),
                                  //                       autoPlayInterval:
                                  //                           const Duration(
                                  //                               seconds: 3),
                                  //                       // viewportFraction: 16/9,
                                  //                       height: Get.height,
                                  //                       showIndicator: false,

                                  //                       slideIndicator:
                                  //                           CircularSlideIndicator(
                                  //                         slideIndicatorOptions:
                                  //                             SlideIndicatorOptions(
                                  //                                 indicatorBackgroundColor: theme
                                  //                                     .buttonColor
                                  //                                     .withOpacity(
                                  //                                         0.5),
                                  //                                 currentIndicatorColor:
                                  //                                     theme
                                  //                                         .buttonColor),
                                  //                       ),
                                  //                     ),
                                  //                     items: _products
                                  //                         .listBanners
                                  //                         .map((i) {
                                  //                       return Builder(
                                  //                         builder: (BuildContext
                                  //                             context) {
                                  //                           return Container(
                                  //                             width: Get.width,
                                  //                             height:
                                  //                                 Get.height,
                                  //                             clipBehavior: Clip
                                  //                                 .antiAliasWithSaveLayer,
                                  //                             decoration: const BoxDecoration(
                                  //                                 // borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),bottomRight: Radius.circular(10)),

                                  //                                 // color: theme.cardColor
                                  //                                 ),
                                  //                             // foregroundDecoration: BoxDecoration(
                                  //                             //     color: theme.primaryColor.withOpacity(0.1)
                                  //                             // ),
                                  //                             child:
                                  //                                 CachedNetworkImage(
                                  //                               imageUrl: (i
                                  //                                               .mediaDetails !=
                                  //                                           null &&
                                  //                                       i.mediaDetails?.sizes !=
                                  //                                           null &&
                                  //                                       i.mediaDetails?.sizes?.large !=
                                  //                                           null)
                                  //                                   ? i
                                  //                                           .mediaDetails
                                  //                                           ?.sizes
                                  //                                           ?.large
                                  //                                           ?.sourceUrl ??
                                  //                                       ""
                                  //                                   : "",
                                  //                               // imageUrl:( i.mediaDetails!.sizes!.large!.sourceUrl??""),
                                  //                               fit:
                                  //                                   BoxFit.fill,
                                  //                               placeholder: (_,
                                  //                                       __) =>
                                  //                                   SpinKitDancingSquare(
                                  //                                 color: theme
                                  //                                     .primaryColor,
                                  //                               ),
                                  //                               errorWidget: (_,
                                  //                                       __,
                                  //                                       ___) =>
                                  //                                  Image.network( _products.listBanners[0].mediaDetails?.sizes?.large?.sourceUrl??"", fit:
                                  //                                   BoxFit.fill,)
                                  //                             ),

                                  //                             //  Image.asset("assets/images/banners/$i", fit: BoxFit.cover,)
                                  //                           );
                                  //                         },
                                  //                       );
                                  //                     }).toList(),
                                  //                   ),
                                  //                 ),

                                  //                 // Positioned(
                                  //                 //   bottom: 0,
                                  //                 //     child: SizedBox(
                                  //                 //       width: Get.width,
                                  //                 //       child: Container(
                                  //                 //         width: Get.width,
                                  //                 //         margin: EdgeInsets.only(right: (Get.width * 0.2)),
                                  //                 //         padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                                  //                 //         decoration: BoxDecoration(
                                  //                 //             borderRadius: BorderRadius.only(topRight: Radius.circular(50.w), bottomRight: Radius.circular(50.w)),
                                  //                 //             color: theme.buttonColor,
                                  //                 //             boxShadow: [
                                  //                 //               BoxShadow(
                                  //                 //                   spreadRadius: 3,
                                  //                 //                   blurRadius: 10,
                                  //                 //                   color: theme.textColor.withOpacity(0.2)
                                  //                 //               )
                                  //                 //             ]
                                  //                 //         ),
                                  //                 //         child: Row(
                                  //                 //           mainAxisAlignment: MainAxisAlignment.start,
                                  //                 //           crossAxisAlignment: CrossAxisAlignment.center,
                                  //                 //           children: [
                                  //                 //             Icon(TablerIcons.map_pin_filled, size: 16.w, color: theme.primaryColor,),
                                  //                 //             SizedBox(width: 4.w,),
                                  //                 //             Expanded(child: Text("|  2nd Floor Plaza # 167, Sector C Sector CC1 DHA Phase 6, Lahore".tr, maxLines: 1, overflow: TextOverflow.ellipsis, style: fontUtils.label(theme.whiteColor),))
                                  //                 //           ],
                                  //                 //         ),
                                  //                 //       )
                                  //                 // ))
                                  //               ],
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       )
                                  //     : const SizedBox.shrink()
                                      
                                      flexibleSpace: FlexibleSpaceBar(
                                        background: Container(
                                         
                                          child: Column(
                                            children: [
                                              SizedBox(height: 50.h,),
                                                 Container(
                                                   color: theme.primaryColor.withOpacity(0.1),
                                                   height: 70.h,
                                                   child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                     children: [
                                                       Padding(
                                                         padding:  EdgeInsets.symmetric(horizontal: 20.w),
                                                         child: Container(
                                                          height: 40.h,
                                                           width: Get.width,
                                                           padding: EdgeInsets.only(
                                                               left: 6.w,
                                                               right: 2.w,
                                                               top: 6.h,
                                                               bottom: 6.h),
                                                           decoration: BoxDecoration(
                                                               color: theme.cardColor,
                                                               borderRadius:
                                                                   BorderRadius.circular(60),
                                                             ),
                                                           child: Row(
                                                             mainAxisAlignment:
                                                                 MainAxisAlignment.start,
                                                             crossAxisAlignment:
                                                                 CrossAxisAlignment.center,
                                                             children: [
                                                              SizedBox(width: 10.w,),
                                                               Icon(
                                                                 TablerIcons.search,
                                                                 size: 16.w,
                                                                 color: theme.textColor
                                                                     .withOpacity(0.5),
                                                               ),
                                                               SizedBox(
                                                                 width: 6.w,
                                                               ),
                                                               Expanded(
                                                                 child: TextFormField(
                                                                   focusNode: _focusNode,
                                                                   controller: searchCntr,
                                                                   onChanged: (e) {
                                                                     setState(() {
                                                                       page = 1;
                                                                       _products.getProducts(
                                                                           mounted: true,
                                                                           page: page,
                                                                           pageSize: 20,
                                                                           search: searchCntr
                                                                               .text
                                                                               .toLowerCase()
                                                                               .toString());
                                                                     });
                                                                   },
                                                                   keyboardType:
                                                                       TextInputType.text,
                                                                   style: fontUtils
                                                                       .label(theme.textColor),
                                                                   decoration:
                                                                       InputDecoration.collapsed(
                                                                           hintText:
                                                                               "Search...".tr),
                                                                 ),
                                                               ),
                                                              
                                                              Container(
                                                                child: Center(child: Icon(TablerIcons.search,color: theme.whiteColor,),),
                                                                height: 50.h,width: 50.h,decoration: BoxDecoration(color: theme.primaryColor,shape: BoxShape.circle),),
                                                              
                                                             ],
                                                           ),
                                                         ),
                                                       ),
                                                     ],
                                                   ),
                                                 ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      
                                      ),

                              SliverToBoxAdapter(
                                child: Container(
                                  color: theme.backgroundColor,
                                  child:  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 10.h,),
                                      const PromotionalBanners(),
                                      // SizedBox(height: 20.h,),
                                      // const CategoriesView(),
                                      // SizedBox(height: 20.h,),
                                      // const HotProductsView(),
                                      // SizedBox(height: 20.h,),
                                      // const HotCategoriesView(),
                                      // SizedBox(height: 20.h,),
                                      // const FlashSaleView(),
                                      // SizedBox(height: 10.h,)
                                    ],
                                  ),
                                ),
                              ),

                              SliverPersistentHeader(
                                delegate: SectionHeaderDelegate(
                                    "Section B", page, () {
                                  setState(() {
                                    page = 1;
                                  });
                                }, 40.h),
                                pinned: true,
                              ),
                              if ((_products.productsList.length < 1) ||
                                  (_products.isLoading && page == 1))
                                SliverPersistentHeader(
                                  delegate: SectionHeaderNoDat(
                                    "Section c",
                                    _products.isLoading,
                                    100.h,
                                  ),
                                  pinned: false,
                                ),
                              if (!_products.isLoading || page > 1)
                                SliverGrid(
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: Get.width / 2,
                                    mainAxisExtent: 210.h,
                                    crossAxisSpacing: 5.w,
                                    childAspectRatio: 1 / 2,
                                  ),
                                  delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                      // If filtered products exist, display them
                                      if (_products.productsList.isNotEmpty) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: index % 2 == 0 ? 10.w : 0,
                                              right: index % 2 == 1 ? 10.w : 0),
                                          child: ProductsGridView(
                                              index: index,
                                              item: _products
                                                  .productsList[index]),
                                        );
                                      } else {
                                        // Return an empty container to avoid any space when no products match
                                        return Center(
                                            child: _products.isLoading
                                                ? SpinKitDancingSquare(
                                                    color: theme.primaryColor,
                                                  )
                                                : const Text(
                                                    "No products found"));
                                      }
                                    },
                                    childCount:
                                        _products.productsList.isNotEmpty
                                            ? _products.productsList.length
                                            : 2,
                                  ),
                                ),

                              //   SliverPersistentHeader(
                              //   delegate: SectionHeaderDelegate("Section B", 40.h),
                              //   pinned: false,
                              // ),
                              // Container(height: 1000.h,width: Get.width,color: theme.redColor,)
                            ],
                          ),
                        ),
                      ),

                      if (_products.isLoading && page > 1)
                        SizedBox(
                          height: 10.h,
                        ),
                      if (_products.isLoading && page > 1)
                        SpinKitFadingCircle(
                          color: theme.primaryColor,
                          size: 25.w,
                        ),
                      //            SpinKitDancingSquare(
                      //   color: theme.primaryColor,
                      // ),

                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }

  void listMenu(ThemeController theme) {
    PopupMenu menu = PopupMenu(
      onClickMenu: (menuProvider) {
        if (menuProvider.menuTitle == "Settings") {
          Get.to(() => const SettingsPage());
        } else if (menuProvider.menuTitle == "Profile") {
          Get.to(() => const ProfilePage());
        }
      },
      context: context,
      config: MenuConfig.forList(
          itemHeight: 30.h,
          arrowHeight: 0,
          lineColor: theme.buttonColor,
          highlightColor: theme.buttonColor,
          borderRadius: BorderRadius.circular(8.w),
          border: BorderConfig(width: 0, color: theme.transparentColor)),
      items: [
        PopUpMenuItem.forList(
            title: 'Profile',
            textStyle: fontUtils.boldLabel(theme.buttonColor),
            image:
                Icon(TablerIcons.user, color: theme.buttonColor, size: 14.w)),
        PopUpMenuItem.forList(
            title: 'Settings',
            textStyle: fontUtils.boldLabel(theme.buttonColor),
            image: Icon(TablerIcons.settings_2,
                color: theme.buttonColor, size: 14.w)),
        PopUpMenuItem.forList(
            title: 'Logout',
            textStyle: fontUtils.boldLabel(theme.buttonColor),
            image: Icon(TablerIcons.logout_2,
                color: theme.buttonColor, size: 14.w)),
      ],
    );
    menu.show(widgetKey: profileKey);
  }
}
