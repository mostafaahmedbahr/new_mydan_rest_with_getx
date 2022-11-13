import 'dart:math';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_mydan_rest_with_getx/services/dio_helper.dart';

import '../models/categories/hotels/all_hotels_model.dart';
import '../models/categories/hotels/cities.dart';
import '../models/categories/hotels/hotels_details_model.dart';
import '../models/categories/hotels/rooms_model.dart';

class HotelsController extends GetxController {
  var isGetDataLoading = false;
  CitiesForHotelsModel? citiesForHotelsModel;
  getAllCitiesForHotels() async {
    isGetDataLoading = true;
    // update();
    await DioHelper.getData(
      url: "city/get",
    ).then((value) {
      print(value.data);
      citiesForHotelsModel = CitiesForHotelsModel.fromJson(value.data);
      print(citiesForHotelsModel?.data?.length);
      isGetDataLoading = false;
      update();
    }).catchError((error) {
      print("error in get hotles cities ${error.toString()}");
    });
  }

  AllHotelsModel? allHotelsModel;
  getAllHotels() async {
    isGetDataLoading = true;
    // update();
    await DioHelper.getData(
      url: "hotel/get",
    ).then((value) {
      print(value.data);
      allHotelsModel = AllHotelsModel.fromJson(value.data);
      print(allHotelsModel?.hotel?.length);
      isGetDataLoading = false;
      update();
    }).catchError((error) {
      print("error in get hotles cities ${error.toString()}");
    });
  }

  HotelsDetailsModel? hotelsDetailsModel;
   getHotelDetail(hotelId) async {
    isGetDataLoading = true;
    update();
    await DioHelper.getData(
      url: "hotel/details/$hotelId",
    ).then((value) {
      // print(value.data);
      hotelsDetailsModel = HotelsDetailsModel.fromJson(value.data);
      print(hotelsDetailsModel?.details?.length);
      print("000000000000000");
      print(hotelsDetailsModel?.details![0].title);
       print(hotelsDetailsModel?.details![0].rooms);
      print("000000000000000");
      isGetDataLoading = false;
      update();
    }).catchError((error) {
      print("error in get hotles details ${error.toString()}");
    });

  }


  HotelsRoomDetailsModel? hotelsRoomDetailsModel;
  getHotelsRooms(hotelId)
  async {
    isGetDataLoading = true;
    update();
    await DioHelper.getData(
      url: "hotel/room/$hotelId",
    ).then((value) {
      // print(value.data);
      hotelsRoomDetailsModel = HotelsRoomDetailsModel.fromJson(value.data);
      print("000000000000000");
      print(hotelsRoomDetailsModel?.rooms![0].name);
      print("9999999999999999999");
      isGetDataLoading = false;
      update();
    }).catchError((error) {
      print("error in get hotles rooms details ${error.toString()}");
    });

  }
}
