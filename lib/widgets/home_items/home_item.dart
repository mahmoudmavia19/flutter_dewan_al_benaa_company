import 'package:carousel_slider/carousel_slider.dart';
import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:flutter/material.dart';
import '../../presentation/home_screen/controller/home_controller.dart';
class HomeItem extends  GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
       alignment: Alignment.center,
      children: [
        Container(
          color: Colors.black,
          child: Opacity(
            opacity:0.3,
            child: CarouselSlider.builder(
              itemCount: ImageConstant.carousel_sliders.length,
              itemBuilder: (context, index, realIndex) {
                return Image.asset(ImageConstant.carousel_sliders[index],width: double.infinity ,fit: BoxFit.cover);
              },
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                viewportFraction:   1 ,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(seconds: 2),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width:300.0,
                child: Text('Welcome to '.tr+'co_name'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,fontSize: 36.0,
                    fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 20.0,),
              Container(
                width: 70.0,
                height: 4.0,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(2.5),
              ),),
              SizedBox(height: 20.0,),
              SizedBox(
                width: 400.0,
                  child: Text('Vision'.tr ,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[200],fontSize: 18.0),)),
              SizedBox(height: 20.0,),
              ElevatedButton(onPressed:  () {
               controller.scrollController.animateTo(700.0, duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
              }, child: Text('Get Started'.tr),
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                elevation: MaterialStatePropertyAll(0.0),
                shape:MaterialStatePropertyAll(RoundedRectangleBorder(side: BorderSide(width: 2.0,color: Colors.blueAccent),borderRadius: BorderRadius.circular(25.0))),
                overlayColor: MaterialStatePropertyAll(Colors.blueAccent)
              ),)
            ],
          ),
        )
      ],
    );
  }
}
