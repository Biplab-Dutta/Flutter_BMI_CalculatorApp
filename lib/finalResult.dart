import 'dart:math';

class FinalResult {
  FinalResult({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5 && _bmi < 25) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getFeedback() {
    if (_bmi >= 25) {
      return 'Your body weight seems to be high. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job.';
    } else {
      return 'Your body weight seems to be low. You should eat more.';
    }
  }
}
