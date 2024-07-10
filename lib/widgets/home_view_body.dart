import 'package:flutter/material.dart';
import 'package:food_delivery_app/manager/restaurant_provider.dart';
import 'package:food_delivery_app/models/food_model/food_model.dart';
import 'package:food_delivery_app/views/cart_view.dart';
import 'package:food_delivery_app/widgets/custom_sliver_app_bar.dart';
import 'package:food_delivery_app/widgets/deliver_details_section.dart';
import 'package:food_delivery_app/widgets/delivery_location_section.dart';
import 'package:food_delivery_app/widgets/home_tab_bar.dart';
import 'package:food_delivery_app/widgets/home_tab_bar_body.dart';
import 'package:provider/provider.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: FoodCategory.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        CustomSliverAppBar(
          sliverAppBarTitle: Text(
            'Sunset Dinner',
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          flexibleSpaceBarTitle: HomeTabBar(
            tabController: _tabController,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartView(),
                  ),
                );
              },
              icon: Builder(
                builder: (context) {
                  return Badge(
                    label: Text(
                      "${Provider.of<RestaurantProvider>(context).totalCartItems}",
                    ),
                    child: const Icon(
                      Icons.shopping_cart_rounded,
                    ),
                  );
                },
              ),
            )
          ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Divider(
                indent: 25.0,
                endIndent: 25.0,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const DeliveryLocationSection(),
              const DeliveryDetailsSection(),
            ],
          ),
        ),
      ],
      body: HomeTabBarView(
        tabController: _tabController,
      ),
    );
  }
}
