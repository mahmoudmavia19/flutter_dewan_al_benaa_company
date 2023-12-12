import 'package:carousel_slider/carousel_slider.dart';
import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:dewan_al_benaa_company/presentation/project_details_screen/controller/project_details_controller.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_drawable.dart';
import '../../widgets/footer_app_bar.dart';

class ProjectDetailsScreen extends GetWidget<ProjectDetailsController> {
  String itemKey ;

  ProjectDetailsScreen({
    required this.itemKey});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        drawer: CustomDrawable(),
        body:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 300.0,width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(image: AssetImage(mapImages[itemKey]![0]),fit: BoxFit.cover,opacity: 0.6),
                        ),
                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Project Details'.tr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 36.0),),
                                SizedBox(height: 20.0,),
                                Row(
                                  children: [
                                    Text('Home  /'.tr,style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,fontSize: 18.0),),
                                    Text('  Project Details'.tr,style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 18.0),),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              ],
                            )
                        ),
                      ),
                      SizedBox(height: 50.0,),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [

                            Container(
                                width: 700,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      title: Text(itemKey.tr),
                                      titleTextStyle: TextStyle(color: Color(0xFF364D59),fontSize: 26.0,fontWeight: FontWeight.bold),
                                      subtitleTextStyle: TextStyle(color: Color(0xFF364D59),fontSize: 18.0),
                                    )
                                  ],
                                )),
                            SizedBox(height: 20,),
                            Container(
                              width: 700,
                              child: Column(
                                children: [
                                  CarouselSlider.builder(
                                    carouselController: controller.carouselController,
                                      itemCount: mapImages[itemKey]?.length,
                                      itemBuilder: (context, index, realIndex) =>
                                      mapImages[itemKey]!.map((e) => Image.asset(e,width: 700)).toList()[index],
                                      options: CarouselOptions(
                                        clipBehavior: Clip.antiAlias,
                                        autoPlay: true,
                                        viewportFraction: 1 ,
                                        onPageChanged: (index, reason) {
                                          controller.currentPosition.value = index;
                                        },
                                      )),
                                ],
                              ),
                            ),


                          ],
                        ),
                      )
                     ],
                  ),
                  CustomAppBar(),
                ],
              ),
              FooterAppBar()
            ],
          ),
        ),
      ),
    );
  }
}
