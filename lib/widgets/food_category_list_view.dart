import 'package:flutter/material.dart';
import 'package:food_delivery_app/views/food_details_view.dart';
import 'package:food_delivery_app/models/food_model/food_model.dart';
import 'package:food_delivery_app/widgets/food_category_list_view_item.dart';

class FoodCategoryListView extends StatelessWidget {
  const FoodCategoryListView({
    super.key,
    required this.categoryMenu,
  });

  final List<FoodModel> categoryMenu;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: categoryMenu.length,
      itemBuilder: (context, index) {
        final foodModel = categoryMenu[index];
        return FoodCategoryListViewItem(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodDetailsView(
                  foodModel: foodModel,
                ),
              ),
            );
          },
          foodModel: foodModel,
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: Theme.of(context).colorScheme.tertiary,
        endIndent: 25,
        indent: 25,
      ),
    );
  }
}
