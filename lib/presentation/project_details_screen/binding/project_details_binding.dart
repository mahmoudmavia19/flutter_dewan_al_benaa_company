import 'package:dewan_al_benaa_company/presentation/project_details_screen/controller/project_details_controller.dart';
import 'package:get/get.dart';

class ProjectDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProjectDetailsController());
  }
}
