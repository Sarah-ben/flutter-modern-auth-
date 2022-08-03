

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/componenets/components.dart';
import '../Authentification/login/login_screen.dart';


class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List <BoardingModel>model=[
    BoardingModel(img: 'assets/images/splash_logo.PNG', title: 'Feel yourself like a barista', body:'Magic coffee on order'),
    BoardingModel(img: 'assets/images/splash_logo.PNG', title: 'Feel yourself like a barista', body:'Magic coffee on order'),
    BoardingModel(img: 'assets/images/splash_logo.PNG', title: 'Feel yourself like a barista', body:'Magic coffee on order'),
    ];
  bool isLast=false;
  PageController controller=PageController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 530,
                child: PageView.builder(
                  onPageChanged: (int i){
                    if(i==model.length-1){
                      setState(() {
                        isLast=true;
                      });
                    }else{
                      setState(() {
                        isLast=false;
                      });
                    }
                  },
                  controller:controller,
                  physics:const BouncingScrollPhysics(),
                  itemBuilder: (context,index)=>
                      buildBoardingItem(context,model[index]),
                  itemCount:3,
                ),
              ),

              SmoothPageIndicator(controller: controller,
                  effect: const ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Color.fromRGBO(50, 74, 89, 1),
                      dotHeight: 10.0,
                      expansionFactor: 4,
                      dotWidth:10 ,
                      spacing: 5.0
                  ),
                  count: model.length),

              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child:            defaultButton(  (){
                  if(isLast){
                    submit();
                  }
                  else{
                    controller.nextPage(duration:const Duration(milliseconds: 750), curve: Curves.fastLinearToSlowEaseIn);
                  }
                }),

              ),

            ],
          ),
        )
    );
  }

  Widget buildBoardingItem(context, BoardingModel model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children:  [
      SizedBox(
        child: Container(

          decoration:const BoxDecoration(

          ),
            width:double.infinity,
            height: 355,
            child:Image(image:AssetImage(model.img) ,)),
      ),
      const  SizedBox(height: 20.0,),
      Padding(

        padding: const EdgeInsets.symmetric(horizontal: 90.0),
        child: Text(

          '${model.title}',
          textAlign: TextAlign.center,
          style:const TextStyle(
height: 1.5,
              fontSize: 30.0,
              fontWeight: FontWeight.w400,

          ),
        ),
      ),
      const  SizedBox(height: 15.0,),
      Text(
        '${model.body}',
        style: const TextStyle(
          color: Colors.grey,
            fontSize: 16.0,

        ),
      ),
    ],
  );
  void submit(){

        navigateAndReplace(context, LoginScreen());

  }
}
class BoardingModel{
  final  img;
  final title;
  final body;
  BoardingModel({required this.img,required this.title,required this.body});
}
