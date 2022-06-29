import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:task_1/shared/navigation_function.dart';

import '../../shared/on_boarding_item.dart';
import '../Registeration/login.dart';
import '../Registeration/signup.dart';


class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
    
    var boardController = PageController();
    
    List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/onBoarding/Coffee shop-amico.png',
      title: 'On Board 1 Title',
      body: 'On Board 1 Body',
    ),
    BoardingModel(
      image: 'assets/onBoarding/Image post-bro.png',
      title: 'On Board 2 Title',
      body: 'On Board 2 Body',
    ),
    BoardingModel(
      image: 'assets/onBoarding/Pasta-pana.png',
      title: 'On Board 3 Title',
      body: 'On Board 3 Body',
    ),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  navigateFinalTo(context, LoginScreen());
                }, 
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: HexColor('#7E57C2'),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 5, bottom : 5, left : 10, right: 10),
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                      ),
                    )
                  )
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) => OnBoardingItem(
                  image : boarding[index].image,
                  body : boarding[index].body,
                  title : boarding[index].title 
                ),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(height: 20.0),
            SmoothPageIndicator(
              controller: boardController,
              effect:  ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: HexColor('#7E57C2'),
                dotHeight: 10,
                expansionFactor: 4,
                dotWidth: 10,
                spacing: 5.0,
              ),
              count: boarding.length,
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // <-- Radius
                  ),
                  primary: HexColor("#7E57C2")
                ),
                onPressed: () {
                  if (isLast)
                  {
                    navigateFinalTo(context, LoginScreen());
                  } else {
                    boardController.nextPage(
                      duration: const Duration(
                        milliseconds: 750,
                      ),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10) ,
                  child: Text(
                    isLast? 'Get Started' : "Next",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white
                    ),
                  )
                ),
              )
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Sign-UP',
                    style: TextStyle(
                      color: HexColor("#7E57C2"),
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () { 
                      navigateFinalTo(context, const SignUpScreen());
                    }
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
