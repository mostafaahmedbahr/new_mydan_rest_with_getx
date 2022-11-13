import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controller/translate_controller.dart';
import '../views/auth/login.dart';
import '../views/auth/register_screen.dart';
import 'custom_list_tile.dart';
class CustomDrawer extends StatefulWidget {
    CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                      radius: 70.sp,
                      child: ClipOval(
                        child: Image.asset("assets/images/logoNav.png",
                          height:60.h,),
                      ),
                    )),
                CustomListTile(
                  selectedDestination: selectedDestination == 0,
                  onTap: () => {
                    setState(() {
                      selectedDestination = 0;
                    }),
                    // Get.to(() => HomeScreen())
                  },
                  text: 'Home'.tr,
                  icon: const Icon(Icons.home),
                ),
                CustomListTile(
                  selectedDestination: selectedDestination == 1,
                  onTap: () => {
                    setState(() {
                      selectedDestination = 1;
                    }),
                    Get.to(() => LoginScreen())
                  },
                  text: 'Login'.tr,
                  icon: const Icon(Icons.login),
                ),
                CustomListTile(
                  selectedDestination: selectedDestination == 2,
                  onTap: () => {
                    setState(() {
                      selectedDestination = 2;
                    }),
                    Get.to(() => RegisterScreen())
                  },
                  text: 'SignUp'.tr,
                  icon: const Icon(Icons.account_box),
                ),
                CustomListTile(
                  selectedDestination: selectedDestination == 3,
                  onTap: () => {
                    setState(() {
                      selectedDestination = 3;
                    }),

                  },
                  text: 'Contact Us'.tr,
                  icon: const Icon(Icons.contact_mail),
                ),
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
          const SizedBox(height: 200,),
        ],
      ),
    );
  }
}
