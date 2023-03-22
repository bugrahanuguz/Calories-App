// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Nutritions {
  double? servingSizeG;
  String? name;
  double? fatTotalG;
  double? calories;
  double? proteinG;
  double? carbohydratesTotalG;
  Nutritions({
    this.servingSizeG,
    this.name,
    this.fatTotalG,
    this.calories,
    this.proteinG,
    this.carbohydratesTotalG,
  });

  Nutritions copyWith({
    double? servingSizeG,
    String? name,
    double? fatTotalG,
    double? calories,
    double? proteinG,
    double? carbohydratesTotalG,
  }) {
    return Nutritions(
      servingSizeG: servingSizeG ?? this.servingSizeG,
      name: name ?? this.name,
      fatTotalG: fatTotalG ?? this.fatTotalG,
      calories: calories ?? this.calories,
      proteinG: proteinG ?? this.proteinG,
      carbohydratesTotalG: carbohydratesTotalG ?? this.carbohydratesTotalG,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'serving_size_g': servingSizeG,
      'name': name,
      'fat_total_g': fatTotalG,
      'calories': calories,
      'protein_g': proteinG,
      'carbohydrates_total_g': carbohydratesTotalG,
    };
  }

  factory Nutritions.fromMap(Map<String, dynamic> map) {
    return Nutritions(
      servingSizeG: map['serving_size_g'] != null
          ? map['serving_size_g'] as double
          : null,
      name: map['name'] != null ? map['name'] as String : null,
      fatTotalG:
          map['fat_total_g'] != null ? map['fat_total_g'] as double : null,
      calories: map['calories'] != null ? map['calories'] as double : null,
      proteinG: map['protein_g'] != null ? map['protein_g'] as double : null,
      carbohydratesTotalG: map['carbohydrates_total_g'] != null
          ? map['carbohydrates_total_g'] as double
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Nutritions.fromJson(String source) =>
      Nutritions.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Nutritions(servingSizeG: $servingSizeG, name: $name, fatTotalG: $fatTotalG, calories: $calories, proteinG: $proteinG, carbohydratesTotalG: $carbohydratesTotalG)';
  }

  @override
  bool operator ==(covariant Nutritions other) {
    if (identical(this, other)) return true;

    return other.servingSizeG == servingSizeG &&
        other.name == name &&
        other.fatTotalG == fatTotalG &&
        other.calories == calories &&
        other.proteinG == proteinG &&
        other.carbohydratesTotalG == carbohydratesTotalG;
  }

  @override
  int get hashCode {
    return servingSizeG.hashCode ^
        name.hashCode ^
        fatTotalG.hashCode ^
        calories.hashCode ^
        proteinG.hashCode ^
        carbohydratesTotalG.hashCode;
  }
}
