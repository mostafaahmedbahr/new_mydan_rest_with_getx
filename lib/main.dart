import 'dart:io';
  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_mydan_rest_with_getx/controller/auth_controller.dart';
 import 'package:new_mydan_rest_with_getx/services/dio_helper.dart';
import 'package:new_mydan_rest_with_getx/translate/translation.dart';
import 'package:new_mydan_rest_with_getx/views/first_sceen.dart';
import 'package:new_mydan_rest_with_getx/views/home/home_page.dart';

 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init("userToken");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return GetMaterialApp(
          translations: Translation(),
          locale: const Locale("en"),
          // ف حالة حدوث اى خطا يستخدم اللغة دى
          fallbackLocale: const Locale("en"),
          debugShowCheckedModeBanner: false,
          home:AuthController().userData.read("userToken")==null ? FirstScreen() : HomeScreen(),
        );
      }
    );
  }
}
