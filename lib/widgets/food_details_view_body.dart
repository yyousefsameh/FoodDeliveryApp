import 'package:flutter/material.dart';
import 'package:food_delivery_app/manager/restaurant_provider.dart';
import 'package:food_delivery_app/models/food_model/add_on_model.dart';
import 'package:food_delivery_app/models/food_model/food_model.dart';
import 'package:food_delivery_app/widgets/custom_button.dart';
import 'package:food_delivery_app/widgets/food_details_view_body_addons_list_view.dart';
import 'package:provider/provider.dart';

class FoodDetailsViewBody extends StatelessWidget {
  const FoodDetailsViewBody({
    super.key,
    required this.foodModel,
  });

  void addToCart(
      FoodModel foodModel, Map<Addon, bool> selectedAddons, context) {
    List<Addon> currentSelectedAddons = [];
    for (Addon addon in foodModel.addons ?? []) {
      if (selectedAddons[addon] == true) {
        currentSelectedAddons.add(addon);
      }
    }
    Provider.of<RestaurantProvider>(context, listen: false).addToCart(
      foodModel,
      currentSelectedAddons,
    );
  }

  final FoodModel foodModel;
  @override
  Widget build(BuildContext context) {
    Map<Addon, bool> selectedAddons = {};
    for (Addon addon in foodModel.addons ?? []) {
      selectedAddons[addon] = false;
    }
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // food image
          Image.asset(
            foodModel.image,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // food name
                Text(
                  foodModel.name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // food price
                Text(
                  "${foodModel.price} E£",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                const SizedBox(
                  height: 10.0,
                ),

                // food description
                Text(
                  foodModel.description ?? "No description",
                ),
                const SizedBox(
                  height: 30.0,
                ),
                // addons
                foodModel.addons == null
                    ? const SizedBox.shrink()
                    : Text(
                        "Add-ons",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                FoodDetailsViewBodyAddonsListView(
                  foodModel: foodModel,
                  selectedAddons: selectedAddons,
                ),
              ],
            ),
          ),
          CustomButton(
            buttonLabel: "Add to cart",
            onTap: () {
              addToCart(
                foodModel,
                selectedAddons,
                context,
              );

              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}

// add to cart

