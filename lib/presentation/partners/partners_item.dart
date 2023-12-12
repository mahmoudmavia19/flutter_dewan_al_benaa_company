import 'package:carousel_slider/carousel_slider.dart';
import 'package:dewan_al_benaa_company/core/app_export.dart';
import 'package:dewan_al_benaa_company/widgets/head_title_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class PartnersItem extends StatelessWidget {
  RxInt currIndex = 0.obs;
  CarouselController _controller = CarouselController();
  List<String> _items = ImageConstant.partners ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadTitleWidget(title: 'Partners'.tr),
        Stack(
          children: [
            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(10.0),
              child: CarouselSlider.builder(
                carouselController: _controller,
                  itemCount: _items.length,
                  itemBuilder: (context, index, realIndex) => Container(
                    width: 150,
                    padding: EdgeInsets.all(25.0),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Image.asset(
                          _items[index],
                      color: Colors.grey[50],
                      colorBlendMode: BlendMode.color,
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                        ),
                  ),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      currIndex.value = index;
                    },
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: 150.0,
                    viewportFraction: customViewportFraction(context),
                    autoPlay: true,
                    autoPlayCurve: Curves.linear
                  )),
            ),
            Container(
              height: 200.0,
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  CircleAvatar(backgroundColor: Colors.grey.withOpacity(0.5),child: IconButton(color: Colors.grey,onPressed:() {
                    _controller.previousPage();
                  }, icon:Icon(Icons.arrow_back_ios))),
                  Spacer(),
                  CircleAvatar(backgroundColor: Colors.grey.withOpacity(0.5),child: IconButton(color: Colors.grey,onPressed:() {
                    _controller.nextPage();
                  }, icon:Icon(Icons.arrow_forward_ios)))
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  double customViewportFraction(context){
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth>=1400? 0.13 : screenWidth>=1000 ? 0.17:0.5 ;
  }
}
