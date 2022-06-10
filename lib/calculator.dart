import 'dart:math';

class calculator {
  calculator({required this.height, required this.weight});

  final int height;
  final int weight;
  double? _bmi;
  calculatebmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  getResult() {
    if (_bmi! >= 25) {
      return 'Overweight';
    } else if (_bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  getInterpretation() {
    if (_bmi! >= 25) {
      return 'You have a higher than the nornal body weight. Try to exercise more';
    } else if (_bmi! > 18.5) {
      return 'You have a nornal body weight.';
    } else {
      return 'You have a lower than the nornal body weight. Try to eat more';
    }
  }
}
