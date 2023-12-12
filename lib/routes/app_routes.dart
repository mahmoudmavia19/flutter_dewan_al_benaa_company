import 'package:dewan_al_benaa_company/presentation/about_screen/about_screen.dart';
import 'package:dewan_al_benaa_company/presentation/contact_us_screen/contant_us_screen.dart';
import 'package:dewan_al_benaa_company/presentation/project_details_screen/binding/project_details_binding.dart';
import 'package:dewan_al_benaa_company/presentation/project_details_screen/project_details_screen.dart';
import 'package:dewan_al_benaa_company/presentation/projects_screen/binding/projects_binding.dart';
import 'package:dewan_al_benaa_company/presentation/projects_screen/projects_screen.dart';
import 'package:dewan_al_benaa_company/presentation/service_details_screen/service_details_screen.dart';
import 'package:dewan_al_benaa_company/presentation/services_screen/binding/about_binding.dart';
import 'package:dewan_al_benaa_company/presentation/services_screen/services_screen.dart';
import 'package:get/get.dart';

import '../presentation/about_screen/binding/about_binding.dart';
import '../presentation/home_screen/binding/home_binding.dart';
import '../presentation/main_screen.dart';

class AppRoutes {
  static const String homeScreen = '/';
  static const String projectsScreen = '/projects';
  static const String projectDetailsScreen = '/projectDetails';
  static const String servicesScreen = '/Services';
  static const String serviceDetailsScreen = '/ServiceDetails';
  static const String aboutScreen = '/about';
  static const String contactScreen = '/contact-us';

  static const String initialRoute = '/';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => MainScreen(),
      bindings: [
        HomeBinding(),
        ServicesBinding(),
        AboutBinding(),
        ProjectsBinding()

      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => MainScreen(),
      bindings: [
        HomeBinding(),
        ServicesBinding(),
        AboutBinding(),
        ProjectsBinding()
      ],
    ),
    GetPage(
      name: aboutScreen,
      page: () => AboutScreen(),
      bindings: [
        AboutBinding(),
        ProjectsBinding(),
        HomeBinding()
      ],
    ),
    GetPage(
      name: servicesScreen,
      page: () => ServicesScreen(),
      bindings: [
        ServicesBinding(),
        ProjectsBinding(),
        HomeBinding()
      ],
    ),
    GetPage(
      name: projectsScreen,
      page: () => ProjectsScreen(),
      bindings: [
        ProjectsBinding(),
        HomeBinding()
      ],
    ),
    GetPage(
      name: serviceDetailsScreen,
      page: () => ServiceDetailsScreen(),
      bindings: [
        HomeBinding(),
        ProjectsBinding(),
      ],
    ),
    GetPage(
      name: projectDetailsScreen,
      page: () => ProjectDetailsScreen(itemKey:Get.parameters['key']!),
      bindings: [
        HomeBinding() ,
        ProjectsBinding(),
        ProjectDetailsBinding()
      ],
    ),
    GetPage(
      name: contactScreen,
      page: () =>ContactUsScreen(),
      bindings: [
        HomeBinding() ,
        ProjectsBinding(),
      ],
    ),
  ];
}
