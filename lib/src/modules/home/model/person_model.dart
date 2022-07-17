class PersonModel {
  final double height;
  final double weight;

  double get imcValue => weight / (height * height);

  PersonModel({
    required this.height,
    required this.weight,
  });
}
