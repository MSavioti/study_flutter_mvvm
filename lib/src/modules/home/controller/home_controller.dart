import 'package:study_flutter_mvvm/src/modules/home/model/person_model.dart';

class HomeController {
  String calculateImc({required double height, required double weight}) {
    final person = PersonModel(height: height, weight: weight);
    final imcValue = person.imcValue;

    if (height <= 0.0 && weight <= 0.0) {
      return '';
    }

    if (imcValue < 18.5) {
      return 'Underweight';
    } else if (imcValue >= 18.5 && imcValue < 25) {
      return 'Healthy';
    } else if (imcValue >= 25 && imcValue < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
}
