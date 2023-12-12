import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:dewan_al_benaa_company/widgets/head_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:readmore/readmore.dart';

import 'controller/about_controller.dart';

class AboutItem extends  GetWidget<AboutController> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: Duration(seconds: 2),
                  childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                children:  [
                HeadTitleWidget(title:'About'.tr,subtitle: 'DEWAN ALBENA GENERAL CONT.'.tr,),
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 20.0,
                    children: [
                      Column(
                        children: [
                          Image.asset(ImageConstant.about,
                              fit: BoxFit.cover,
                              height: 400.0,
                              width:600),
                          Container(
                            width:600.0,
                            child: Card(
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.local_police_outlined,color: Colors.blueAccent,),
                                        Text('Polices'.tr,style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                    SizedBox(height: 20.0,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                      child: ReadMoreText('about_subtitle'.tr,
                                        textAlign: TextAlign.justify,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width:600,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('co_name'.tr,style: TextStyle(fontSize: 36.0,fontWeight: FontWeight.bold),),
                            Card(
                              margin: EdgeInsets.only(right: 20.0,bottom: 20.0),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //   Text('date 12/10/2021',style: TextStyle(color: Colors.grey,fontSize: 14.0),),
                                    Text('Our Story'.tr,style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 20.0,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(Icons.access_time,color: Colors.blueAccent,),
                                        SizedBox(width: 10.0,),
                                        Expanded(child: Text('our story1'.tr,)),
                                      ],
                                    ),
                                    SizedBox(height: 10.0,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(Icons.access_time,color: Colors.blueAccent,),
                                        SizedBox(width: 10.0,),
                                        Expanded(child: Text('our story2'.tr,)),
                                      ],
                                    ),
                                    Text('Objectives'.tr,style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 20.0,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(Icons.check_circle_outline,color: Colors.blueAccent,),
                                        SizedBox(width: 10.0,),
                                        Expanded(child: ReadMoreText('_objectives1'.tr,
                                          textAlign: TextAlign.justify,
                                          trimExpandedText : 'show less'.tr,
                                          trimCollapsedText : 'read more'.tr,
                                          moreStyle: TextStyle(color: Colors.blueAccent),
                                          lessStyle: TextStyle(color: Colors.blueAccent),
                                        )),
                                      ],
                                    ),
                                    SizedBox(height: 10.0,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(Icons.check_circle_outline,color: Colors.blueAccent,),
                                        SizedBox(width: 10.0,),
                                        Expanded(child: ReadMoreText('_objectives2'.tr,
                                          textAlign: TextAlign.justify,
                                          moreStyle: TextStyle(color: Colors.blueAccent),
                                          lessStyle: TextStyle(color: Colors.blueAccent),
                                        )),
                                      ],
                                    ),
                                    SizedBox(height: 10.0,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(Icons.check_circle_outline,color: Colors.blueAccent,),
                                        SizedBox(width: 10.0,),
                                        Expanded(child: ReadMoreText('_objectives3'.tr,
                                          textAlign: TextAlign.justify,
                                          moreStyle: TextStyle(color: Colors.blueAccent),
                                          lessStyle: TextStyle(color: Colors.blueAccent),
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              )
            ),
          ),
        ],
      ),
    );
  }
}
