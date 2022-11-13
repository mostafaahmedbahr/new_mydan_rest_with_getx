import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:new_mydan_rest_with_getx/views/auth/register_screen.dart';
import 'package:get_storage/get_storage.dart';
import '../../controller/auth_controller.dart';
class LoginScreen extends StatelessWidget {
    LoginScreen({Key? key}) : super(key: key);
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100,),
                      Text("User Name".tr ,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,

                    ),),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
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
                      prefixIcon:const Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  //
                     Text("Password".tr  ,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,

                    ),),
                  const SizedBox(
                    height: 15.0,
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
                    height: 30.0,
                  ),
                  GetBuilder<AuthController>(
                    init: AuthController(),
                      builder: (con)
                  {
                    return  con.isLoading == true ?
                    const Center(
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
                        await    con.login(
                              authController.emailCon.text,
                              authController.passwordCon.text,
                            );
                          }
                          print("0000000000000000");
                        },
                        child: Text("LOGIN".tr,
                          style:const TextStyle(
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
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child:  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xffdda256),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: (){
                        Get.to(()=>RegisterScreen());

                      },
                      child: Text("SIGN UP".tr,
                        style:const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),),
                    ),
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
