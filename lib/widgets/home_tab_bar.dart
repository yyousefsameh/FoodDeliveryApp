import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_model/food_model.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({
    super.key,
    required this.tabController,
  });
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Colors.white,
      indicatorWeight: 3,
      indicatorSize: TabBarIndicatorSize.label,
      dividerHeight: 1,
      dividerColor: Theme.of(context).colorScheme.primary,
      labelColor: Theme.of(context).colorScheme.inversePrimary,
      unselectedLabelColor: Theme.of(context).colorScheme.primary,
      controller: tabController,
      tabs: _categoryTabs(),
    );
  }
}

List<Tab> _categoryTabs() {
  return FoodCategory.values
      .map(
        (foodCategory) => Tab(
          text: foodCategory.toString().split(".").last,
        ),
      )
      .toList();
}
