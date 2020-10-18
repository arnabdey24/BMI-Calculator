import 'package:audioplayers/audio_cache.dart';
import 'bmiCalculator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'OurCard.dart';
import 'GenCard.dart';
import 'Button_icon.dart';
import 'Result_page.dart';

const numberStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);

enum Gender { male, female }

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Gender select;
  int height = 150;
  int weight = 50;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          select = Gender.male;
                        });
                      },
                      child: OurCard(
                          colour: select == Gender.male
                              ? Colors.blue
                              : Colors.white10,
                          child: GenCard(
                            icon: FontAwesomeIcons.mars,
                            label: "MALE",
                          )),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          select = Gender.female;
                        });
                      },
                      child: OurCard(
                          colour: select == Gender.female
                              ? Colors.blue
                              : Colors.white10,
                          child: GenCard(
                            icon: FontAwesomeIcons.venus,
                            label: "FEMALE",
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: OurCard(
                colour: Colors.white10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: textStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: numberStyle,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "cm",
                          style: textStyle.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      max: 220,
                      min: 120,
                      onChanged: (double newVal) {
                        setState(() {
                          height = newVal.round();
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: OurCard(
                      colour: Colors.white10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: textStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: numberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ButtonIcon(
                                tag: '1',
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight -= 1;
                                    if (weight < 0) weight = 0;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ButtonIcon(
                                tag: '2',
                                onPress: () {
                                  setState(() {
                                    weight += 1;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: OurCard(
                      colour: Colors.white10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: textStyle,
                          ),
                          Text(
                            age.toString(),
                            style: numberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ButtonIcon(
                                tag: "3",
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age -= 1;
                                    if (age < 0) age = 0;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ButtonIcon(
                                tag: '4',
                                onPress: () {
                                  setState(() {
                                    age += 1;
                                  });
                                },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                if(select!=null) {
                  BMI bmi = BMI(height, weight);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      ResultPage(
                        value: bmi.value(),
                        status: bmi.getStatus(),
                        msg: bmi.getMsg(),
                      )));
                }
                else{
                  AudioCache player=AudioCache();
                  player.play("beep.wav");
                  print("arnab");

                }
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'CALCULATE',
                  style: numberStyle.copyWith(fontSize: 30,),
                ),
                margin: EdgeInsets.only(top: 10),
                color: (select==null)?Colors.indigo:Colors.blue,
                height: 70,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
