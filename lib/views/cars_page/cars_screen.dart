import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:new_mydan_rest_with_getx/controller/app_controller.dart';

import '../../controller/translate_controller.dart';
class CarsScreen extends StatefulWidget {
    CarsScreen({Key? key}) : super(key: key);

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {

  @override
  Widget build(BuildContext context) {
    AppController appController = Get.put(AppController())..getAllCarsCategories() ;
    TranslateController translateController = Get.put(TranslateController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration:const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/website background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Expanded(child:  ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       primary: const Color(0xffdda256),
                     ),
                     onPressed: (){
                       setState(() {
                         appController.type = "3";
                       });
                     },
                     child:  Text("With Driver",
                       style: TextStyle(
                         fontSize: 18.sp,
                       ),),
                   ),),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffdda256),
                        ),
                        onPressed: (){
                          setState(() {
                            appController.type = "2";
                          });
                        },
                        child:  Text("WithOut Driver",
                        style: TextStyle(
                          fontSize: 18.sp,
                        ),),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                GetBuilder<AppController>(
                  init: AppController(),
                  builder: (c)
                  {
                    return  appController.isGetDataLoading == true  ?
                    const  Center(child: CircularProgressIndicator(
                      color:  Color(0xffdda256),
                    )) :
                    Expanded(
                      child: ListView.separated(
                        physics:const BouncingScrollPhysics(),
                        itemBuilder: (context,index)
                        {
                          return Card(
                            clipBehavior: Clip.antiAlias ,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:  Stack(
                              children: [
                                Ink.image(
                                  image:  NetworkImage("http://laravel.meydanrest.com/assets/cars/${c.carsList[index]["img"]}"),
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
                                            color: const Color(0xffdda256),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child:translateController.lang == "EN" ?
                                            Text("${c.carsList[index]["brandEn"]}",
                                            style:const TextStyle(
                                              color: Colors.white,
                                            ),) :
                                            Text("${c.carsList[index]["brandAr"]}",
                                              style:const TextStyle(
                                                color: Colors.white,
                                              ),),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("${c.carsList[index]["plateNumber"]}",
                                                    style:const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white,
                                                    ),),
                                                  const  SizedBox(height: 10,),
                                                  Text('${c.carsList[index]["nameEn"]}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    ),),
                                                  const  SizedBox(height: 10,),

                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                               const   Text("EGP 25000",
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style:  TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white,
                                                    ),),
                                                  const  SizedBox(height: 10,),
                                                  Text('${c.carsList[index]["description"]}',
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    ),),
                                                  const  SizedBox(height: 10,),

                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context,index)
                        {
                          return const SizedBox(height: 10,);
                        },
                        itemCount: c.carsList.length,
                      ),
                    );
                  },

                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xffdda256),
          onPressed: ()
          {
            setState(() {
              appController.type="2-3";
            });
          },
          child:const Icon(Icons.refresh_outlined),
        ),
      ),
    );
  }
}
