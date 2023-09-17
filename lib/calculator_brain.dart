import 'dart:math';

import 'main.dart';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;
  double bmi=0;

  String calculateBMI() {
    // Remove the 'double' type from 'bmi' variable declaration
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (bmi > 24) {
      return 'OverWeight';
    } else {
      if (bmi > 18.5) {
        return 'Normal';
      } else {
        return 'UnderWeight';
      }
    }
  }

  String getInterpretation() {
    if (bmi >= 25) {
      return 'You have a higher than normal weight. Try to exercise more.';
    } else if (bmi > 18.5) {
      return 'You have normal body weight. Well Done.';
    } else {
      return 'You have lower than normal body weight. You can eat a bit more.';
    }
  }
}
