import 'package:dewan_al_benaa_company/localization/ar_aa/ar_aa_translations.dart';
import 'package:get/get.dart';
import 'en_us/en_us_translations.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUs,
    'ar_AA':arAA
  };
}
