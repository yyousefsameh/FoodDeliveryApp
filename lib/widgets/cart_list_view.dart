import 'package:flutter/material.dart';
import 'package:food_delivery_app/manager/restaurant_provider.dart';
import 'package:food_delivery_app/widgets/cart_list_view_item.dart';
import 'package:provider/provider.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<RestaurantProvider>(
        builder: (context, restaurant, child) {
          if (restaurant.cart.isEmpty) {
            return const Center(
              child: Text(
                'Cart is empty...',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            );
          }
          final cart = restaurant.cart;

          return ListView.separated(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final cartItem = cart[index];
              return CartItem(
                cartItem: cartItem,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 25.0,
            ),
          );
        },
      ),
    );
  }
}
