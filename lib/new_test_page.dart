import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextResponsive extends StatelessWidget {
  const TextResponsive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 400.h,
            width: 400.w,
            color: Colors.red,
            child:  Text("Mostafa Bahr",
              style: TextStyle(
                  fontSize: 50.sp
              ),),
          ),
        ],
      ),
    );
  }
}
