import 'package:flutter/material.dart';
class CustomListTile extends StatelessWidget {
  const CustomListTile({Key? key,required this.text, required this.onTap, required this.selectedDestination, required this.icon}) : super(key: key);
final String? text;
final Function()? onTap;
final bool selectedDestination;
final Icon icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:   icon,
      title: Text("$text"),
      selected: selectedDestination,
      hoverColor: Colors.yellow,
      selectedColor:const Color(0xffdda256),
      onTap:   onTap,
    );
  }
}
