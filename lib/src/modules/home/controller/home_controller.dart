import 'package:flutter/widgets.dart';
import 'package:study_flutter_mvvm/src/modules/home/model/person_model.dart';

class HomeController with ChangeNotifier {
  String imcRange = '';

  void calculateImc({required String height, required String weight}) {
    final heightValue = double.tryParse(height) ?? 0.0;
    final weightValue = double.tryParse(weight) ?? 0.0;

    final person = PersonModel(height: heightValue, weight: weightValue);
    final imcValue = person.imcValue;

    if (heightValue <= 0.0 && weightValue <= 0.0) {
      imcRange = '';
    }

    if (imcValue < 18.5) {
      imcRange = 'Underweight';
    } else if (imcValue >= 18.5 && imcValue < 25) {
      imcRange = 'Healthy';
    } else if (imcValue >= 25 && imcValue < 30) {
      imcRange = 'Overweight';
    } else {
      imcRange = 'Obese';
    }

    notifyListeners();
  }
}
