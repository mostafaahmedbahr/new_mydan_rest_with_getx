import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
 import 'package:get/get.dart';
import 'package:new_mydan_rest_with_getx/controller/app_controller.dart';
 import 'package:new_mydan_rest_with_getx/views/auth/register_screen.dart';

import '../../controller/auth_controller.dart';
import '../../controller/translate_controller.dart';
import '../apartments_page/apartment_page.dart';
import '../auth/login.dart';
import '../auth/profile_screen.dart';
import '../hotels_page/hotels_screen.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedDestination = 0;
  @override
  Widget build(BuildContext context) {
    AppController appController = Get.put(AppController());
    TranslateController translateController = Get.put(TranslateController());
    return SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          body: GetBuilder<AuthController>(
            init: AuthController(),
            builder: (controller)
            {
              return Stack(
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
                  translateController.lang == "EN" ?
                  Positioned(
                    right: 40,
                    top: 10,
                    height: 120,
                    width: 120,
                    child: SvgPicture.asset(
                      "assets/images/logoNav.svg",
                    ),
                  ) :
                  Positioned(
                    left: 40,
                    top: 10,
                    height: 120,
                    width: 120,
                    child: SvgPicture.asset(
                      "assets/images/logoNav.svg",
                    ),
                  ),
                  translateController.lang == "EN" ?
                  Positioned(
                    left: 20,
                    top: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: IconButton(
                        onPressed: () => scaffoldKey.currentState?.openDrawer(),
                        icon: const Icon(Icons.menu),
                      ),
                    ),
                  ) :
                  Positioned(
                    right: 20,
                    top: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: IconButton(
                        onPressed: () => scaffoldKey.currentState?.openDrawer(),
                        icon: const Icon(Icons.menu),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 110,
                      right: 20,
                      left: 20,
                    ),
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.9,
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
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade400,
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  appController.firstScreenListEN()[index].image,
                                ),
                                Expanded(
                                  child: Text(
                                    appController.firstScreenListEN()[index].text.tr,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
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
              );
            },

          ),
          drawer: Drawer(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                          decoration:const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/logo background.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor:const Color(0xffdda256),
                            radius: 70,
                            child: ClipOval(
                              child: Image.asset("assets/images/logoNav.png",
                                height:60,),
                            ),
                          )),
                      ListTile(
                        leading:const Icon(Icons.home),
                        title: Text('Home'.tr),
                        selected: selectedDestination == 0,
                        hoverColor: Colors.yellow,
                        selectedColor:const Color(0xffdda256),
                        onTap: () => {
                          setState(() {
                            selectedDestination = 0;
                          }),
                          // Get.to(() => Authentication())
                        },
                      ),
                      ListTile(
                        leading:const Icon(Icons.person),
                        title: Text('PROFILE'.tr),
                        selected: selectedDestination == 1,
                        hoverColor: Colors.yellow,
                        selectedColor:const Color(0xffdda256),
                        onTap: () => {
                          setState(() {
                            selectedDestination = 1;
                          }),
                          Get.to(() =>   ProfileScreen()),
                        },
                      ),
                      ListTile(
                        leading:const Icon(Icons.contact_mail),
                        title: Text('Contact Us'.tr),
                        selected: selectedDestination == 3,
                        hoverColor: Colors.yellow,
                        selectedColor:const Color(0xffdda256),
                        onTap: () => {
                          setState(() {
                            selectedDestination = 3;
                          }),
                          // Get.to(() => ())
                        },
                      ),
                      ListTile(
                        leading:const Icon(Icons.logout),
                        title: Text('Logout'.tr),
                        selected: selectedDestination == 4,
                        hoverColor: Colors.yellow,
                        selectedColor:const Color(0xffdda256),
                        onTap: () async => {
                          setState(() {
                            selectedDestination = 4;
                          }),
                          // Get.to(() => ())
                              AuthController().userData.remove("userToken"),
                          Get.to(()=>LoginScreen()),
                         },
                      )  ,
                      GetBuilder<TranslateController>(
                        init: TranslateController(),
                        builder: (value)
                        {
                          return ListTile(
                            leading:const Icon(Icons.language),
                            title:  Container(
                              padding:const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black,width: 2),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  dropdownColor: Colors.white,
                                  value: value.lang.value,
                                  icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                                  elevation: 20,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  underline: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffdda256),
                                    ),
                                    height: 1,
                                  ),
                                  items: <String> [
                                    "EN",
                                    "AR",
                                  ].map<DropdownMenuItem<String>>((String newVal)
                                  {
                                    return DropdownMenuItem<String>(
                                      value: newVal,
                                      child: Text(newVal),
                                    );
                                  }).toList(),
                                  onChanged: (String? val)
                                  {
                                    value.lang.value = val!;
                                    Get.updateLocale(Locale(val.toLowerCase()));
                                    // value.setLocal();
                                  },
                                ),
                              ),
                            ),
                            selected: selectedDestination == 5,
                            hoverColor: Colors.yellow,
                            selectedColor:const Color(0xffdda256),
                            onTap: () => {
                              setState(() {
                                selectedDestination = 5;
                              }),
                              // Get.to(() => ())
                            },
                          );
                        },

                      ),

                    ],
                  ),
                ),
                // GetBuilder<AppController>(
                //   init: AppController(),
                //   builder: (value)
                //   {
                //     return ToggleSwitch(
                //       minWidth: 100,
                //       minHeight: 50,
                //       cornerRadius: 20.0,
                //       activeBgColors:const [[Color(0xffdda256)], [Colors.redAccent]],
                //       activeFgColor: Colors.white,
                //       inactiveBgColor: Colors.grey,
                //       inactiveFgColor: Colors.white,
                //       initialLabelIndex: value.lang.value == "EN" ? 0 : 1,
                //       totalSwitches: 2,
                //       labels:const ['EN', 'AR'],
                //       onToggle: (  index) {
                //         print(index);
                //         value.lang.value = index.toString();
                //         print(value.lang.value);
                //         if (index == 0) {
                //           appController.lang("EN");
                //         }
                //         else  if (index == 1){
                //           appController.lang("AR");
                //         }
                //         Get.updateLocale(Locale(index.toString()));
                //        // setState(() {
                //        //   value.lang.value = index!   ;
                //        //   Get.updateLocale(Locale(index.toString()));
                //        // });
                //       },
                //     );
                //   },
                //
                // ),
                const SizedBox(height: 200,),
              ],
            ),
          ),
        )

    );
  }
}
