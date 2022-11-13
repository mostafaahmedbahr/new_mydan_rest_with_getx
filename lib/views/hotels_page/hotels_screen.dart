import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:get/get.dart';
 import 'package:new_mydan_rest_with_getx/controller/hotels_controller.dart';
import 'package:new_mydan_rest_with_getx/views/hotels_page/details.dart';
 import '../../controller/app_controller.dart';
import '../../controller/translate_controller.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({Key? key}) : super(key: key);

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  @override
  void initState() {
      HotelsController().getAllCitiesForHotels();
      HotelsController().getAllHotels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppController appController = Get.put(AppController());
    HotelsController hotelsController = Get.put(HotelsController())..getAllCitiesForHotels()..getAllHotels();
    TranslateController translateController = Get.put(TranslateController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffdda256),
        ),
        body: GetBuilder<HotelsController>(
          init: HotelsController(),
          builder: (c) {
            return c.allHotelsModel ==null ?
                const Center(
                  child:  CircularProgressIndicator(
                    color:   Color(0xffdda256),
                  ),
                ) :
              Padding(
                    padding: const EdgeInsets.all(10).r,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Places".tr,
                          style:   TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                          SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 150.h,
                          child: ListView.builder(
                            shrinkWrap: false,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  c.citiesForHotelsModel?.data!.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Container(
                                      height: 150.h,
                                      width: 150.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20).r,
                                        color: Colors.red,
                                      ),
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(20).r,
                                            child: Image.network(
                                              "http://laravel.meydanrest.com/assets/city/${c.citiesForHotelsModel?.data![index].img}",
                                              fit: BoxFit.fitHeight,
                                              height: 150.h,
                                            ),
                                          ),
                                          translateController.lang == "EN"
                                              ? Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20).r,
                                              color:
                                              Colors.black.withOpacity(0.3),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "${c.citiesForHotelsModel?.data![index].cityEn}",
                                                style:   TextStyle(
                                                  fontSize: 20.sp,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                              : Container(
                                            color: Colors.black.withOpacity(0.3),
                                            width: double.infinity,
                                            child: Center(
                                              child: Text(
                                                "${c.citiesForHotelsModel?.data![index].cityAr}",
                                                style:   TextStyle(
                                                  fontSize: 20.sp,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                      SizedBox(
                                      width: 20.w,
                                    ),
                                  ],
                                );
                              }),
                        ),
                          SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Hotels Part".tr,
                          style:   TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                          SizedBox(
                          height: 20.h,
                        ),
                       Expanded(
                         child:  ListView.separated(
                         physics:const BouncingScrollPhysics(),
                         shrinkWrap: true,
                         itemBuilder: (context,index)
                         {
                           return SizedBox(
                             height: 140.sp,
                             width: double.infinity,
                             child: Card(
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(10).r,
                               ),
                               color: Colors.grey.shade300,
                               child: Row(
                                 children: [
                                   ClipRRect(
                                     borderRadius: BorderRadius.only(
                                       topLeft: const Radius.circular(10).r,
                                       bottomLeft:const Radius.circular(10).r,
                                     ),
                                     child: Image.network("http://laravel.meydanrest.com/assets/hotels/${c.allHotelsModel?.hotel![index].thumbnail}",
                                     fit: BoxFit.fitHeight,
                                     width: 150.w,
                                       height: 140.h,
                                     ),
                                   ),
                                     SizedBox(
                                     width: 10.w,
                                   ),
                                   SizedBox(
                                    width: 170.w,
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("${c.allHotelsModel!.hotel![index].title}",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style:  TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        Row(
                                          children: const[
                                            Icon(Icons.star,color:Color(0xffdda256)),
                                            Icon(Icons.star,color: Color(0xffdda256)),
                                            Icon(Icons.star,color: Color(0xffdda256)),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                           Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Text("${c.allHotelsModel!.hotel![index].price} \$",
                                                 style:  TextStyle(
                                                     fontSize: 16.sp,
                                                     fontWeight: FontWeight.bold
                                                 ),),
                                                Text("per night",
                                              style: TextStyle(
                                                color: Colors.grey.shade800,
                                              ),),
                                             ],
                                           ),
                                           const Spacer(),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                primary:const Color(0xffdda256),
                                              ),
                                              onPressed: ()async{
                                                await c.getHotelDetail(c.allHotelsModel?.hotel![index].id);
                                                await c.getHotelsRooms(c.allHotelsModel?.hotel![index].id);
                                                print("${c.hotelsDetailsModel?.details![0].title}");
                                                // ignore: use_build_context_synchronously
                                                Navigator.push(context, MaterialPageRoute(builder: (context)
                                                {
                                                  return HotelsDetails(
                                                    hotelId: c.allHotelsModel?.hotel![index].id,
                                                    images: c.allHotelsModel!.hotel![index].images!.map((e)
                                                    {
                                                      return e.img;
                                                    }).toList(),
                                                    // title:"${c.allHotelsModel?.hotel![index].title}" ,
                                                    // description:"${c.allHotelsModel?.hotel![index].description}" ,
                                                    // stars: c.allHotelsModel?.hotel![index].stars,
                                                    // thumbnail: "http://laravel.meydanrest.com/assets/hotels/${c.allHotelsModel?.hotel![index].thumbnail}",
                                                    // price:"${c.allHotelsModel?.hotel![index].price}",
                                                    // images: c.allHotelsModel!.hotel![index].images!.map((e)
                                                    // {
                                                    //   return e.img;
                                                    // }).toList(),
                                                    // rooms: c.allHotelsModel!.hotel![index].boards!.map((e)
                                                    // {
                                                    //   return e.id;
                                                    // }).toList(),
                                                  );
                                                }));
                                              },
                                              child: const Text("Details"),
                                            )

                                            // Container(
                                            //   height: 30.h,
                                            //   width: 50.w,
                                            //   decoration: BoxDecoration(
                                            //     color: Colors.white,
                                            //     borderRadius: BorderRadius.circular(10).r,
                                            //   ),
                                            //   child: Row(
                                            //     mainAxisAlignment: MainAxisAlignment.center,
                                            //     children: [
                                            //       Text("${c.allHotelsModel!.hotel![index].stars}"),
                                            //       const  Icon(Icons.star,
                                            //         color:   Color(0xffdda256),),
                                            //     ],
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                 ],
                               ),
                             ),
                           );
                         },
                         separatorBuilder: (context,index)
                         {
                           return   SizedBox(height: 10.h);
                         },
                         itemCount: c.allHotelsModel!.hotel!.length,
                       ),),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
