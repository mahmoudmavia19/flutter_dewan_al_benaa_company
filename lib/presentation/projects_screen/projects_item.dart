import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:dewan_al_benaa_company/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../widgets/head_title_widget.dart';
import 'controller/projects_controller.dart';

class ProjectsItem extends  GetWidget<ProjectsController> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadTitleWidget(title:'Projects'.tr,
          subtitle: 'projects_subtitle'.tr,),
        Obx(() {
            return AnimationLimiter(
              child: Wrap(
                children: AnimationConfiguration.toStaggeredList(
                  duration: Duration(seconds: 2),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: [
                      if(controller.searchMap.isEmpty)...[
                        for(var item in mapImages.keys)
                          ProjectCard(itemKey: item,images:mapImages[item]??[],imageSelected:(mapImages[item]!.length - 1) ),
                      ],
                      if(controller.searchMap.isNotEmpty)...[
                        for(var item in controller.searchMap.keys)
                          ProjectCard(itemKey: item,images:controller.searchMap[item]??[],imageSelected:(controller.searchMap[item]!.length - 1) ),
                      ]
                    ]
                ),
              ),
            );
          }
        )
      ],
    );
  }
}
