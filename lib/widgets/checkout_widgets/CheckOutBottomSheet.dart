
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_commerce/app_utils/FontsUtils.dart';
import 'package:smart_commerce/controllers/ThemeController.dart';


class CheckOutBottomsheet extends StatefulWidget {
  CheckOutBottomsheet({
    super.key,
  });

  @override
  State<CheckOutBottomsheet> createState() => _CheckOutBottomsheetState();
}

class _CheckOutBottomsheetState extends State<CheckOutBottomsheet> {
  var utils = FontUtils();

  var searchController = TextEditingController();
 
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        id: "0",
        builder: (theme) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: Get.width,
                  height: 50.h,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 0.w,
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 45.h,
                          width: 45.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: theme.cardColor),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back,
                              color: theme.textColor,
                              size: 20.h,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5, vertical: 12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  constraints: BoxConstraints(
                      minWidth: Get.width,
                      maxWidth: Get.width,
                      minHeight: 0,
                      maxHeight: Get.height * 0.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                               "${"Shipping Address"}",
                              style: utils.boldLabel(theme.textColor),
                            ),
                      
                          ],
                        ),
                      ),
                     
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 0.5.h,
                        color: theme.textColor.withOpacity(0.1),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                
                      // offboardingCntr.employeeDropdownList.data == null
                      //     ? Text("")
                      //     :
                      Expanded(
                          child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                             
                              customContainer(theme,hint: "Select Period",title: "Name",val: "",icon: Icons.calendar_month,ontap: (){
                               
                              } )
                           , SizedBox(
                                height: 5.h,
                              ),
                             
                              customContainer(theme,hint: "Select Progress Stages",title: "Phone No",val: "", )
                           , SizedBox(
                                height: 5.h,
                              ),
                             
                              customContainer(theme,hint: "Enter Phone Number",title: "Address",val: "", )
                         
                           
                            ],
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
             
             
              ],
            ),
          );
        });
  }

   customContainer(ThemeController theme,{String title="",String hint="",String val="",Function? ontap,IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
                                      "$title",
                                      style: utils.xSmall(
                                          theme.textColor.withOpacity(0.3)),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
        GestureDetector(
          onTap: (){
            if(ontap!=null)
            ontap();
          },
          child: Container(
                                          height: 40.h,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            color: theme.grayColor.withOpacity(0.3),
                                          ),
          
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: 10.w),
                                            child: Row(children: [
                                              Expanded(child: val.isEmpty?
                                              
                                              Text("$hint",style: utils.small(theme.textColor.withOpacity(0.3)),):  Text("$val",style: utils.small(theme.textColor),)),
                                            if(icon!=null)  Icon(icon,color: theme.textColor.withOpacity(0.3))
          
                                            ],),
                                          ),
                                        ),
        ),
      ],
    );
  }



}
