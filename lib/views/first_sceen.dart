import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
 import 'package:get/get.dart';
import 'package:new_mydan_rest_with_getx/controller/app_controller.dart';


import '../controller/auth_controller.dart';
import '../controller/translate_controller.dart';
import '../widgets/custom_drawer.dart';
import 'apartments_page/apartment_page.dart';
 import 'cars_page/cars_screen.dart';
import 'factories_page/factories_page.dart';
import 'hotels_page/hotels_screen.dart';
import 'lands_page/lands_screen.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedDestination = 0;
  @override
  Widget build(BuildContext context) {
    AppController appController = Get.put(AppController());
    TranslateController translateController = Get.put(TranslateController());
    return SafeArea(
      child: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller)
        {
          return   Scaffold(
            key: scaffoldKey,
            body: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/website background.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 170.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/homeUp.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                translateController.lang == "EN" ?
                Positioned(
                  left: 70.r,
                  top: 100.r,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/user.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ) :
                Positioned(
                  right: 70.r,
                  top: 100.r,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/user.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                translateController.lang == "EN" ?
                Positioned(
                  right: 40.r,
                  top: 20.r,
                  height: 120.h,
                  width: 120.w,
                  child: SvgPicture.asset(
                    "assets/images/logoNav.svg",
                  ),
                ) :
                Positioned(
                  left: 40.r,
                  top: 20.r,
                  height: 120.h,
                  width: 120.w,
                  child: SvgPicture.asset(
                    "assets/images/logoNav.svg",
                  ),
                ),
                translateController.lang == "EN" ?
                Positioned(
                  left: 20.r,
                  top: 50.r,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: IconButton(
                      onPressed: () => scaffoldKey.currentState?.openDrawer(),
                      icon: const Icon(Icons.menu),
                    ),
                  ),
                ) :
                Positioned(
                  right: 20.r,
                  top: 50.r,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: IconButton(
                      onPressed: () => scaffoldKey.currentState?.openDrawer(),
                      icon: const Icon(Icons.menu),
                    ),
                  ),
                ),
                Padding(
                  padding:   EdgeInsets.only(
                    top: 220.r,
                    right: 20.r,
                    left: 20.r,
                  ),
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: appController.firstScreenListEN().length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async{
                          if (index == 0) {
                            Get.to(()=>ApartMentScreen());
                          }
                          if (index == 1) {
                            Get.to(()=>HotelsScreen());
                          }
                          if (index == 2) {
                            Get.to(()=>CarsScreen());
                          }
                          if (index == 3) {
                            // Get.to(()=>Screen2());
                          }
                          if (index == 4) {
                            Get.to(()=>FactoriesScreen());
                          }
                          if (index == 5) {
                            Get.to(()=>LandsScreen());
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade400,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child:  Image.asset(
                                  appController.firstScreenListEN()[index].image,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  appController.firstScreenListEN()[index].text.tr,
                                  style:   TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

              ],
            ),
            drawer:CustomDrawer(),
          );
        },


        ),
      );

  }
}
