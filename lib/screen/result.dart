import 'package:bmi_calculater/Bottombutton.dart';
import 'package:bmi_calculater/container.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class result extends StatelessWidget {
  result(
      {Key? key,
      required this.bmiresult,
      required this.resulttext,
      required this.Interprator})
      : super(key: key);
  String bmiresult;
  String resulttext;
  String Interprator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI-CALCULATER'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(13),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: container(
              colours: Color(0xFF1D1E33),
              containerchild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '$resulttext',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$bmiresult',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 80,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$Interprator',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
              ontap: () {
                Navigator.pop(context);
              },
              title: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
