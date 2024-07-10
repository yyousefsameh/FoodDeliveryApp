import 'package:food_delivery_app/models/food_model/add_on_model.dart';
import 'package:food_delivery_app/models/food_model/food_model.dart';

class CartModel {
  final FoodModel foodModel;
  final List<Addon> selectedAddons;
  int quantity;

  CartModel({
    required this.foodModel,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double get totalPrice {
    double addonsPrice = selectedAddons.fold(
      0,
      (sum, addon) => sum + addon.price,
    );

    return (foodModel.price + addonsPrice) * quantity;
  }
}
