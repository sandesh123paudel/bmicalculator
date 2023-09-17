import 'package:flutter/material.dart';
import '../constants.dart';
class ButtomButton extends StatelessWidget {

  const ButtomButton({super.key, required this.onPress, required this.buttonTitle});

  final Function() onPress;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(child: Text(buttonTitle,style: klargeButtonTextStyle,)),
        color: kbottomContainerColour,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 20.0),
        height: kbottomContainerHeight,

      ),
    );
  }
}