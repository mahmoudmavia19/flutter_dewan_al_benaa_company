import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:dewan_al_benaa_company/presentation/projects_screen/controller/projects_controller.dart';
import 'package:dewan_al_benaa_company/presentation/projects_screen/projects_item.dart';
import 'package:dewan_al_benaa_company/widgets/custom_app_bar.dart';
import 'package:dewan_al_benaa_company/widgets/footer_app_bar.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_drawable.dart';

class ProjectsScreen  extends GetWidget<ProjectScreenController> {
  var cont = Get.find<ProjectsController>();
  @override
  Widget build(BuildContext context) {
    return  SelectionArea(
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
                          image: AssetImage(ImageConstant.projects),
                          fit: BoxFit.cover,
                          opacity: 0.6),
                    ),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Projects'.tr,
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
                                  '  Projects'.tr,
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
                  SizedBox(height: 30,),
                  SizedBox(child: TextFormField(
                    onChanged: (value) {
                      cont.search.value = value;
                    },
                    onFieldSubmitted: (value) {
                      cont.searchAction();
                    },
                    clipBehavior: Clip.antiAlias,
                    decoration: InputDecoration(
                      hintText: 'Enter project you need it',
                      suffixIcon: Container(
                        height: 70.0,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          border: BorderDirectional(
                              end:BorderSide(color: Color(0xFF1A1C1E) ,width: 1.0) ,
                              top:BorderSide(color: Color(0xFF1A1C1E) ,width: 1.0) ,
                            bottom:BorderSide(color:Color(0xFF1A1C1E),width:  1.0) ),
                          borderRadius: BorderRadiusDirectional.only(topEnd:Radius.circular(10) ,bottomEnd: Radius.circular(10) )
                        ),
                        child: IconButton(
                            onPressed: (){
                              cont.searchAction();
                            },
                              icon: Icon(Icons.search,color: Colors.white,)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ), 
                    ),
                  ),width: 300.0),
                  ProjectsItem(),
                  FooterAppBar()
                ],
              ),
              CustomAppBar()
            ],
          ),
        ),
      ),
    );
  }
}
