import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.ontap, @required this.title});
  final Function ontap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        padding: EdgeInsets.only(top: 15),
        color: Colors.red,
        height: 80,
        width: double.infinity,
        child: Center(
            child: Text(
          '$title',
          style: TextStyle(color: Colors.white, fontSize: 30),
        )),
      ),
    );
  }
}
