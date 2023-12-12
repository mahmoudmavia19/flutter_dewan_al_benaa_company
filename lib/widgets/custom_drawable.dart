import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:dewan_al_benaa_company/presentation/home_screen/controller/home_controller.dart';
import 'package:flutter/material.dart';

class CustomDrawable extends GetWidget<HomeController>{

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black87,
      child:ListView(
        children: [
          DrawerHeader(child:Image.asset(ImageConstant.logo2)),
          ListTile(leading: Icon(Icons.home),
              onTap: () {Get.toNamed(AppRoutes.homeScreen);},    trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,) ,title: Text('Home'.tr)),
          Divider(),
          ListTile(leading: Icon(Icons.info),
              onTap: () {Get.toNamed(AppRoutes.aboutScreen);},   trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,) ,title: Text('About'.tr)),
          Divider(),
          ListTile(leading: Icon(Icons.real_estate_agent),
              onTap: () {Get.toNamed(AppRoutes.servicesScreen);},trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,) ,title: Text('Services'.tr)),
          Divider(),
          ListTile(leading: Icon(Icons.construction),
    onTap: () {Get.toNamed(AppRoutes.projectsScreen);},trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,) ,title: Text('Projects'.tr)),
          Divider(),
          ListTile(leading: Icon(Icons.alternate_email),
              onTap: () {Get.toNamed(AppRoutes.contactScreen);}, trailing: Icon(Icons.arrow_forward_ios,color: Colors.white,) ,title: Text('Contact Us'.tr)),
          ListTile(
    leading:  Icon(Icons.language),onTap: () {-controller.changeLanguage();},trailing: Icon(Icons.arrow_forward_ios) ,title: Text('language'.tr)),
          Divider(),
          ListTile(trailing: Icon(Icons.email,color: Colors.white70,) ,titleTextStyle: TextStyle(color: Colors.white70),title: Text('GMAIL : DEWANALBENA@GMAIL.COM',textDirection: TextDirection.ltr,)),
          ListTile(trailing: Icon(Icons.phone,color: Colors.white70,) ,titleTextStyle: TextStyle(color: Colors.white70),title: Text('TEL . 0138646000',textDirection: TextDirection.ltr)),
          ListTile(trailing: Icon(Icons.phone_iphone,color: Colors.white70,) ,titleTextStyle: TextStyle(color: Colors.white70),title: Text('Mob. 0552422000',textDirection: TextDirection.ltr)),
          ListTile(trailing: Icon(Icons.fax,color: Colors.white70,) ,titleTextStyle: TextStyle(color: Colors.white70),title: Text('Fax. 0138646688',textDirection: TextDirection.ltr)),
        ],
      ),
    );
  }
}
