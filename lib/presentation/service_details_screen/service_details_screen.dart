import 'package:dewan_al_benaa_company/widgets/custom_drawable.dart';
import 'package:flutter/material.dart';
import '../../core/utils/image_constant.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/footer_app_bar.dart';

class ServiceDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        drawer: CustomDrawable(),
        body:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 300.0,width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(image: AssetImage(ImageConstant.services),fit: BoxFit.cover,opacity: 0.6),
                        ),
                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Service Details',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 36.0),),
                                SizedBox(height: 20.0,),
                                Row(
                                  children: [
                                    Text('Home  /',style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,fontSize: 18.0),),
                                    Text('  Service Details',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 18.0),),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              ],
                            )
                        ),
                      ),
                      SizedBox(height: 50.0,),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Image.asset(ImageConstant.service,
                              width: 700,),
                            SizedBox(height: 20,),
                            Container(
                              width: 700,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                   ListTile(
                                     title: Text('Temporibus et in vero dicta aut eius lidero plastis trand lined voluptas dolorem ut voluptas'),
                                     subtitle:Column(
                                       children: [
                                         SizedBox(height: 10.0,),
                                         Text('Blanditiis voluptate odit ex error ea sed officiis deserunt. Cupiditate non consequatur et doloremque consequuntur. Accusantium labore reprehenderit error temporibus saepe perferendis fuga doloribus vero. Qui omnis quo sit. Dolorem architecto eum et quos deleniti officia qui.'),
                                         SizedBox(height: 10.0,),
                                         Padding(
                                           padding: const EdgeInsets.only(right: 10.0),
                                           child: Column(
                                             children: [
                                               Row(
                                                 children: [
                                                   Icon(Icons.check_circle_outline,color: Colors.blueAccent,),
                                                   SizedBox(width: 10.0,),
                                                   Expanded(child: Text('Aut eum totam accusantium voluptatem.')),
                                                 ],
                                               ),
                                               SizedBox(height: 10.0,),
                                               Row(
                                                 children: [
                                                   Icon(Icons.check_circle_outline,color: Colors.blueAccent,),
                                                   SizedBox(width: 10.0,),
                                                   Expanded(child: Text('Aut eum totam accusantium voluptatem.')),
                                                 ],
                                               ),
                                               SizedBox(height: 10.0,),
                                               Row(
                                                 children: [
                                                   Icon(Icons.check_circle_outline,color: Colors.blueAccent,),
                                                   SizedBox(width: 10.0,),
                                                   Expanded(child: Text('Aut eum totam accusantium voluptatem.')),
                                                 ],
                                               ),
                                             ],
                                           ),
                                         ),
                                         SizedBox(height: 10.0,), 
                                         Text('Est reprehenderit voluptatem necessitatibus asperiores neque sed ea illo. Deleniti quam sequi optio iste veniam repellat odit. Aut pariatur itaque nesciunt fuga.'),
                                       ],
                                     ),
                                     titleTextStyle: TextStyle(color: Color(0xFF364D59),fontSize: 26.0,fontWeight: FontWeight.bold),
                                     subtitleTextStyle: TextStyle(color: Color(0xFF364D59),fontSize: 18.0),
                                   )
                                  ],
                                ))

                          ],
                        ),
                      )
                     ],
                  ),
                  CustomAppBar(),
                ],
              ),
              FooterAppBar()
            ],
          ),
        ),
      ),
    );
  }
}
