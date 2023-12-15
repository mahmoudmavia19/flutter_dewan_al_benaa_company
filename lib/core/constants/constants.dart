/*
import 'package:flutter/material.dart';

List<GlobalKey> itemsKey = [
  GlobalKey(debugLabel:'0'),
  GlobalKey(debugLabel:'1'),
  GlobalKey(debugLabel:'2'),
  GlobalKey(debugLabel:'3'),
  GlobalKey(debugLabel:'4'),
];
*/
import 'dart:convert';

import 'package:dewan_al_benaa_company/data/models/project_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import '../app_export.dart';

Map<String,List<String>> mapImages= {
 'al_shabili':[],
 'chamber_of_commerce':[] ,
 'the_cultural_center':[],
 'sea_front':[],
 'light_the_racket':[],
 'jubail_insulators':[],
 'al_nawras_villas':[],
 'al_khobar_and_shuaiba_halls':[]
};

List<String> certificates = [];
List<String> ourProjects = [];
Future<void> getAssetImages() async {
  final manifestContent = await rootBundle.loadString('AssetManifest.json');
  final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    var list = manifestMap.keys
      .where((String key) => key.startsWith('assets/images/'))
      .toList() ;
    for(var item in list){
      for(var itemPath in mapImages.keys.toList()){
        if(item.contains(itemPath)){
          mapImages[itemPath]?.add(item);
        }
      }
      if(item.contains('certificates')){
        certificates.add(item) ;
      }
      if(item.contains('our_projects')){
        ourProjects.add(item) ;
      }
    }
}


bool isEmailValid(String email) {
  // Define a regular expression for a valid email address
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
  );

  // Use the RegExp's `hasMatch` method to check if the email is valid
  return emailRegex.hasMatch(email);
}
void sendEmail(String name, String email, String description) async {
  final subject = '$name';
  final body = '$description';

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {
      'subject': subject,
      'body': body,
    },
  );

  if (await canLaunch(emailLaunchUri.toString())) {
    await launch(emailLaunchUri.toString());
  } else {
    // Handle error, for example, show an error dialog
    Get.dialog(AlertDialog(
        title: Text('Error'),
        content: Text('Could not launch email client.'),
        actions: [
          TextButton(
            onPressed: () {
             Get.back();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}




List<Map<String,dynamic>> projectsMapEN =[
    {
      "id": 1,
      "cost": 1100000,
      "entity": "Ministry of Defense",
      "description": "Developing the entrance to the Institute of Maritime Studies - Dammam"
    },
    {
      "id": 2,
      "entity": "Ministry of Defense",
      "cost": 740000,
      "description": "Restoration and improvement of workers' barracks - Dammam"
    },
    {
      "id": 3,
      "cost": 1276000,
      "entity": "Ministry of Interior",
      "description": "Prison administration maintenance - Dammam"
    },
    {
      "id": 4,
      "cost": 3939004,
      "entity": "Ministry of Education",
      "description": "Establishing an elementary and middle school - Dammam"
    },
    {
      "id": 5,
      "cost": 947150,
      "entity": "Ministry of Defense",
      "description": "Armory restoration - Dammam"
    },
    {
      "id": 6,
      "cost": 1924940,
      "entity": "Ministry of Education",
      "description": "Rehabilitation of Rahima School"
    },
    {
      "id": 7,
      "entity": "Ministry of Education",
      "cost": 879360,
      "description": "Rehabilitation of the Gulf School"
    },
    {
      "id": 8,
      "cost": 1114964,
      "entity": "Marine forces",
      "description": "Restoration and modernization of the workers' restaurant - Dammam"
    },
    {
      "id": 9,
      "cost": 1399600,
      "entity": "Ministry of Education",
      "description": "Rehabilitation of Al-Abbas bin Abdul-Muttalib School - Khobar"
    },
    {
      "id": 10,
      "cost": 1296630,
      "entity": "Ministry of Education",
      "description": "Rehabilitation of Hazm Umm Al-Sahek School"
    },
    {
      "id": 11,
      "cost": 1494750,
      "entity": "Ministry of Education",
      "description": "Rahima secondary restoration"
    },
    {
      "id": 12,
      "cost": 959350,
      "entity": "Ministry of Education",
      "description": "Creating a canopy for Hateen School - Dammam"
    },
    {
      "id": 13,
      "cost": 16282300,
      "investor": "Sami Al-Ghanim",
      "description": "Construction of Dewan ALbena towers buildings in Al-Khobar"
    },
    {
      "id": 14,
      "cost": 1700000,
      "investor": "Al-Mustathem Al-Qahtani",
      "description": "Building a private villa - Khobar"
    },
    {
      "id": 15,
      "cost": 1700000,
      "entity": "Marine forces",
      "description": "Restoration of the light vehicle workshop - Dammam"
    },
    {
      "id": 16,
      "cost": 2814540,
      "entity": "Marine forces",
      "description": "Establishment of the gymnasium in the naval forces in Dammam"
    },
    {
      "id": 17,
      "cost": 3716565,
      "investor": "Al-Mustathem Al-Qahtani",
      "description": "Building 2 villas in the desalination scheme - Al-Khobar"
    },
    {
      "id": 18,
      "cost": 9749970,
      "entity": "Municipality of Al-Khafji Governorate",
      "description": "Completion project of Al-Khafji Civilization Center Building"
    },
    {
      "id": 19,
      "cost": 12150500,
      "investor": "Dawa International Company",
      "description": "A project to establish exhibitions and offices for Dawa International Markets in Al-Rakah"
    },
    {
      "id": 20,
      "cost": 17890770,
      "entity": "Eastern Chamber of Commerce",
      "description": "Construction of the Chamber of Commerce building in Khafji"
    },
    {
      "id": 21,
      "cost": 7750000,
      "investor": "International Dawa Company",
      "description": "A project to complete the construction of Dawa factory for steel houses and glass tempering in the Second Industrial City in Dammam"
    },
    {
      "id": 22,
      "cost": 11896195,
      "entity": "Saline Water Conversion Corporation",
      "description": "A project to develop and rehabilitate 26 training halls in the training center - desalination of salt water in Jubail"
    },
    {
      "id": 23,
      "cost": 259380,
      "entity": "Saline Water Conversion Corporation",
      "description": "Project of supplying a display screen for the meeting hall - the social hall, the training center in Jubail"
    },
    {
      "id": 24,
      "cost": 785700,
      "entity": "Saline Water Conversion Corporation",
      "description": "A project to rehabilitate and equip the laboratory at the Saline Water Desalination Training Center in Jubail"
    },
    {
      "id": 25,
      "cost": 699800,
      "entity": "Saline Water Conversion Corporation",
      "description": "The project of establishing and equipping the trainees' housing warehouse at the Jubail Training Center"
    },
    {
      "id": 26,
      "cost": 699800,
      "investor": "Rambla company Phase 1",
      "description": "Establishment of a group of villas and chalets owned Rambla company at Abha city phase 1"
    },
    {
      "id": 27,
      "cost": 13167000,
      "entity": "Municipality of Al-Khafji Governorate",
      "description": "Al-Khafji waterfront development project"
    },
    {
      "id": 28,
      "cost": 9868900,
      "entity": "Saudi Water Academy",
      "description": "Rehabilitation of insulators and all entrances to the training center in Jubail"
    },
    {
      "id": 29,
      "cost": 7650000,
      "investor": "Rambla company Phase 2",
      "description": "Establishment of a group of villas and chalets owned Rambla company at Abha city phase 2"
    },
    {
      "id": 30,
      "cost": 2677170,
      "entity": "Aramco Saudi Arabia",
      "description": "Contract for the installation of interlocks and curbstone as a subcontractor of Synhydro Company, owned by Saudi Aramco, with Tanajib"
    },
    {
      "id": 31,
      "cost": 1579300,
      "entity": "Saudi Water Academy",
      "description": "Rehabilitation of Al-Khobar and Al-Shuaiba halls and the computer technical support laboratory at the Saudi Water Academy in Jubail"
    },
    {
      "id": 32,
      "cost": 8634300,
      "investor": "Dewan Albena Company",
      "description": "Construction of Al-Nawras Villas in Al-Khobar"
    },
    {
      "id": 33,
      "cost": 4249472,
      "investor": "Abdul Rahman Al-Qahtani",
      "description": "Construction of a residential tower owned by Abdul Rahman Al-Qahtani in Al-Shubaily"
    }
  ];
List<Map<String,dynamic>>  projectsMapAR = [
    {
      "id": 1,
      "cost": 1100000,
      "entity": "وزارة الدفاع",
      "description": "تطوير مدخل معهد الدراسات البحرية بالدمام"
    },
    {
      "id": 2,
      "cost": 740000,
      "entity": "وزارة الدفاع",
      "description": "ترميم وتحسين بركس العمال بالدمام"
    },
    {
      "id": 3,
      "cost": 1276000,
      "entity": "وزارة الداخلية",
      "description": "صيانة إدارة السجون بالدمام"
    },
    {
      "id": 4,
      "cost": 3939004,
      "entity": "وزارة التربية والتعليم",
      "description": "إنشاء إبتدائية ومتوسطه يكرب بالدمام"
    },
    {
      "id": 5,
      "cost": 947150,
      "entity": "وزارة الدفاع",
      "description": "ترميم مستودع السالح بالدمام"
    },
    {
      "id": 6,
      "cost": 1924940,
      "entity": "وزارة التربية والتعليم",
      "description": "تأهيل مدرسة رحيمة"
    },
    {
      "id": 7,
      "cost": 879360,
      "entity": "وزارة التربية والتعليم",
      "description": "تأهيل مدرسة الخليج بالدمام"
    },
    {
      "id": 8,
      "cost": 1114964,
      "entity": "القوات البحرية",
      "description": "ترميم وتحديث مطعم العمال بالدمام"
    },
    {
      "id": 9,
      "cost": 1399600,
      "entity": "وزارة التربية والتعليم",
      "description": "تأهيل مدرسة العباس بن عبدالمطلب بالخبر"
    },
    {
      "id": 10,
      "entity": "وزارة التربية والتعليم",
      "cost": 1296630,
      "description": "تأهيل مدرسة حزم ام الساهك"
    },
    {
      "id": 11,
      "entity": "وزارة التربية والتعليم",
      "cost": 1494750,
      "description": "ترميم ثانوية رحيمه"
    },
    {
      "id": 12,
      "cost": 959350,
      "entity": "وزارة التربية والتعليم",
      "description": "إنشاء مظلة لمدرسة حطين بالدمام"
    },
    {
      "id": 13,
      "cost": 16282300,
      "investor": "سامي الغانم",
      "description": "تنفيذ أبراج ديوان البناء بالخبر"
    },
    {
      "id": 14,
      "cost": 1700000,
      "investor": "المستثمر القحطاني",
      "description": "بناء فيال خاصة بعزيزية الخبر"
    },
    {
      "id": 15,
      "cost": 1700000,
      "entity": "القوات البحرية",
      "description": "ترميم ورشة العربات الخفيفة بالدمام"
    },
    {
      "id": 16,
      "cost": 2814540,
      "entity": "القوات البحرية",
      "description": "إنشاء الصالة الرياضية بالقوات البحرية بالدمام"
    },
    {
      "id": 17,
      "cost": 3716565,
      "investor": "المستثمر القحطاني",
      "description": "بناء 2 فيال بمخطط التحلية بالخبر"
    },
    {
      "id": 18,
      "cost": 9749970,
      "entity": "بلدية محافظه الخفجي",
      "description": "مشروع إستكمال مبني المركز الحضاري بالخفجي"
    },
    {
      "id": 19,
      "cost": 12150500,
      "investor": "شركة ضوي العالمية",
      "description": "مشروع إنشاء معارض ومكاتب أسواق ضوي العالمية بالراكه"
    },
    {
      "id": 20,
      "cost": 17890770,
      "entity": "الغرفة التجارية بالشرقية",
      "description": "مشروع إنشاء مبني الغرفة التجارية بالخفجي"
    },
    {
      "id": 21,
      "cost": 7750000,
      "investor": "شركة ضوي العالمية",
      "description": "مشروع إستكمال إنشاء مصنع ضوي للبيوت الحديدية وتقصية الزجاج بالصناعية الثانية بالدمام"
    },
    {
      "id": 22,
      "cost": 11896195,
      "entity": "المؤسسة العامة لتحلية المياه المالحه",
      "description": "مشروع تطوير وتأهيل عدد 26 قاعة تدريبية بمركز التدريب - بتحلية المياه المالحه بالجبيل"
    },
    {
      "id": 23,
      "cost": 259380,
      "entity": "المؤسسة العامة لتحلية المياه المالحه",
      "description": "مشروع توريد شاشة عرض لقاعه اإلجتماعات – الصالة اإلجتماعية بمركز التدريب بالجبيل"
    },
    {
      "id": 24,
      "cost": 785700,
      "entity": "المؤسسة العامة لتحلية المياه المالحه",
      "description": "مشروع إعاده تأهيل وتجهيز معمل المختبر بمركز التدريب بتحلية المياه المالحة بالجبيل"
    },
    {
      "id": 25,
      "cost": 699800,
      "entity": "المؤسسة العامة لتحلية المياه المالحه",
      "description": "مشروع إنشاء وتجهيز مستودع سكن المتدربين بمركز التدريب بالجبيل"
    },
    {
      "id": 26,
      "cost": 13167000,
      "investor": "شركة رامبال",
      "description": "إنشاء منتجع رامبال السياحي المرحلة االولى بمدينة ابها"
    },
    {
      "id": 27,
      "cost": 9868900,
      "entity": "بلدية محافظه الخفجي",
      "description": "مشروع تطوير الواجهه البحرية بالخفجي"
    },
    {
      "id": 28,
      "cost": 3417200,
      "entity": "أكاديمية السعودية للمياه",
      "description": "مشروع إعادة تأهيل عوازل وجميع مداخل مركز التدريب بالجبيل"
    },
    {
      "id": 29,
      "cost": 7650000,
      "investor": "شركة رامبال",
      "description": "إنشاء منتج رامبال السياحي المرحلة الثانية بمدينة ابها"
    },
    {
      "id": 30,
      "cost": 2677170,
      "entity": "أرامكو السعودية",
      "description": "عقد تركيب إنترلوك وبلدورات كمقاول باطن لشركة سينهيدرو للمالك أرامكو السعودية بتناجيب"
    },
    {
      "id": 31,
      "cost": 1579300,
      "entity": "أكاديمية السعودية للمياه",
      "description": "إعادة تأهيل قاعتى الخبر والشعيبة ومعمل الدعم الفني للحاسب اآللى بالجبيل"
    },
    {
      "id": 32,
      "cost": 8634300,
      "investor": "شركة ديوان البناء",
      "description": "مشروع إنشاء فلل النورس بالخبر"
    },
    {
      "id": 33,
      "cost": 4249472,
      "investor": "عبدالرحمن القحطاني",
      "description": "تنفيذ برج سكني عبدالرحمن القحطاني بالشبيلي بالخبر"
    }
  ];