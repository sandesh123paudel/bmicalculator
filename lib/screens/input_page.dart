import 'results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/round_icon.dart';
import '../calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height=180;
  int weight=50;
  int age=30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        centerTitle: true,
        title: const Text('BMI Calculator'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                //ternary operator
                colour: selectedGender == Gender.male
                    ? kactiveCardColour
                    : kinactiveCardColour,
                cardChild:
                    IconContent(icon: FontAwesomeIcons.mars, label: 'MALE'),
              ),
            ),
            Expanded(
              child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                colour: selectedGender == Gender.female
                    ? kactiveCardColour
                    : kinactiveCardColour,
                cardChild:
                    IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE'),
              ),
            ),
          ],
        )),
        Expanded(
            child: ReusableCard(
                colour: kactiveCardColour, cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT',style: klabelTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:<Widget> [
                    Text(height.toString(),style: klabelTextStyle2,),

                    Text('cm',style: klabelTextStyle,)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white38,
                      inactiveTrackColor: Color(0xFF8De98),
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                  ),
                  child: Slider(

                    value: height.toDouble(),
                    min: 0.0,
                    max: 300.0,
                    onChanged: (double newValue)
                    {
                      setState(() {
                        height=newValue.round();
                        //print(height);
                      });
                    },

                  ),
                )


              ],
            ))),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child:
                  ReusableCard(colour: kactiveCardColour, cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT',style: klabelTextStyle,),
                      Text(
                        weight.toString(),
                        style: klabelTextStyle2,

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.add,
                            onPressed: ()
                            {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(width:15.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: ()
                            {
                              setState(() {
                                weight--;
                              });
                            },),


                        ],
                      )
                    ],
                  )),
            ),
            Expanded(
              child:
                  ReusableCard(colour: kactiveCardColour, cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE',style: klabelTextStyle,),
                      Text(
                        age.toString(),
                        style: klabelTextStyle2,

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.add,
                            onPressed: ()
                            {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(width:15.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: ()
                            {
                              setState(() {
                                age--;
                              });
                            },),


                        ],
                      )
                    ],
                  )),
            )
          ],
        )),
        ButtomButton(buttonTitle: 'CALCULATE',onPress: (){
          setState(() {
            CalculatorBrain calc=CalculatorBrain(height: height, weight: weight);
             Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultsPage(bmiResults:calc.calculateBMI() ,resultText:calc.getResults() ,interpretation: calc.getInterpretation(),)));
          });
        },),
      ]),
    );
  }
}





