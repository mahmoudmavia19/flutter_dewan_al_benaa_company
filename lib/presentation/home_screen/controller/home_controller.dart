import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:dewan_al_benaa_company/presentation/about_screen/about_item.dart';
import 'package:dewan_al_benaa_company/presentation/projects_screen/projects_item.dart';
import 'package:dewan_al_benaa_company/presentation/services_screen/services_item.dart';
import 'package:dewan_al_benaa_company/widgets/footer_app_bar.dart';
import 'package:flutter/material.dart';
import '../../partners/partners_item.dart';
import '../home_screen.dart';

class HomeController extends GetxController {
  RxBool floatButtonShow= RxBool(false);
   ScrollController scrollController = ScrollController();
   RxBool isEn= true.obs ;

  List<Widget> pages = [
    HomeScreen(),
    AboutItem(),
    ServicesItem(),
    ProjectsItem(),
    PartnersItem(),
    FooterAppBar()
  ];

  changeLanguage(){
    if(isEn.value){
      Get.updateLocale(Locale('ar','AA'));
      isEn.value = false;
    }else{
      Get.updateLocale(Locale('en','US'));
      isEn.value= true ;
    }
  }
  @override
  void onReady() {
 /*   scrollController.addListener(() {
      if(scrollController.offset>=100){
        floatButtonShow.value = true ;
      }else {
        floatButtonShow.value = false;
      }
    });*/
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
