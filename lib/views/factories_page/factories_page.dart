import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/app_controller.dart';
import '../../controller/auth_controller.dart';
import '../../controller/translate_controller.dart';
import '../auth/login.dart';
import '../auth/profile_screen.dart';
import '../auth/register_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'details_factories_screen.dart';

 class FactoriesScreen extends StatefulWidget {
  const FactoriesScreen({Key? key}) : super(key: key);

  @override
  State<FactoriesScreen> createState() => _FactoriesScreenState();
}

class _FactoriesScreenState extends State<FactoriesScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedDestination = 0;

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    AppController appController = Get.put(AppController())..getAllEstablishmentsCategories();
    TranslateController translateController = Get.put(TranslateController());
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
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
                    AuthController().userData.read("userToken")==null ?
                    ListTile(
                      leading:const Icon(Icons.login),
                      title: Text('Login'.tr),
                      selected: selectedDestination == 1,
                      hoverColor: Colors.yellow,
                      selectedColor:const Color(0xffdda256),
                      onTap: () => {
                        setState(() {
                          selectedDestination = 1;
                        }),
                        Get.to(() =>   LoginScreen()),
                      },
                    ) :
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
                      leading:const Icon(Icons.account_box),
                      title: Text('SignUp'.tr),
                      selected: selectedDestination == 2,
                      hoverColor: Colors.yellow,
                      selectedColor:const Color(0xffdda256),
                      onTap: () => {
                        setState(() {
                          selectedDestination = 2;
                        }),
                        Get.to(() =>   RegisterScreen()),
                        // Get.to(() => Register())
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
                    AuthController().userData.read("userToken")!=null ?
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
                        await  AuthController().userData.remove("userToken"),
                        Get.to(()=>LoginScreen()),
                      },
                    ) : Container(),
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
        body: GetBuilder<AppController>(
          init: AppController(),
          builder: (c)
          {
            return Stack(
              children: [
                translateController.lang == "EN" ?
                Positioned(
                  left: 15,
                  top: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: IconButton(
                      onPressed: () => scaffoldKey.currentState?.openDrawer(),
                      icon: const Icon(Icons.menu),
                    ),
                  ),
                ) :
                Positioned(
                  right: 15,
                  top: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: IconButton(
                      onPressed: () => scaffoldKey.currentState?.openDrawer(),
                      icon: const Icon(Icons.menu),
                    ),
                  ),
                ),
                translateController.lang == "EN" ?
                Positioned(
                  left: 40,
                  top: 20,
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.shade400,
                            ),
                            width: 200,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: InkWell(

                                      onTap: (){
                                        print("dfgfd");
                                      },
                                      child: Icon(Icons.search,color: Colors.white,)),
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  )
                              ),
                            )),
                        Image.asset("assets/images/bestOffersEn.png",
                            width: 130),
                      ],
                    ),
                  ),) :
                Positioned(
                  right: 40,
                  top: 20,
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.shade400,
                            ),
                            width: 200,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: InkWell(
                                      onTap: (){
                                        print("dfgfd");
                                      },
                                      child: const Icon(Icons.search,color: Colors.white,)),
                                  hintText: "Search".tr,
                                  hintStyle:const TextStyle(
                                    color: Colors.white,
                                  )
                              ),
                            )),
                        translateController.lang == "EN" ?
                        Image.asset("assets/images/bestOffersEn.png",
                            width: 130) :
                        Image.asset("assets/images/bestOffersAr.png",
                            width: 130),
                      ],
                    ),
                  ),),
                translateController.lang == "EN" ?
                Positioned(
                  top: 80,
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Row(
                      children: [
                        Text("Establishments".tr,
                          style:  TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                          ),),
                        Padding(padding: EdgeInsets.only(left: 28.r),child: Image.asset("assets/images/filterEn.png",
                          width: 80.w,),),
                      ],
                    ),
                  ),) :
                Positioned(
                  top: 80,
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Row(
                      children: [
                        Text("Establishments".tr,
                          style:  TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                          ),),
                        Padding(
                          padding:  translateController.lang == "EN" ? EdgeInsets.only(right: 55) : EdgeInsets.only(right: 130),
                          child: translateController.lang == "EN" ?
                          Image.asset("assets/images/filterEn.png", width: 80.w,) :
                          Image.asset("assets/images/filterAr.png", width: 80.w,)
                          ,),
                      ],
                    ),
                  ),),
                /////
                appController.isGetDataLoading == true  ?const  Center(child: CircularProgressIndicator(
                  color:  Color(0xffdda256),
                )) :  Padding(
                  padding: const EdgeInsets.only(
                    top: 140,
                    right: 20,
                    left: 20,
                  ),
                  child: ListView.builder(
                      physics:const BouncingScrollPhysics(),
                      itemCount: appController.establishmentsModel?.offers?.length,
                      itemBuilder: (context,index){
                        var l = appController.establishmentsModel?.offers![index].properties?.length.toInt() ?? 0;
                        return InkWell(
                          onTap: ()
                          {
                            Get.to(()=>DetailsFactoriesPage(
                              id:  appController.establishmentsModel?.offers![index].id,
                              image:  appController.establishmentsModel?.offers![index].thumbnail,
                              properties:  appController.establishmentsModel?.offers![index].properties?.toList(),
                              amenities:  appController.establishmentsModel?.offers![index].amenities?.toList(),
                              title:  appController.establishmentsModel?.offers![index].title,
                              description:  appController.establishmentsModel?.offers![index].description,
                              // city:  appController.apartModel?.offers![index].cityEn,
                              // country:  appController.apartModel?.offers![index].countryEn,
                              ownerFirstName:  appController.establishmentsModel?.offers![index].ownerFirstName,
                              ownerLastName:  appController.establishmentsModel?.offers![index].ownerLastNam,
                              price:  appController.establishmentsModel?.offers![index].price,
                              deposit:  appController.establishmentsModel?.offers![index].deposit,
                              insurance:  appController.establishmentsModel?.offers![index].insurance,
                              area:  appController.establishmentsModel?.offers![index].area,
                              subCategoryName:  appController.establishmentsModel?.offers![index].subCategoryName,
                              subCategoryNameAr:  appController.establishmentsModel?.offers![index].subCategoryNameAr,
                              typeEn:  appController.establishmentsModel?.offers![index].typeEn,
                              typeAr:  appController.establishmentsModel?.offers![index].typeAr,
                              ownerAvatar:  appController.establishmentsModel?.offers![index].ownerAvatar,
                              // bedRoomsNumber: appController.apartModel?.offers![index].properties![index].value,
                              // price:  appController.apartModel?.offers![index].price,
                              // review:  appController.apartModel?.offers![index].review,
                            ));
                          },
                          child: Card(
                            clipBehavior: Clip.antiAlias ,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:  Stack(
                              children: [
                                Ink.image(
                                  image:  NetworkImage("http://laravel.meydanrest.com/assets/factories/${appController.establishmentsModel?.offers![index].thumbnail}"),
                                  height: MediaQuery.of(context).size.height*0.25,
                                  fit: BoxFit.cover,)  ,
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.25,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(padding:const EdgeInsets.all(20),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Colors.yellowAccent,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child:translateController.lang == "EN" ?
                                            Text("${appController.establishmentsModel?.offers![index].typeEn}") :
                                            Text("${appController.establishmentsModel?.offers![index].typeAr}"),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("${appController.establishmentsModel?.offers![index].title}",
                                                    style:const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white,
                                                    ),),
                                                  Row(
                                                    children:  [
                                                      const Icon(Icons.location_on,color: Colors.white,size: 20,),
                                                      const  SizedBox(width: 3,),
                                                      Text('${appController.establishmentsModel?.offers![index].countryEn}',
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                        ),),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("EGP ${appController.establishmentsModel?.offers![index].price}",
                                                    style:const TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Colors.white
                                                    ),),
                                                  Row(
                                                    children: [
                                                      const  Icon(Icons.star,
                                                        color: Colors.yellowAccent,
                                                        size: 20,),
                                                      const   SizedBox(height: 3,),
                                                      FittedBox(
                                                        child: Text("${appController.establishmentsModel?.offers![index].review} Reviews" ,
                                                          overflow: TextOverflow.ellipsis,
                                                          maxLines: 1,
                                                          style:const TextStyle(
                                                            color: Colors.black,
                                                          ),),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        );
                      }),
                ) ,
              ],

            );
          },

        ),
      ),
    );
  }
}
