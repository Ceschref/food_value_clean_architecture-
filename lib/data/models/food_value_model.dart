import 'package:web_provise/domain/entity/food_value_entity.dart';

class FoodValueModel extends FoodValueEntity {
  const FoodValueModel({
    String? calories,
    String? carbos,
    String? description,
    num? difficulty,
    String? fats,
    String? headline,
    String? id,
    String? image,
    String? name,
    String? proteins,
    String? thumb,
    String? time,
  }) : super(
          id: id,
          calories: calories,
          carbos: carbos,
          description: description,
          difficulty: difficulty,
          fats: fats,
          headline: headline,
          image: image,
          name: name,
          proteins: proteins,
          thumb: thumb,
          time: time,
        );

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    if (calories != null) {
      result.addAll({'calories': calories});
    }
    if (carbos != null) {
      result.addAll({'carbos': carbos});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (difficulty != null) {
      result.addAll({'difficulty': difficulty});
    }
    if (fats != null) {
      result.addAll({'fats': fats});
    }
    if (headline != null) {
      result.addAll({'headline': headline});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (image != null) {
      result.addAll({'image': image});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (proteins != null) {
      result.addAll({'proteins': proteins});
    }
    if (thumb != null) {
      result.addAll({'thumb': thumb});
    }
    if (time != null) {
      result.addAll({'time': time});
    }

    return result;
  }

  factory FoodValueModel.fromJson(Map<dynamic, dynamic> map) => FoodValueModel(
        calories: map['calories'],
        carbos: map['carbos'],
        description: map['description'],
        difficulty: map['difficulty'],
        fats: map['fats'],
        headline: map['headline'],
        id: map['id'],
        image: map['image'],
        name: map['name'],
        proteins: map['proteins'],
        thumb: map['thumb'],
        time: map['time'],
      );

  @override
  List<Object?> get props => [];
}
