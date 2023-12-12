import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:dewan_al_benaa_company/presentation/services_screen/controller/services_controller.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CustomCard extends GetWidget<ServicesController> {

  String title ;
  Widget icon ;
  void Function()? onTap ;
  int index ;
  RxBool isHover = false.obs;

  CustomCard({required this.title,required this.icon,this.onTap,required this.index});

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  InkWell(
      borderRadius: BorderRadius.circular(15.0),
      onTap: () {

      },
      onTapDown: (details) {
        isHover.value = true;
      },
      onTapUp: (details) {
        isHover.value = false;
      },
      onHover: (value) {
        isHover.value = value;
      },
      child: Card(
        color: Colors.transparent,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0.0,
        child: Container(
          decoration: BoxDecoration(
            image:   DecorationImage(image: AssetImage('${ImageConstant.servicesPath}$index.png'),fit: BoxFit.cover)
          ),
          width: 300.0,
          height: 300.0,
          child: Stack(
            children: [
              AnimatedContainer(
                color: Colors.black.withOpacity(0.6),
                width: 330.0,
                alignment: Alignment.center,
                curve: Curves.fastOutSlowIn,
                height: isHover.value ?  330.0: 0,
                duration: Duration(milliseconds: 200),),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(radius:30.0,backgroundColor: isHover.value?Colors.blueAccent:Colors.grey,
                            child:  icon,)
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Column(
                      children: [
                        ReadMoreText('${title}',
                          textAlign: TextAlign.center,
                          trimLines: 3,
                          trimMode: TrimMode.Line,
                          moreStyle: TextStyle(color: Colors.blueAccent,fontSize: 16.0),
                          lessStyle:  TextStyle(color: Colors.blueAccent,fontSize: 16.0),
                          style: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10.0,),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 3.0,
                            width: 150.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: isHover.value?Colors.blueAccent:Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
