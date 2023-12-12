import 'package:dewan_al_benaa_company/presentation/about_screen/controller/about_controller.dart';
import 'package:get/get.dart';

class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AboutController());
  }
}
