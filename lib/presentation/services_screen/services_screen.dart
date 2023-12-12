import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:dewan_al_benaa_company/presentation/services_screen/controller/services_controller.dart';
import 'package:dewan_al_benaa_company/presentation/services_screen/services_item.dart';
import 'package:dewan_al_benaa_company/widgets/custom_app_bar.dart';
import 'package:dewan_al_benaa_company/widgets/custom_drawable.dart';
import 'package:dewan_al_benaa_company/widgets/footer_app_bar.dart';
import 'package:flutter/material.dart';

class ServicesScreen extends GetWidget<ServicesController> {

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
                          image: DecorationImage(image: AssetImage(ImageConstant.services),fit: BoxFit.cover,opacity: 0.6),
                        ),
                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Services'.tr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 36.0),),
                                SizedBox(height: 20.0,),
                                Row(
                                  children: [
                                    Text('Home  /'.tr,style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,fontSize: 18.0),),
                                    Text('  Services'.tr,style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 18.0),),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              ],
                            )
                        ),
                      ),
                      ServicesItem(),
                    ],
                  ),
                  CustomAppBar(),
                ],
              ),
              SizedBox(height: 20.0,),
              FooterAppBar()
            ],
          ),
        ),
      ),
    );
  }
}
_rowBuilder(title) {
  RxBool selected = false.obs;
  return InkWell(
    onTap: () {
      selected.value =  !selected.value ;
    },
  onHover: (value){
    selected.value = value ;
  },
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Obx(() {
            return Container(
              height: 30.0,
              width: 3.0,
              decoration: BoxDecoration(
                color: selected.value? Colors.blueAccent  : Colors.grey,
                borderRadius: BorderRadius.circular(3.0),
              ),
            );
          }
        ),
        SizedBox(width: 10.0,),
        Text(title)
      ],
    ),
  ),
);
}

