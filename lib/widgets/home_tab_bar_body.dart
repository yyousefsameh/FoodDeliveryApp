import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_model/food_model.dart';
import 'package:food_delivery_app/manager/restaurant_provider.dart';
import 'package:food_delivery_app/widgets/food_category_list_view.dart';
import 'package:provider/provider.dart';

class HomeTabBarView extends StatelessWidget {
  const HomeTabBarView({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    // sort out and return a list of food items that belong to a specific category
    List<FoodModel> filterMenuByCategory(
      FoodCategory foodCategory,
      List<FoodModel> fullMenu,
    ) =>
        fullMenu.where((food) => food.category == foodCategory).toList();

    List<Widget> getFoodInASpecificCategory(List<FoodModel> fullMenu) {
      return FoodCategory.values.map((category) {
        List<FoodModel> categoryMenu = filterMenuByCategory(category, fullMenu);

        return FoodCategoryListView(
          categoryMenu: categoryMenu,
        );
      }).toList();
    }

    return Consumer<RestaurantProvider>(
      builder: (context, restaurant, child) => TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: getFoodInASpecificCategory(
          restaurant.menu,
        ),
      ),
    );
  }
}
