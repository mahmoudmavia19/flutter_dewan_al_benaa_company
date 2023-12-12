import 'package:dewan_al_benaa_company/presentation/services_screen/controller/services_controller.dart';
import 'package:get/get.dart';

class ServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServicesController());
  }
}
