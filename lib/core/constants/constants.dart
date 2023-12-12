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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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