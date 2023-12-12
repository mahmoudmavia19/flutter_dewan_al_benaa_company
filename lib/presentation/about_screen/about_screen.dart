import 'package:carousel_slider/carousel_slider.dart';
import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:dewan_al_benaa_company/presentation/about_screen/about_item.dart';
import 'package:dewan_al_benaa_company/presentation/about_screen/controller/about_controller.dart';
import 'package:dewan_al_benaa_company/widgets/custom_app_bar.dart';
import 'package:dewan_al_benaa_company/widgets/footer_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import '../../widgets/custom_drawable.dart';

class AboutScreen extends GetWidget<AboutController> {
  @override
  Widget build(BuildContext context) {
    print(certificates.length);
    return SelectionArea(
      child: Scaffold(
        drawer: CustomDrawable(),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 300.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          image: AssetImage(ImageConstant.about),
                          fit: BoxFit.cover,
                          opacity: 0.6),
                    ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'About'.tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 36.0),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Home  /'.tr,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                            Text(
                              '  About'.tr,
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ],
                    )),
                  ),
                  AboutItem(),
                  SizedBox(height: 10.0,),
                  Wrap(
                    spacing: 20.0,
                    children: [
                      SizedBox(
                        width: 500.0,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.verified,color: Colors.green,),
                                SizedBox(width: 10.0,),
                                Text('Certificates'.tr,style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20.0
                                ),),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            SizedBox(
                              height: 500,
                              child: CarouselSlider.builder(
                                  itemCount: certificates.length,
                                  itemBuilder:(context, index, realIndex) =>  InkWell(
                                    onTap: () {
                                      Get.dialog(
                                          Dialog(
                                            child: PhotoView(
                                              imageProvider: AssetImage(certificates[index]),
                                            ),
                                          )
                                      );
                                    },
                                      child: Image.asset(certificates[index])),
                                  options: CarouselOptions(
                                    height: 700,
                                    viewportFraction: 1.0,
                                    autoPlay: true ,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 500.0,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.work_history,color: Colors.green,),
                                SizedBox(width: 10.0,),
                                Text('Our Projects'.tr,style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20.0
                                ),),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            SizedBox(
                              height: 500,
                              child: CarouselSlider.builder(
                                  itemCount: ourProjects.length,
                                  itemBuilder:(context, index, realIndex) =>  GestureDetector(
                                    onTap: () {
                                      Get.dialog(
                                        Dialog(
                                          child: PhotoView(
                                            imageProvider: AssetImage(ourProjects[index]),
                                          ),
                                        )
                                      );
                                    },
                                      child: Image.asset(ourProjects[index])),
                                  options: CarouselOptions(
                                    height: 700,
                                    viewportFraction: 1.0,
                                    autoPlay: true ,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  FooterAppBar()
                ],
              ),
              CustomAppBar(),

            ],
          ),
        ),
      ),
    );
  }
}
