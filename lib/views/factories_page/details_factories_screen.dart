import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_mydan_rest_with_getx/views/auth/login.dart';

import '../../controller/app_controller.dart';
import '../../controller/auth_controller.dart';
import '../../controller/translate_controller.dart';

import '../home/reverce_screen.dart';

class DetailsFactoriesPage extends StatelessWidget {
  DetailsFactoriesPage({
    Key? key,
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.ownerLastName,
    required this.ownerFirstName,
    required this.price,
    required this.deposit,
    required this.insurance,
    required this.area,
    required this.subCategoryName,
    required this.subCategoryNameAr,
    required this.typeEn,
    required this.typeAr,
    required this.ownerAvatar,
    required this.properties,
    required this.amenities,

    // required this.bedRoomsNumber,
    //   required this.country,
    //   required this.city,
    //   required this.ownerFirstName,
    //   required this.ownerLastName,
  }) : super(key: key);
  int? id;
  String? image;
  String? title;
  String? description;
  String? ownerFirstName;
  String? ownerLastName;
  int?price;
  int?deposit;
  int?insurance;
  int?area;
  String? subCategoryName;
  String? subCategoryNameAr;
  String? typeEn;
  String? typeAr;
  String?ownerAvatar;
  List? properties;
  List? amenities;





  // int?bedRoomsNumber;

// String? country;
// String? city;
//     dynamic price;
// dynamic review;

  @override
  Widget build(BuildContext context) {
    AppController appController = Get.find();
    // AppController appController = Get.put(AppController())..getAllApartmentsCategories();
    TranslateController translateController = Get.put(TranslateController());
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Image(
                  image: NetworkImage(
                      "http://laravel.meydanrest.com/assets/factories/$image"),
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                translateController.lang == "EN"
                    ? Positioned(
                  top: 40,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_outlined),
                    color: Colors.white,
                  ),
                )
                    : Positioned(
                  top: 40,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.yellowAccent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: translateController.lang == "EN" ?  Text("$typeEn") :  Text("$typeAr"),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 170,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                    ),
                    child: Text(
                      "${appController.apartModel?.offers![0].title}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 220,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                      ),
                      child: Wrap(
                        spacing: 180,
                        // to apply margin in the main axis of the wrap
                        runSpacing: 50,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                'fdgfdg',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.yellowAccent,
                                size: 20,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              FittedBox(
                                child: Text(
                                  "3.5 Reviews",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),

              ],
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    physics:const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network("http://laravel.meydanrest.com/assets/$ownerAvatar",width: 50,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(ownerFirstName.toString(),
                                  style:const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),),
                                Text(ownerLastName.toString(),
                                  style:    const TextStyle(
                                    fontSize: 20,
                                  ),),
                              ],
                            ),
                            const CircleAvatar(
                              backgroundColor:Color(0xffdda256),
                              child: Icon(
                                Icons.phone,
                                color: Colors.yellowAccent,
                              ),
                            ),
                            const CircleAvatar(
                              backgroundColor:Color(0xffdda256),
                              child: Icon(
                                Icons.message,
                                color: Colors.yellowAccent,
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Icon(Icons.price_change_outlined,size: 40,color:  Color(0xffdda256),),
                                const Text("price",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                Text("$price",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),),
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(Icons.price_check_outlined,size: 40,color:  Color(0xffdda256),),
                                const Text("Deposit",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                Text("${deposit}",
                                  style:const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),),
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(Icons.price_change_outlined,size: 40,color:  Color(0xffdda256),),
                                const Text("Insurance",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                Text("$insurance",
                                  style:const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Icon(Icons.area_chart_outlined,size: 40,color:  Color(0xffdda256),),
                                const Text("Area",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                Text("$area",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),),
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(Icons.type_specimen,size: 40,color:  Color(0xffdda256),),
                                const Text("Property Type",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                translateController.lang == "EN" ?   Text("${subCategoryName}",
                                  style:const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),) : Text("$subCategoryNameAr",
                                  style:const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),),
                              ],
                            ),

                          ],
                        ),
                        const SizedBox(height: 20,),
                        properties!.isNotEmpty ?  SizedBox(
                          height: 100,
                          child: ListView.separated(
                            physics:const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index)
                            {
                              return Container(
                                height: 100,
                                width: 110,
                                color:  const Color(0xffdda256),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(appController.iconList[index].icon,size: 40,color: Colors.white,),
                                        Text("${properties?[index].value ?? 0}",
                                          style:const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                      ],
                                    ),
                                    // Image.network("http://laravel.meydanrest.com/assets/${appController.l[index].icon}"),
                                    translateController.lang == "EN" ?
                                    Text("${properties?[index].propertiesName}",
                                      style:const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),) :
                                    Text("${properties?[index].propertiesNameAr}",
                                      style:const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),),


                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context,index)
                            {
                              return const SizedBox(width: 20,);
                            },
                            itemCount:properties!.length,
                          ),
                        ) : Container(),
                        const SizedBox(height: 20,),
                        const Text("Description",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),),
                        const SizedBox(height: 10,)  ,
                        Text(description.toString(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style:const TextStyle(
                              fontSize: 20,
                              color: Colors.grey
                          ),),
                        const SizedBox(height: 20,),
                        const Text("Amenities",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),),
                        const SizedBox(height: 10,),
                        amenities!.isNotEmpty ? SizedBox(
                          height: 100,
                          child: ListView.separated(
                            physics:const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index)
                            {
                              return Container(
                                height: 100,
                                width: 110,
                                color:  const Color(0xffdda256),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(appController.iconList[index].icon,size: 40,color: Colors.white,),
                                        Text("${amenities?[index].approval ?? 0}",
                                          style:const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                      ],
                                    ),
                                    // Image.network("http://laravel.meydanrest.com/assets/${appController.l[index].icon}"),
                                    translateController.lang == "EN" ?
                                    Text("${amenities?[index].amenitiesName}",
                                      style:const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),) :
                                    Text("${amenities?[index].amenitiesNameAr}",
                                      style:const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),),


                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context,index)
                            {
                              return const SizedBox(width: 20,);
                            },
                            itemCount:amenities!.length,
                          ),
                        ) : Container() ,
                        const SizedBox(height: 10,),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xffdda256),
                            ),
                            onPressed: (){
                              AuthController().userData.read("userToken")==null ?
                              Get.to(()=>LoginScreen()) :
                              Get.to(()=>const ReverceSvreen());
                            },
                            child: Text("Reserve".tr,style:const TextStyle(
                              fontSize: 25,
                            ),),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
