import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_mydan_rest_with_getx/controller/auth_controller.dart';

import '../../controller/app_controller.dart';
import '../../controller/translate_controller.dart';

class ProfileScreen extends StatelessWidget {
    ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppController appController = Get.put(AppController());
    AuthController authController = Get.put(AuthController());
    TranslateController translateController = Get.put(TranslateController());
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffdda256),
        title: const Text("Profile Screen"),
        centerTitle: true,
      ),
      body:GetBuilder <AuthController>(
        init: (AuthController()),
        builder: (con)
        {
          var name = con.userData.read("userName");
          var fullName = con.userData.read("userFullName");
          var email = con.userData.read("userEmail");
          var number = con.userData.read("userNumber");
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                        CircleAvatar(
                        radius: 72,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                            radius: 70,
                            backgroundImage: con.imageFile == null ?
                          const  NetworkImage(
                              'https://t3.ftcdn.net/jpg/01/83/55/76/240_F_183557656_DRcvOesmfDl5BIyhPKrcWANFKy2964i9.jpg',
                            )  :
                            FileImage(con.imageFile!) as ImageProvider,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                            Container(
                              padding: const EdgeInsets.all(20),
                              height: 180.h,
                              color: const Color(0xffdda256),
                              child: Column(
                                children: [
                                   Text(
                                    "Choose Profile Photo",
                                    style: TextStyle(fontSize: 25.sp,
                                        color : Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                    onTap: ()
                                    {
                                      // takePhoto(ImageSource.gallery);
                                      // var rand = Random().nextInt(1000000);
                                      // var imageName = "$rand" +  "jpg";
                                    },
                                    child: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.photo_outlined,
                                              size: 30,
                                            ),
                                            SizedBox(width: 20),
                                            Text(
                                              "From Gallery",
                                              style: TextStyle(fontSize: 20),
                                            )
                                          ],
                                        )),
                                  ),
                                  InkWell(
                                    onTap: ()async
                                    {
                                    await con.takePhoto(ImageSource.camera);
                                    Get.back();
                                      // var rand = Random().nextInt(1000000);
                                      // var imageName = "$rand" +  "jpg";
                                      // takePhoto(ImageSource.camera);
                                      // ref = FirebaseStorage.instance.ref("images").child(imageName);
                                      // Navigator.of(ctx).pop();
                                    },
                                    child: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          children:  [
                                            const  Icon(
                                              Icons.camera_alt,
                                              size: 30,
                                            ),
                                            const  SizedBox(width: 20),
                                            Text(
                                              "From Camera",
                                              style: TextStyle(fontSize: 20.sp,
                                              ),
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: const CircleAvatar(
                          radius: 20,
                          child: Icon(Icons.camera_alt),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child:TextFormField(
                    // controller: nameCon,
                    initialValue: name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Name",
                    ),
                  ),),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),

                    child: TextFormField(
                      // controller: nameCon,
                      initialValue: fullName,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Full Name",
                      ),
                    ),

                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      initialValue: email,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Eamil",

                      ),
                    ),

                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      initialValue: number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Mobile",

                      ),
                    ),

                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50.sp,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xffdda256),
                      ),
                      onPressed: (){},
                      child: Text("Save",
                        style: TextStyle(
                          fontSize: 20.sp,
                        ),),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ));
  }
}
