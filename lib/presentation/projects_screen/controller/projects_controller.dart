import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:dewan_al_benaa_company/presentation/home_screen/controller/home_controller.dart';

import '../../../data/models/project_model.dart';
class ProjectsController extends GetxController {
   RxString search = ''.obs ;
  RxMap<String,List<String>> searchMap = RxMap<String,List<String>>();


 searchAction(){
   searchMap.clear();
   for(var item in mapImages.keys){
     if(item.tr.toLowerCase().contains(search.value.toLowerCase())) {
       searchMap.addAll({
         item:mapImages[item]! ,
       });
     }
   }
  }
  @override
  void onReady() {
    searchMap.clear();
    super.onReady();
  }



  @override
  void onClose() {
   print(' oops opops pops');
    super.onClose();
  }

}

class ProjectScreenController extends GetxController {

  RxList<Project> get getProjects =>
  Get.find<HomeController>().isEn.value?
      projectsMapEN.map((e) => Project.fromJson(e)).toList().obs:projectsMapAR.map((e) => Project.fromJson(e)).toList().obs;

  @override
  void onInit() {
      projects.value = getProjects ;
    super.onInit();
  }
  @override
  void onReady() {
    super.onReady();
  }
  RxList<Project> projects  = RxList<Project>();
   searchProjects(String? searchTerm) {
     searchTerm = searchTerm!.toLowerCase();
     projects.value = getProjects.where((project) {
      return project.entity.toLowerCase().contains(searchTerm!) ||
          project.investor.toLowerCase().contains(searchTerm) ||
          project.description.toLowerCase().contains(searchTerm);
    }).toList();
     if(searchTerm.isEmpty){
       projects = getProjects;
     }
  }
  @override
  void onClose() {
    Get.find<ProjectsController>().searchMap.clear();
    super.onClose();
  }

}
