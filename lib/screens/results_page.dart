import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
import '../constants.dart';
import '../components/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key, required this.bmiResults, required this.resultText, required this.interpretation});
  final String bmiResults;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(30.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: ktitleTextStyle,
                ),
              )),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget>  [
                  Text(resultText.toUpperCase(),style: kresultTextStyle,),
                  Text(bmiResults,style: kbmiTextstyle,),
                  Text(interpretation.toUpperCase(),textAlign:TextAlign.center,style: kbmiBodystyle,)
                ],
              ),
            ),
          ),
          ButtomButton(
            buttonTitle: 'RE-CALCULATE',
            onPress: ()
            {
              Navigator.pop(context);

            },

          )
        ],
      ),
    );
  }
}
