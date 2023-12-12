
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app_export.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await getAssetImages() ;
    Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init(),

  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    print('------------------------------');
   mapImages.forEach((key, value) {
     print('$key count is ${value.length}');
   });
    print('certificates count is ${certificates.length}');


    print('------------------------------');
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cardTheme: CardTheme(
          color: Colors.white
        ),
        scaffoldBackgroundColor: Color(0xFFF5F6F7),
        visualDensity: VisualDensity.standard,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white ,
        ),
         listTileTheme: ListTileThemeData(
           iconColor: Colors.white,
           titleTextStyle: TextStyle(
             fontSize: 16.0,
             fontWeight: FontWeight.bold,
           )
         ),
         textButtonTheme: TextButtonThemeData(
           style: ButtonStyle(
             textStyle: MaterialStatePropertyAll(
               TextStyle(
                   color: Colors.white ,
                 fontWeight: FontWeight.bold,
                 fontSize: 16.0,
               ),
             ),
             foregroundColor: MaterialStatePropertyAll(Colors.white)
           )
         ),
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white
        )
      ),
      translations: AppLocalization(),
      locale: const Locale('en', 'US'),
      //for setting localization strings
      fallbackLocale: const Locale('ar', 'AA'),
      title: 'co_name'.tr,
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
