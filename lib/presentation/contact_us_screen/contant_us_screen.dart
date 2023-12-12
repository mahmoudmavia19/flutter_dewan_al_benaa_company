import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:dewan_al_benaa_company/widgets/custom_app_bar.dart';
import 'package:dewan_al_benaa_company/widgets/footer_app_bar.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_drawable.dart';

class ContactUsScreen extends StatelessWidget {
  GlobalKey<FormState> _key = GlobalKey();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerDes = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
          drawer: CustomDrawable(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
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
                              Text('Contact Us'.tr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 36.0),),
                              SizedBox(height: 20.0,),
                              Row(
                                children: [
                                  Text('Home  /'.tr,style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,fontSize: 18.0),),
                                  Text('  Contact Us'.tr,style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 18.0),),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            ],
                          )
                      ),
                    ),
                    CustomAppBar()
                  ],
                ),
                Wrap(
                  children: [
                    SizedBox(
                      width: 500.0,
                      height: 550.0,
                      child: Card(
                        margin: EdgeInsets.all(20.0),
                        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blueAccent),borderRadius: BorderRadius.circular(15.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Image.asset(ImageConstant.logo,width: 250.0,),
                              SizedBox(height: 20.0,),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.blueAccent,
                                      foregroundColor: Colors.white,
                                      child: Icon(Icons.email)),
                                  SizedBox(width: 10.0,),
                                  Text('DEWANALBENA@GMAIL.COM'),
                                ],
                              ),
                              SizedBox(height: 20.0,),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.blueAccent,
                                      foregroundColor: Colors.white,
                                      child: Icon(Icons.phone)),
                                  SizedBox(width: 10.0,),
                                  Text('0138646000'),
                                ],
                              ),
                              SizedBox(height: 20.0,),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.blueAccent,
                                      foregroundColor: Colors.white,
                                      child: Icon(Icons.phone)),
                                  SizedBox(width: 10.0,),
                                  Text('0552422000'),
                                ],
                              ),
                              SizedBox(height: 20.0,),
                              Row(
                                children: [
                                  CircleAvatar(
                                      backgroundColor: Colors.blueAccent,
                                      foregroundColor: Colors.white,
                                      child: Icon(Icons.fax)),
                                  SizedBox(width: 10.0,),
                                  Text('0138646688'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Form(
                      key: _key,
                      child: SizedBox(
                        width: 500.0,
                        child: Card(
                          shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blueAccent),borderRadius: BorderRadius.circular(15.0)),
                          margin: EdgeInsets.all(20.0),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                _textForm(_controllerName, Icons.person),
                                _textForm(_controllerDes, Icons.description,lines: 5),
                                SizedBox(
                                  height: 20.0,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      if (_key.currentState!.validate()) {
                                        sendEmail(_controllerName.text,
                                           'DEWANALBENA@GMAIL.COM',
                                            _controllerDes.text) ;
                                      }
                                    },
                                    child: Text('Send'.tr))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                FooterAppBar()
              ],
            ),
          )),
    );
  }

  _textForm(controller, icon, {int? lines}) =>
        Padding(
          padding: EdgeInsets.all(20),
          child: TextFormField(
            maxLines: lines,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please fill this box'.tr;
              }
              if(icon==Icons.email){
                if(!isEmailValid(value)){
                  return 'Please enter valid email'.tr;
                }
              }
            },
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              suffixIcon: Icon(icon),
            ),
          ),
        )
      ;
}
