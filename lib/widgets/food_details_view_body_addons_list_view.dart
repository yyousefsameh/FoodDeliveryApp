import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food_model/add_on_model.dart';
import 'package:food_delivery_app/models/food_model/food_model.dart';

class FoodDetailsViewBodyAddonsListView extends StatefulWidget {
  final FoodModel foodModel;
  final Map<Addon, bool> selectedAddons;
  const FoodDetailsViewBodyAddonsListView({
    super.key,
    required this.foodModel,
    required this.selectedAddons,
  });

  @override
  State<FoodDetailsViewBodyAddonsListView> createState() =>
      _FoodDetailsViewBodyAddonsListViewState();
}

class _FoodDetailsViewBodyAddonsListViewState
    extends State<FoodDetailsViewBodyAddonsListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => CheckboxListTile(
        activeColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.foodModel.addons![index].name,
        ),
        subtitle: Text(
          '  ${widget.foodModel.addons![index].price} E£',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        value: widget.selectedAddons[widget.foodModel.addons![index]],
        onChanged: (value) {
          setState(() {
            widget.selectedAddons[widget.foodModel.addons![index]] = value!;
          });
        },
      ),
      separatorBuilder: (context, index) => Divider(
        color: Theme.of(context).colorScheme.tertiary,
        endIndent: 25,
        indent: 25,
      ),
      itemCount: widget.foodModel.addons?.length ?? 0,
    );
  }
}
