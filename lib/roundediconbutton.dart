import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({Key? key, this.icon, required this.onpress})
      : super(key: key);
  final IconData? icon;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onpress();
      },
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 6,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
