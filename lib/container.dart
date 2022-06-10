import 'package:flutter/material.dart';

class container extends StatelessWidget {
  container({this.colours, this.containerchild, this.onPress});

  final Color? colours;
  final Widget? containerchild;
  final Function? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress!();
      },
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colours,
          borderRadius: BorderRadius.circular(15),
        ),
        child: containerchild,
      ),
    );
  }
}
