import 'package:BMI_Calculator/GenCard.dart';
import 'package:BMI_Calculator/OurCard.dart';
import 'package:flutter/material.dart';
import 'MainPage.dart';

class ResultPage extends StatelessWidget {
  final String status,value,msg;

  ResultPage({this.status, this.value, this.msg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        children: [
          Text(
            "Your Result",
            style: numberStyle,
          ),
          Expanded(
            child: OurCard(
              colour: Colors.white10,
              marginSize: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: double.infinity,
                  ),
                  Text(
                    status,
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    value,
                    style: numberStyle.copyWith(fontSize: 90),
                  ),
                  Text(
                    msg,
                    style: textStyle.copyWith(fontSize: 20,color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context,MaterialPageRoute(builder: (context)=>MainPage()));
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'RE-CALCULATE',
                style: numberStyle.copyWith(fontSize: 30,),
              ),
              margin: EdgeInsets.only(top: 10),
              color: Colors.blue,
              height: 70,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
