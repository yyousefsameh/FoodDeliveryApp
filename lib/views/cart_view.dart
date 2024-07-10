import 'package:flutter/material.dart';
import 'package:food_delivery_app/manager/restaurant_provider.dart';
import 'package:food_delivery_app/widgets/cart_view_body.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cart'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  title: const Text(
                    'Are you sure you want to clear the cart?',
                  ),
                  actions: [
                    MaterialButton(
                      child: const Text('Cancel'),
                      onPressed: () => Navigator.pop(context),
                    ),
                    MaterialButton(
                      child: const Text('Clear'),
                      onPressed: () {
                        // clear cart
                        Provider.of<RestaurantProvider>(
                          context,
                          listen: false,
                        ).clearCart();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(
              Icons.delete_forever_rounded,
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: const CartViewBody(),
    );
  }
}
