import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:flutter/material.dart';

import '../presentation/home_screen/controller/home_controller.dart';
import '../presentation/projects_screen/controller/projects_controller.dart';

class CustomAppBar extends  GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Card(
      color: Colors.transparent,
      margin: EdgeInsets.zero,
     elevation: 0.0,
     shape: RoundedRectangleBorder(),
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        decoration: BoxDecoration(
          color: controller.floatButtonShow.value? Colors.blueAccent.withOpacity(0.6) : Colors.black.withOpacity(0.4) ) ,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        height: 100.0,
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(child: Image.asset(ImageConstant.logo2,height: 100.0),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0)
              )),
            ),
            Spacer(),
            if(MediaQuery.of(context).size.width>=1200)...[
              TextButton(onPressed: () {
                Get.find<ProjectsController>().searchMap.clear();
                Get.toNamed(AppRoutes.homeScreen);}, child: Text('Home'.tr)),
              TextButton(onPressed: () {Get.toNamed(AppRoutes.aboutScreen);}, child: Text('About'.tr)),
              TextButton(onPressed: () {Get.toNamed(AppRoutes.servicesScreen);}, child: Text('Services'.tr)),
              TextButton(onPressed: () {Get.toNamed(AppRoutes.projectsScreen);}, child: Text('Projects'.tr)),
              TextButton(onPressed: () {Get.toNamed(AppRoutes.contactScreen);}, child: Text('Contact Us'.tr)),
              TextButton(onPressed: () {
                controller.changeLanguage();
              }, child: Text('language'.tr)),

            ],
            if(MediaQuery.of(context).size.width<1200)
              DrawerButton(style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white)),
                onPressed: () {
                Scaffold.of(context).openDrawer();
                },
              )
          ],
        ),
      ),
    ));
  }
}