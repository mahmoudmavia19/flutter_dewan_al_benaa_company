import 'package:carousel_slider/carousel_slider.dart';
import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  RxBool isHover = false.obs ;
  RxBool isHoverSearch = false.obs ;
  RxBool isHoverLink = false.obs ;
  List<String> images ;
  String itemKey ;
  int imageSelected ;
  CarouselController _controller= CarouselController();
  ProjectCard({required this.itemKey ,required this.images , this.imageSelected= 0});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return DefaultTextStyle(
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: InkWell(
              onTap: () {
                isHover.value= ! isHover.value ;
              },
              onHover: (value) {
                isHover.value = value ;
              },
              child: Stack(
                children: [
                  Container(
                    width: 400.0,
                    height: 300.0,
                     child: AnimatedPadding(
                      duration: Duration(milliseconds: 200),
                      padding:isHover.value?EdgeInsets.zero:EdgeInsets.all(10.0),
                      child:Image.asset(
                        images[imageSelected],
                        width: 400.0,
                        height: 300.0,
                        fit: BoxFit.cover,)
                    ),
                  ),
                  if(isHover.value)...[
                  Container(
                    color: Colors.black54,
                    width: 400.0,
                    height: 300.0,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(onTap: () {
                                  Get.dialog(
                                      Dialog(
                                        clipBehavior: Clip.antiAlias,
                                        child: Stack(
                                          children: [
                                            SizedBox(
                                                child: CarouselSlider.builder(itemCount:images.length,
                                                    carouselController: _controller,
                                                    itemBuilder: (context, index, realIndex) {
                                                      return Image.asset(
                                                        images[index],
                                                        width: 500.0,
                                                        height: 500.0,
                                                        fit: BoxFit.cover,);
                                                    },
                                                    options: CarouselOptions(
                                                      initialPage: imageSelected ,
                                                      viewportFraction: 1.0,
                                                    )),
                                              width: 500.0,
                                              height: 500.0,
                                            ),
                                            Container(
                                              width: 500.0,
                                              height: 500.0,
                                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                                              child: Row(
                                                children: [
                                                  CircleAvatar(backgroundColor: Colors.grey.withOpacity(0.5),child: IconButton(color: Colors.grey,onPressed:() {
                                                    _controller.previousPage();
                                                  }, icon:Icon(Icons.arrow_back_ios))),
                                                  Spacer(),
                                                  CircleAvatar(backgroundColor: Colors.grey.withOpacity(0.5),child: IconButton(color: Colors.grey,onPressed:() {
                                                    _controller.nextPage();
                                                  }, icon:Icon(Icons.arrow_forward_ios)))
                                                ],
                                              ),
                                            ),
                                            IconButton(icon: Icon(Icons.cancel_outlined,color:Colors.blueAccent,),onPressed: () {
                                              Get.back();
                                            },)
                                          ],
                                        ),
                                      )
                                  );
                                }, child: Obx(() {
                                    return Icon(
                                        Icons.zoom_in,
                                        color: isHoverSearch.value?Colors.blueAccent:  Colors.white ,
                                    size: 35.0,);
                                  }
                                ) ,
                                onHover: (value) {
                                  isHoverSearch.value = value ;
                                },
                                ),
                                SizedBox(width: 20.0,),
                                InkWell(onTap: () {
                                  Get.toNamed(AppRoutes.projectDetailsScreen,parameters: {'key':itemKey});
                                },
                                  onHover: (value) {
                                    isHoverLink.value = value;
                                  },
                                    child: Obx(
                                       () {
                                        return Icon(Icons.link, size: 35.0,color: isHoverLink.value?Colors.blueAccent:  Colors.white,);
                                      }
                                    ))
                              ],
                            ),
                            SizedBox(height: 70.0,),
                            Text(itemKey.tr)
                          ],
                      ),
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 25.0,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        color: Colors.blueAccent,
                          child: Text('Design'.tr,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)),
                    )
                      ]
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
