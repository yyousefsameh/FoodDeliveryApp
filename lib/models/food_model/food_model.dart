import 'package:food_delivery_app/models/food_model/add_on_model.dart';

class FoodModel {
  final String name;
  final String image;
  final String? description;
  final num price;
  final FoodCategory category;

  List<Addon>? addons;

  FoodModel({
    required this.name,
    required this.image,
    this.description,
    required this.price,
    required this.category,
    this.addons,
  });
}

// food categories
enum FoodCategory {
  burgers,
  salads,
  drinks,
  desserts,
  sides,
}
