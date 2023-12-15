import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:dewan_al_benaa_company/presentation/home_screen/controller/home_controller.dart';
import 'package:dewan_al_benaa_company/presentation/projects_screen/controller/projects_controller.dart';
import 'package:dewan_al_benaa_company/presentation/projects_screen/projects_item.dart';
import 'package:dewan_al_benaa_company/widgets/custom_app_bar.dart';
import 'package:dewan_al_benaa_company/widgets/footer_app_bar.dart';
import 'package:dewan_al_benaa_company/widgets/head_title_widget.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_drawable.dart';

class ProjectsScreen  extends GetWidget<ProjectScreenController> {
  var cont = Get.find<ProjectsController>();
  @override
  Widget build(BuildContext context) {
    return  SelectionArea(
      child: Scaffold(
        drawer: CustomDrawable(
          onChangeLang: () {
            controller.projects = controller.getProjects;
          },
        ),
        body: Stack(
          children: [
            NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                Get.find<HomeController>().appBarUpdate(notification);
                return true;
              },
              child: SingleChildScrollView(
                child: Column(
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
                                    'Home'.tr,
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text('/', style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),),
                                  ),
                                  Text(
                                    'Projects'.tr,
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
                        hintText: 'Enter project you need it'.tr,
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
                    HeadTitleWidget(title: 'All Projects'.tr),
                    SizedBox(child: TextFormField(
                      onChanged: (value) {
                      controller.searchProjects(value);
                      },
                      clipBehavior: Clip.antiAlias,
                      decoration: InputDecoration(
                        hintText: 'Enter project you need it'.tr,
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

                              },
                              icon: Icon(Icons.search,color: Colors.white,)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),width: 300.0),

                    if(MediaQuery.of(context).size.width<=1000)
                      Obx(
                        () {
                          return Card(
                            margin: EdgeInsets.symmetric(horizontal: 50.0),
                            child:ListView.builder(
                                padding: EdgeInsets.all(20.0),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.projects.length,
                                itemBuilder: (context, index) =>Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15.0),
                                        border:Border.all(color: Colors.blueAccent,width: 2.0)
                                    ),
                                    child: ListTile(
                                      titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.0),
                                      title: Text(controller.projects[index].entity==''?controller.projects[index].investor:controller.projects[index].entity),
                                      subtitle:Text(controller.projects[index].description),
                                      leading: CircleAvatar(child: Text(controller.projects[index].id.toString()),),
                                    ),
                                  ),
                                )) ,
                          );
                        }
                      ),
                    if(MediaQuery.of(context).size.width>1000)
                    Obx(
                      (){
                        return Card(
                          margin: EdgeInsets.all(20.0),
                          child: FittedBox(
                            child: DataTable(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0)
                              ),
                              headingRowColor: MaterialStatePropertyAll(Colors.blueAccent),
                              headingTextStyle: TextStyle(fontSize:24.0,fontWeight: FontWeight.bold,color: Colors.white),
                              dataTextStyle: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold),
                                border: TableBorder.all(color: Colors.blueAccent,width: 2.0,borderRadius: BorderRadius.circular(15.0)),
                                columns: [
                                  DataColumn(label: Text('#')),
                                  DataColumn(label: Text('Project Name'.tr)),
                                  DataColumn(label: Text('Owner'.tr)),
                                  DataColumn(label: Text('Owner Type'.tr)),

                                ],
                                rows: controller.projects.map((element) =>DataRow(cells: [
                                  DataCell(Text(element.id.toString())),
                                  DataCell(Text(element.description)),
                                  DataCell(Text(element.entity==''?element.investor:element.entity)),
                                  DataCell(Text(element.entity==''?'Investor'.tr:'Entity'.tr)),
                                ])).toList()),
                          ),
                        );
                      }
                    ),
                    FooterAppBar()
                  ],
                ),
              ),
            ),
            CustomAppBar(onChangeLang: () {
             controller.projects = controller.getProjects;
            },)
          ],
        ),
      ),
    );
  }
}
