import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_model/food_model.dart';
import 'package:food_delivery_app/widgets/food_details_view_body.dart';

class FoodDetailsView extends StatelessWidget {
  const FoodDetailsView({
    super.key,
    required this.foodModel,
  });

  final FoodModel foodModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: FoodDetailsViewBody(
        foodModel: foodModel,
      ),
    );
  }
}
