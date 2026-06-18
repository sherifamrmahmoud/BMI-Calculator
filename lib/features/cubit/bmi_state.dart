
class BmiState {
  final String gender;
  final double height;
  final int age;
  final int weight;

  BmiState({
    required this.gender,
    required this.height,
    required this.age,
    required this.weight,
  });

  BmiState copyWith({
    String? gender,
    double? height,
    int? age,
    int? weight,
  }) {
    return BmiState(
      gender: gender ?? this.gender,
      height: height ?? this.height,
      age: age ?? this.age,
      weight: weight ?? this.weight,
    );
  }
}