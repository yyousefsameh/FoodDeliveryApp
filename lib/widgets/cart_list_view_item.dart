import 'package:flutter/material.dart';
import 'package:food_delivery_app/manager/restaurant_provider.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartItem,
  });

  final CartModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Row(
          children: [
            // food image
            Expanded(
              child: FittedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    cartItem.foodModel.image,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),

            // food name
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.foodModel.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Item pirce: ${cartItem.foodModel.price} E£',
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),

                  // add-ons
                  cartItem.selectedAddons.isEmpty
                      ? const SizedBox.shrink()
                      : Text(
                          'Add-ons: ${cartItem.selectedAddons.map((addon) => addon.name).join(', ')} ',
                        ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  // add-ons price
                  cartItem.selectedAddons.isEmpty
                      ? const SizedBox.shrink()
                      : Text(
                          'Add-ons\' total price: ${cartItem.selectedAddons.map((addon) => addon.price).reduce((value, element) => value + element)} E£',
                        ),

                  // total price
                  Text(
                    'Total price: ${cartItem.totalPrice} E£',
                  ),

                  const SizedBox(
                    height: 5.0,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // decrease button
                        IconButton(
                          onPressed: () {
                            // decrease quantity
                            Provider.of<RestaurantProvider>(context,
                                    listen: false)
                                .removeFromCart(cartItem);
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Theme.of(context).colorScheme.primary,
                            size: 20.0,
                          ),
                        ),

                        // quantity count
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "${cartItem.quantity}",
                          ),
                        ),

                        // increase button
                        IconButton(
                          onPressed: () {
                            Provider.of<RestaurantProvider>(context,
                                    listen: false)
                                .addToCart(
                              cartItem.foodModel,
                              cartItem.selectedAddons,
                            );
                          },
                          icon: Icon(
                            Icons.add,
                            color: Theme.of(context).colorScheme.primary,
                            size: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
