import 'package:findmyjob/constants/theme.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Image.asset("assets/bellhop.jpg"),
          Text(
            "Find your dream job",
            style:
                blackTextFont.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16,),
          Text(
              "You do not have the right to remain\nsilent, let us know what it takes to challenge you",
              textAlign: TextAlign.center,
              style: blackTextFont.copyWith(
                  fontSize: 18)),
        SizedBox(height: 30,),
        FloatingActionButton(onPressed: (){
          Navigator.pushNamed(context, '/login');
        },
          backgroundColor: mainColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Icon(Icons.arrow_forward, size: 30,),
        )
      ],
    ),
        ));
  }
}
