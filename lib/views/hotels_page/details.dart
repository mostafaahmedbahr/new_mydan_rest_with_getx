import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:new_mydan_rest_with_getx/views/hotels_page/rooms_details.dart';
import '../../controller/auth_controller.dart';
import '../../controller/hotels_controller.dart';
import '../auth/login.dart';
class HotelsDetails extends StatefulWidget {
    HotelsDetails({Key? key,required this.hotelId, required this.images }) : super(key: key);
int? hotelId;
List images;
  @override
  State<HotelsDetails> createState() => _HotelsDetailsState();
}
class _HotelsDetailsState extends State<HotelsDetails> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("${widget.hotelId}");
    HotelsController hotelsController =  Get.put(HotelsController());
    print("${hotelsController.hotelsDetailsModel?.details![0].title}");
     return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: (){
                // HotelsController().getAllHotels();
                Navigator.pop(context);
              },
              icon:const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.black,),
            ),
            title:const Text("Hotel Detail",
            style: TextStyle(
              color: Colors.black,
            ),),
            centerTitle: true,
          ),
       body: GetBuilder<HotelsController>(
         init: HotelsController(),
         builder: (controller)
         {
           return Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10),
             child: SingleChildScrollView(
               physics: const BouncingScrollPhysics(),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     height: 250.h,
                     width: double.infinity,
                     decoration:  BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: CarouselSlider.builder(
                       options: CarouselOptions(
                         initialPage: 0,
                         height: 250.h,
                         reverse: false,
                         enableInfiniteScroll: true,
                         autoPlay: true,
                         autoPlayInterval:const Duration(seconds: 3),
                         autoPlayCurve: Curves.fastOutSlowIn,
                         // اهم شرط عشان الصورة تاخد الحجم كله
                         viewportFraction: 1,
                       ),
                       itemCount:  widget.images.length,
                       itemBuilder: (context , index , s)
                       {
                         return ClipRRect(
                           borderRadius: BorderRadius.circular(20),
                           child: Image.network("http://laravel.meydanrest.com/assets/hotels/${widget.images[index]}",
                             fit:BoxFit.cover ,
                             width: double.infinity,),
                         );
                       },
                     ),
                   ),
                   SizedBox(height: 10.h,),
                   Text("${controller.hotelsDetailsModel?.details![0].title}",
                     style:const TextStyle(
                       fontSize: 25,
                       fontWeight: FontWeight.bold,
                     ),
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,),
                   SizedBox(height: 10.h,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           Text("${controller.hotelsDetailsModel?.details![0].price} \$",
                             style:const TextStyle(
                               fontSize: 20,
                               fontWeight: FontWeight.bold,
                             ),
                             maxLines: 3,
                             overflow: TextOverflow.ellipsis,),
                           const Text("per night"),
                         ],
                       ),
                       Row(
                         children: [
                           const Icon(Icons.star,color: Color(0xffdda256),),
                           SizedBox(width: 7.sp,),
                           Text("${controller.hotelsDetailsModel?.details![0].stars}"),
                           SizedBox(width: 5.sp,),
                           const Text("Reviews"),
                         ],
                       ),
                     ],
                   ),
                   SizedBox(height: 10.h,),
                   Text("Description",
                     style:  TextStyle(
                       fontSize: 25.sp,
                       fontWeight: FontWeight.bold,
                     ),
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,),
                   Text("${controller.hotelsDetailsModel?.details![0].description}",
                     style:const TextStyle(
                       fontSize: 18,
                     ),
                     maxLines: 3,
                     overflow: TextOverflow.ellipsis,),
                   ListView.separated(
                     physics:const BouncingScrollPhysics(),
                     shrinkWrap: true,
                     itemBuilder: (context,index)
                     {
                       return SizedBox(
                         height: 140.sp,
                         width: double.infinity,
                         child: InkWell(
                           onTap: ()
                           {
                             print("${controller.hotelsRoomDetailsModel!.rooms![index].id}");
                             Get.to(()=>RoomDetailsScreen(

                                 roomsImages: controller.hotelsRoomDetailsModel!.rooms![index].thumbnail!.map((e)
                                 {
                                 return e.image;
                                 }).toList(),
                                 properties:  controller.hotelsRoomDetailsModel!.rooms![index].properties!.map((e)
                                 {
                                   return e.nameEn;
                                 }).toList(),
                                 beds:  controller.hotelsRoomDetailsModel!.rooms![index].beds!.map((e)
                                 {
                                   return e.nameEn;
                                 }).toList(),
                                 faclilities:  controller.hotelsRoomDetailsModel!.rooms![index].faclilities!.map((e)
                                 {
                                   return e.nameEn;
                                 }).toList(),
                                 view: "${controller.hotelsRoomDetailsModel?.rooms![index].view}",
                               name: "${controller.hotelsRoomDetailsModel?.rooms![index].name}" ,
                             ));
                           },
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
                                   child: Image.network("http://laravel.meydanrest.com/assets/rooms/${controller.hotelsRoomDetailsModel?.rooms![0].thumbnail![0].image}",
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
                                       Text("title",
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
                                               Text("500 \$",
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
                         ),
                       );
                     },
                     separatorBuilder: (context,index)
                     {
                       return   SizedBox(height: 10.h);
                     },
                     itemCount:controller.hotelsRoomDetailsModel!.rooms!.length,
                   ),
                   SizedBox(height: 10.h,),
                   SizedBox(height: 10.h,),

                 ],
               ),
             ),
           );
         },

       ),
    );
  }
}
