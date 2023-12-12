import 'package:carousel_slider/carousel_controller.dart';
import 'package:dewan_al_benaa_company/core/app_export.dart';

class ProjectDetailsController extends GetxController {
  CarouselController carouselController = CarouselController();
  RxInt currentPosition = 0.obs ;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}