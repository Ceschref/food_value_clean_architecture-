import 'package:equatable/equatable.dart';

abstract class FoodValueEntity extends Equatable {
  const FoodValueEntity({
    this.calories,
    this.carbos,
    this.description,
    this.difficulty,
    this.fats,
    this.headline,
    this.id,
    this.image,
    this.name,
    this.proteins,
    this.thumb,
    this.time,
  });

  final String? calories;
  final String? carbos;
  final String? description;
  final num? difficulty;
  final String? fats;
  final String? headline;
  final String? id;
  final String? image;
  final String? name;
  final String? proteins;
  final String? thumb;
  final String? time;
}
