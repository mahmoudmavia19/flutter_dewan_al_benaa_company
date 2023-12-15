import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:dewan_al_benaa_company/presentation/about_screen/about_item.dart';
import 'package:dewan_al_benaa_company/presentation/projects_screen/projects_item.dart';
import 'package:dewan_al_benaa_company/presentation/services_screen/services_item.dart';
import 'package:dewan_al_benaa_company/widgets/footer_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_storage/get_storage.dart';
import '../../../main.dart';
import '../../partners/partners_item.dart';
import '../home_screen.dart';

class HomeController extends GetxController {
  RxBool floatButtonShow= RxBool(false);
   ScrollController scrollController = ScrollController();
   RxBool isEn= true.obs ;
  final box = GetStorage();


  appBarUpdate(ScrollNotification notification){
     if(notification.metrics.maxScrollExtent !=double.infinity ){
      if(notification.metrics.pixels>100.0){
        floatButtonShow.value = true ;
      }else{
       floatButtonShow.value = false ;
      }
    }
  }

  List<Widget> pages = [
    HomeScreen(),
    AboutItem(),
    ServicesItem(),
    ProjectsItem(),
    PartnersItem(),
    FooterAppBar()
  ];

  changeLanguage(context){
    if(isEn.value){
      Get.updateLocale(Locale('ar','AA'));
      isEn.value = false;
      box.write('lang',false);
    }else{
      Get.updateLocale(Locale('en','US'));
      isEn.value= true ;
      box.write('lang',true);
    }
    Phoenix.rebirth(context);
   }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onInit() {
    print(box.read('lang'));
    isEn.value = box.read('lang')??true;
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
