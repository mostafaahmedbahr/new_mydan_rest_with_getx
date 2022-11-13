 import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../auth/login.dart';
class RoomDetailsScreen extends StatefulWidget {
    RoomDetailsScreen({Key? key  ,

required this.name,
      required this.roomsImages,
      required this.properties,
      required this.beds,
      required this.faclilities,
      required this.view,

    }  ) : super(key: key);

  List? roomsImages;

    String? name;
  String? view;
  List? beds;
  List? properties;
  List? faclilities;
  @override
  State<RoomDetailsScreen> createState() => _RoomDetailsScreenState();
}

class _RoomDetailsScreenState extends State<RoomDetailsScreen> {
  @override
  Widget build(BuildContext context) {
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
        title:  Text("${widget.name}",
          style: const TextStyle(
            color: Colors.black,
          ),),
        centerTitle: true,
      ),
      body: Column(
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
              itemCount:  widget.roomsImages?.length,
              itemBuilder: (context , index , s)
              {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:widget.roomsImages!.isEmpty?
                  Image.network("https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg?w=1060",
                    fit:BoxFit.cover ,
                    width: double.infinity,) :
                  Image.network("http://laravel.meydanrest.com/assets/rooms/${widget.roomsImages![index]}",
                    fit:BoxFit.cover ,
                    width: double.infinity,),
                );
              },
            ),
          ),
         const Spacer(),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: (){
                AuthController().userData.read("userToken")==null ?
                Get.to(()=>LoginScreen())  :
                Fluttertoast.showToast(
                    msg: "Reverse Done",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              },
              child:const Text("Reverse",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),),
            ),
          ),
          SizedBox(height: 2.h,),
        ],
      ),
    );
  }
}
