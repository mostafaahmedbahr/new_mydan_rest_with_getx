import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_mydan_rest_with_getx/views/auth/register_screen.dart';
import 'package:get_storage/get_storage.dart';
import '../../controller/auth_controller.dart';
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/website background.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: formKey,
            child: Padding(
              padding:const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //name
                       Text("User Name".tr  ,
                      style:const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,

                      ),),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: authController.nameCon,
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return "name is must not be empty";
                        }
                      },
                      decoration: InputDecoration(
                        border:const OutlineInputBorder(),
                        hintText: "Name".tr,
                        prefixIcon:const Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    //full name
                     Text("Full Name".tr  ,
                      style:const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,

                      ),),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: authController.fullNameCon,
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return "fullName is must not be empty";
                        }
                      },
                      decoration: InputDecoration(
                        border:const OutlineInputBorder(),
                        hintText: "Full Name".tr,
                        prefixIcon:const Icon(Icons.person_add),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    // email
                     Text("Email".tr  ,
                      style:const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,

                      ),),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: authController.emailCon,
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return "email is must not be empty";
                        }
                      },
                      decoration: InputDecoration(
                        border:const OutlineInputBorder(),
                        hintText: "Email".tr,
                        prefixIcon: const Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    // mobile
                     Text("Mobile".tr  ,
                      style:const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,

                      ),),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: authController.mobileCon,
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return "mobile is must not be empty";
                        }
                      },
                      decoration: InputDecoration(
                        border:const OutlineInputBorder(),
                        hintText: "Mobile".tr,
                        prefixIcon:const Icon(Icons.phone),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    // password
                       Text("Password".tr  ,
                      style:const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,

                      ),),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GetBuilder<AuthController>(
                      init: AuthController(),
                      builder: (con)
                      {
                        return TextFormField(
                          controller: con.passwordCon,
                          validator: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return "password is must not be empty";
                            }
                          },
                          obscureText: con.isVisible,
                          decoration: InputDecoration(
                            border:const OutlineInputBorder(),
                            hintText: "Password".tr,
                            prefixIcon:const Icon(Icons.lock),
                            suffixIcon:IconButton(
                              icon: con.isVisible ?
                              const Icon(Icons.visibility_off): const Icon(Icons.visibility),
                              onPressed: (){
                                con.changeSuffixIcon();
                              },
                            ),
                          ),
                        );
                      },

                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    // Confirm Password
                       Text("Confirm Password".tr  ,
                      style:const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,

                      ),),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GetBuilder<AuthController>(
                      init: AuthController(),
                      builder: (con)
                      {
                        return TextFormField(
                          controller: con.confirmPasswordCon,
                          validator: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return "Confirm Password is must not match";
                            }
                          },
                          obscureText: con.isVisible2,
                          decoration: InputDecoration(
                            border:const OutlineInputBorder(),
                            hintText: "Confirm Password".tr,
                            prefixIcon:const Icon(Icons.lock),
                            suffixIcon:IconButton(
                              icon: con.isVisible2 ?
                              const Icon(Icons.visibility_off): const Icon(Icons.visibility),
                              onPressed: (){
                                con.changeSuffixIcon2();
                              },
                            ),
                          ),
                        );
                      },

                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    GetBuilder<AuthController>(
                        init: AuthController(),
                        builder: (con)
                        {
                          return  con.isLoading == true ?const Center(
                            child: CircularProgressIndicator(
                              color:   Color(0xffdda256),
                            ),
                          ) :  SizedBox(
                            width: double.infinity,
                            height: 50,
                            child:  ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xffdda256),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: ()async{
                                if(formKey.currentState!.validate())
                                {
                             await     con.register(
                                      authController.nameCon.text,
                                    authController.fullNameCon.text,
                                    authController.mobileCon.text,
                                    authController.emailCon.text,
                                    authController.passwordCon.text,
                                    authController.confirmPasswordCon.text,
                                  );
                                  // con.userData.write("userToken", con.registerModel?.data?.token);
                                }
                               },
                              child: Text("SIGN UP".tr,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white,
                                ),),
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 30.0,
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
