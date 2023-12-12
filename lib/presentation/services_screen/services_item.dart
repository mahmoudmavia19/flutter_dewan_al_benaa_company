import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:dewan_al_benaa_company/presentation/services_screen/controller/services_controller.dart';
import 'package:dewan_al_benaa_company/widgets/head_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../widgets/custom_card.dart';

class ServicesItem extends GetWidget<ServicesController> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadTitleWidget(title:'Services'.tr,
          subtitle:'services_subtitle'.tr,),
        AnimationLimiter(
          child: Wrap(
            children: AnimationConfiguration.toStaggeredList(
              duration: Duration(seconds:2),
                childAnimationBuilder:(widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
              children: [
                CustomCard(title:  'service1'.tr,
                    icon:Icon(Icons.construction,color: Colors.white,),index: 1),
                CustomCard(title:  'service2'.tr,
                    icon:Icon(Icons.real_estate_agent,color: Colors.white,),index: 0),
                CustomCard(title:  'service3'.tr,
                    icon:Icon(Icons.landscape,color: Colors.white,),index: 2),
                CustomCard(title:  'service4'.tr,
                    icon:Icon(Icons.directions_walk_sharp,color: Colors.white,),index: 3),
                CustomCard(title:  'service5'.tr,
                    icon:Icon(Icons.electric_bolt,color: Colors.white,),index: 5),
                CustomCard(title:  'service6'.tr,
                    icon:Icon(Icons.light,color: Colors.white,),index: 6),
                CustomCard(title:  'service7'.tr,
                  icon:Icon(Icons.imagesearch_roller,color: Colors.white,),index: 7,),
                CustomCard(title: 'service8'.tr,
                  icon:Icon(Icons.restore_outlined,color: Colors.white,),index: 8,),
              ],
            )
          ),
        )
      ],
    );
  }
}

