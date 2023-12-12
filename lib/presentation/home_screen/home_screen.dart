import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:dewan_al_benaa_company/widgets/home_items/home_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'controller/home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {

  @override
  Widget build(BuildContext context) {
    return  HomeItem();
  }
}
