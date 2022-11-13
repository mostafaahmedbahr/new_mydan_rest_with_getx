

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:new_mydan_rest_with_getx/services/dio_helper.dart';
 import '../models/categories/apart_model.dart';
import '../models/categories/cars_model.dart';
import '../models/categories/establishments_model.dart';
import '../models/categories/lands_model.dart';
import '../models/first_screen_model.dart';

class AppController extends GetxController
{

  onIni()
  {
    getAllApartmentsCategories();
    print("start");
    super.onInit();
  }

var isGetDataLoading = false;
  List<FirstScreenModel> firstScreenListEN()
  {
    return [
     FirstScreenModel(
        image: "assets/images/rentEn.png",
        text: "Apartments for Rent & Sell",) ,
      FirstScreenModel(
        image: "assets/images/touristEn.png",
        text: "Tourism Services",
      ),
      FirstScreenModel(
        image: "assets/images/carRentEn.png",
        text: "renting cars",
      ),
      FirstScreenModel(
        image: "assets/images/receptionEn.png",
        text: "airport reception",
      ),
      FirstScreenModel(
        image: "assets/images/facilityEn.png",
        text: "Facilities for rent & sell",
      ),
      FirstScreenModel(
        image: "assets/images/landEn.png",
        text: "Land sale and rent",
      ),
    ];
  }

  List<FirstScreenModel> firstScreenListAR()
  {
    return [
      FirstScreenModel(
        image: "assets/images/rentEn.png",
        text: "شقق للبيع والايجار شقق يومية مفروشة",) ,
      FirstScreenModel(
        image: "assets/images/touristEn.png",
        text: "Tourism Services",
      ),
      FirstScreenModel(
        image: "assets/images/carRentEn.png",
        text: "renting cars",
      ),
      FirstScreenModel(
        image: "assets/images/receptionEn.png",
        text: "airport reception",
      ),
      FirstScreenModel(
        image: "assets/images/facilityEn.png",
        text: "Facilities for rent & sell",
      ),
      FirstScreenModel(
        image: "assets/images/landEn.png",
        text: "Land sale and ren",
      ),
    ];
  }

ApartModel? apartModel;

   var properitesList = [];
var l = [];
   var iconList = [
    const Icon(Icons.house_outlined),
    const Icon(Icons.home),
    const Icon(Icons.flood_rounded),
    const Icon(Icons.h_plus_mobiledata),
  ];

  getAllApartmentsCategories()async
  {
    l = [];
    isGetDataLoading = true;
    update();
   await DioHelper.postData(
        url: "offers/get?category=1",
        data: {},
    ).then((value)
    {
      apartModel = ApartModel.fromJson(value.data);
      print("0000000000000000");
      print(apartModel?.offers?.length);
      apartModel?.offers![0].properties?.forEach((element) {
        l.add(element.id);
      });
      print(l);
       print("0000000000000000");
      isGetDataLoading= false;
      update();
    }).catchError((error)
    {
      print("error in get getAllApartmentsCategories${error.toString()}");


    });

  }


  EstablishmentsModel? establishmentsModel;
  var establishmentsList = [];
  getAllEstablishmentsCategories()async
  {
    l = [];
    isGetDataLoading = true;
    update();
    await DioHelper.postData(
      url: "offers/get?category=2",
      data: {},
    ).then((value)
    {
      establishmentsModel = EstablishmentsModel.fromJson(value.data);
      print("0000000000000000");
      print(establishmentsModel?.offers?.length);
      // apartModel?.offers?.forEach((element) {
      //   properitesList.add(element.properties);
      //   // amenitiesList.add(element.amenities![1].id);
      // });
      // print(properitesList);
      // establishmentsModel?.offers![0].properties?.forEach((element) {
      //   l.add(element);
      // });
      // print(l);
      print("0000000000000000");
      isGetDataLoading= false;
      update();
    }).catchError((error)
    {
      print("error in get getAllEstablishmentsCategories${error.toString()}");


    });

  }

  LandsModel? landsModel;
  var landsList = [];
  getAllLandsCategories()async
  {
    l = [];
    isGetDataLoading = true;
    update();
    await DioHelper.postData(
      url: "offers/get?category=3",
      data: {},
    ).then((value)
    {
      landsModel = LandsModel.fromJson(value.data);
      print("0000000000000000");
      print(landsModel?.offers?.length);
      // apartModel?.offers?.forEach((element) {
      //   properitesList.add(element.properties);
      //   // amenitiesList.add(element.amenities![1].id);
      // });
      // print(properitesList);
      // establishmentsModel?.offers![0].properties?.forEach((element) {
      //   l.add(element);
      // });
      // print(l);
      print("0000000000000000");
      isGetDataLoading= false;
      update();
    }).catchError((error)
    {
      print("error in get getAllLandsCategories${error.toString()}");


    });

  }

  CarsModel? carsModel;
  List<dynamic> carsList = [];
  Cars? cars;
  var type = "2-3";
  getAllCarsCategories()async
  {
    carsList = [];
    isGetDataLoading = true;
    update();
    await DioHelper.getData(
      url: "cars/getCars/$type",
    ).then((value)
    {
       value.data.forEach((e){
         carsList.add(e);
       });
      print("0000000000000000");
      print(carsList[0]);
      isGetDataLoading= false;
      update();
    }).catchError((error)
    {
      print("error in get getAllcarsCategories${error.toString()}");


    });

  }








}