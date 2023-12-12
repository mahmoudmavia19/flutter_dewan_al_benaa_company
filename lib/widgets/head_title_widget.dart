import 'package:flutter/material.dart';

class HeadTitleWidget extends StatelessWidget {
  String title ;
  String subtitle ;

  HeadTitleWidget({required this.title,this.subtitle = ''});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 70.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(2.5),
                  ),),
                SizedBox(width: 20.0,),
                Text(title,style: TextStyle(color: Colors.grey[600],fontSize: 20.0,fontWeight: FontWeight.bold),),
                SizedBox(width: 20.0,),
                Container(
                  width: 70.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(2.5),
                  ),),
              ],
            ),
          ),
          SizedBox(
            width: 600.0,
              child: Text(subtitle,textAlign:TextAlign.center,style: TextStyle(color: Colors.grey),))
        ],
      ),
    );
  }
}
