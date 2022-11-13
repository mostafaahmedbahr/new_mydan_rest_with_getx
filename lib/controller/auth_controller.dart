import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_mydan_rest_with_getx/services/dio_helper.dart';
import 'package:new_mydan_rest_with_getx/views/home/home_page.dart';

import '../models/login_model.dart';
import '../models/register_model.dart';
import 'dart:io';
 class AuthController extends GetxController
{

  @override
  void dispose() {
     emailCon.dispose();
     passwordCon.dispose();
     nameCon.dispose();
     fullNameCon.dispose();
     mobileCon.dispose();
     confirmPasswordCon.dispose();
    super.dispose();
  }
  var emailCon = TextEditingController();
  var passwordCon = TextEditingController();
  var nameCon = TextEditingController();
  var fullNameCon = TextEditingController();
  var mobileCon = TextEditingController();
  var confirmPasswordCon = TextEditingController();
  var isLoading = false;
    var isVisible = true;
  var isVisible2 = true;
    var userData = GetStorage();
    var userToken;
  var userName ;
  var userFullName;
  var userNumber;
  var userEmail;

  void changeSuffixIcon()
  {
    isVisible =!isVisible  ;
    update();
  }
  void changeSuffixIcon2()
  {
    isVisible2 =!isVisible2  ;
    update();
  }

  LoginModel? loginModel;

  login(String email, String password) async {
    isLoading = true;
    update();
       DioHelper.postData(
         url: "users/login",
         data: {
           "userName" :email ,
           "password" :password ,
         },
       ).then((value)async
       {
         loginModel = LoginModel.fromJson(value.data);
         print(value.data);
         Get.snackbar(
           "about login",
           "user message ",
           snackPosition: SnackPosition.BOTTOM,
           backgroundColor: const Color(0xffdda256),
           titleText: const Text(
             "Success",
             style: TextStyle(
               color: Colors.white,
             ),
           ),
           messageText:  Text(
             "${loginModel?.msg}",
             style: const TextStyle(
               color: Colors.white,
             ),
           ),
         );
         print("****************");
          userData.write("userToken", loginModel?.data?.token);
          print(userData.read("userToken"));
         print("****************");
         update();
         await Get.offAll(() => HomeScreen());

       }).catchError((error)
       {
         isLoading = false;
         print(loginModel?.msg);
         print("****************");
         update();
         Get.snackbar(
           "about user",
           "user message ",
           duration:const Duration(seconds: 5),
           snackPosition: SnackPosition.BOTTOM,
           backgroundColor:   Colors.red,
           titleText: const  Text(
             "Failed",
             style: TextStyle(
               color: Colors.white,
             ),
           ),
           messageText: Text(
             "${error}",
             style: const TextStyle(
               color: Colors.white,
             ),
           ),
         );
       });



  }

  RegisterModel? registerModel;
  Future<void>register(
      String name,
      String fullName,
      String mobile,
      String email, String password , String confirmPassword) async {
  isLoading = true;
  update();
  DioHelper.postData(
      url: "users/register",
      data: {
        "userName"  : name,
        "fullName"  : fullName,
        "mobile"  : mobile,
        "email"  : email,
        "password"  : password,
        "confirmPassword"  : confirmPassword,
      },
  ).then((value)async
  {
    print(value.data);
    registerModel = RegisterModel.fromJson(value.data);
    update();
    Get.snackbar(
      "about register",
      "user message ",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xffdda256),
      titleText: const Text(
        "Success",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      messageText:  Text(
        "${registerModel?.msg}",
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
    userData.write("userToken", registerModel?.data?.token);
    print(registerModel?.data?.token);
    print("0000000000000000000000000");
    print(userData.read("userToken"));
    await Get.offAll(() => HomeScreen());
    update();
  }).catchError((error)
  {
    isLoading = false;
    update();
    Get.snackbar(
      "about user",
      "user message ",
      duration:const Duration(seconds: 5),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:   Colors.red,
      titleText: const  Text(
        "Failed",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      messageText: Text(
        "${registerModel?.msg}",
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  });

}

  File? imageFile;
  final ImagePicker picker = ImagePicker();
  Future<void> takePhoto(ImageSource source)async
  {
    final pickedFile2 = await picker.pickImage(
      source: source,imageQuality: 50,maxWidth: 150,maxHeight: 150,
    );
    imageFile = File(pickedFile2!.path);
    // await ref?.putFile(imageFile!);
    update();
  }
}