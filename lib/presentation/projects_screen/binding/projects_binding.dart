import 'package:dewan_al_benaa_company/presentation/projects_screen/controller/projects_controller.dart';
import 'package:get/get.dart';

class ProjectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProjectsController());
    Get.lazyPut(() => ProjectScreenController(),);
  }

}
