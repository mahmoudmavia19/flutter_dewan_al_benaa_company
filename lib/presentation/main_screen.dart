import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:dewan_al_benaa_company/widgets/custom_drawable.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/customfloatbutton.dart';
import 'home_screen/controller/home_controller.dart';
class MainScreen extends GetWidget<HomeController> {
  ScrollController scrollController = ScrollController();
  MainScreen._();
  static MainScreen? _instance ;
  factory MainScreen(){
    if (_instance == null) {
      _instance =  MainScreen._();
    }
    return _instance!;
  }
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        drawer: CustomDrawable(),
        body: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if(notification is UserScrollNotification){
                    if(notification.metrics.pixels>100.0){
                      controller.floatButtonShow.value = true ;
                    }else{
                      controller.floatButtonShow.value = false ;
                    }
                  }
                  return true;
                },
                child: ListView.builder(
                  itemCount: controller.pages.length ,
                  controller: controller.scrollController,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => controller.pages[index],
                ),
              ),
              CustomAppBar(),
            ],
          ),
        ),
   floatingActionButton:Obx(() => controller.floatButtonShow.value? CustomFloatButton():Container())
      ),
    );
  }
}
