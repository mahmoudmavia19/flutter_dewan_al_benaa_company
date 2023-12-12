import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:flutter/material.dart';

import '../presentation/projects_screen/controller/projects_controller.dart';

class FooterAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
          padding: EdgeInsets.all(50.0),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage(ImageConstant.footer_bg),
                  opacity: 0.4,
                  fit: BoxFit.cover)),
          child: DefaultTextStyle(
            style: TextStyle(color: Colors.white70),
            child: Wrap(
              alignment: WrapAlignment.center,

              children: [
                SizedBox(
                  width: 150.0,
                    height: 150.0,
                    child: Card(child: Image.asset(ImageConstant.logo))),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 300.0,
                        child: Text(
                          'co_name'.tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 36.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: SizedBox(
                          width:241.0,
                          child: Directionality(
                             textDirection: TextDirection.ltr,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('GMAIL : DEWANALBENA@GMAIL.COM',textDirection: TextDirection.ltr),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text('TEL . 0138646000',textDirection: TextDirection.ltr),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text('Mob. 0552422000 ',textDirection: TextDirection.ltr),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text('Fax. 0138646688',textDirection: TextDirection.ltr),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Useful Links'.tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(onPressed: () {
                        Get.find<ProjectsController>().searchMap.clear();
                        Get.toNamed(AppRoutes.homeScreen);
                      },child: Text('Home'.tr)),
                      TextButton(onPressed: () {
                        Get.toNamed(AppRoutes.aboutScreen);
                      },child: Text('About'.tr)),
                      TextButton(onPressed: () {
                        Get.toNamed(AppRoutes.servicesScreen);
                      },child: Text('Services'.tr)),
                      TextButton(onPressed: () {
                        Get.toNamed(AppRoutes.projectsScreen);
                      },child: Text('Projects'.tr)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 150.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Our Services'.tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(onPressed: () {

                        },child: Text('Buildings'.tr)),
                        TextButton(onPressed: () {

                        },child: Text('Methods'.tr)),
                        TextButton(onPressed: () {

                        },child: Text('Landscaping'.tr)),
                        TextButton(onPressed: () {

                        },child: Text('more_services'.tr)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
