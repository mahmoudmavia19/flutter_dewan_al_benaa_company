import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../presentation/home_screen/controller/home_controller.dart';

class CustomFloatButton extends GetWidget<HomeController> {
   @override
  Widget build(BuildContext context) {
    return  InkWell(
      radius: 10.0,
      highlightColor: Colors.blueAccent[100],
      splashColor:  Colors.blueAccent[100],
      focusColor:Colors.blueAccent[100],
       onTap:() {
         controller.scrollController.animateTo(0.0, duration: Duration(seconds: 1), curve: Curves.linear);

       },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.all(10.0),
          child: Icon(Icons.arrow_upward,color: Colors.white,)),
    );
  }

}
