import 'package:dewan_al_benaa_company/core/app_export.dart';
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
   print(' oops opops pops') ;
    super.onClose();
  }

}

class ProjectScreenController extends GetxController {

  @override
  void onReady() {
    super.onReady();
  }



  @override
  void onClose() {
    Get.find<ProjectsController>().searchMap.clear();
    super.onClose();
  }

}
