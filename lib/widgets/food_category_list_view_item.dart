import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_model/food_model.dart';

class FoodCategoryListViewItem extends StatelessWidget {
  const FoodCategoryListViewItem({
    super.key,
    this.onTap,
    required this.foodModel,
  });

  final FoodModel foodModel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodModel.name,
                  ),

                  // Text(
                  //   '\$${foodModel.price}',
                  //   style: TextStyle(
                  //     color: Theme.of(context).colorScheme.primary,
                  //   ),
                  // ),
                  const SizedBox(height: 10.0),
                  Text(
                    foodModel.description ?? 'No description',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                foodModel.image,
                height: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
