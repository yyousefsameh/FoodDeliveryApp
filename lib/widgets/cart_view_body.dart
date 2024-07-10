import 'package:flutter/material.dart';
import 'package:food_delivery_app/views/payment_view.dart';
import 'package:food_delivery_app/widgets/cart_list_view.dart';
import 'package:food_delivery_app/widgets/custom_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CartListView(),
        const SizedBox(
          height: 10.0,
        ),
        CustomButton(
          buttonLabel: "Checkout",
          onTap: () {
            // navigate to checkout page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PaymentView(),
              ),
            );
          },
        ),
        const SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}
