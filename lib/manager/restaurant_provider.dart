import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/food_model/add_on_model.dart';
import 'package:food_delivery_app/models/food_model/food_model.dart';

class RestaurantProvider extends ChangeNotifier {
  // list of food menu
  final List<FoodModel> _menu = [
    // burgers
    FoodModel(
      name: "Shiitake Mushroom",
      description:
          "Sautéed mushroom, cheddar cheese, and creamy mayonnaise spread on top of our pure beef burger patty.",
      image: "assets/images/burgers/Shiitake Mushroom.webp",
      category: FoodCategory.burgers,
      price: 150,
      addons: [
        Addon(
          name: "Jalapeno",
          price: 5,
        ),
        Addon(
          name: "Beef Bacon",
          price: 60,
        ),
        Addon(
          name: "Salad Cup",
          price: 5,
        ),
        Addon(
          name: "Cheddar Cheese",
          price: 15,
        ),
        Addon(
          name: "Pickles",
          price: 5,
        ),
      ],
    ),
    FoodModel(
      name: "Animal Style",
      description:
          "Crispy onion rings, topped with semi dijon mustard, creamy Buffalo sauce, and cheddar cheese.",
      image: "assets/images/burgers/Animal Style.webp",
      category: FoodCategory.burgers,
      price: 155,
      addons: [
        Addon(
          name: "Jalapeno",
          price: 5,
        ),
        Addon(
          name: "Beef Bacon",
          price: 60,
        ),
        Addon(
          name: "Salad Cup",
          price: 5,
        ),
        Addon(
          name: "Cheddar Cheese",
          price: 15,
        ),
        Addon(
          name: "Pickles",
          price: 5,
        ),
      ],
    ),
    FoodModel(
      name: "Old School",
      description:
          "Pure beef burger patty, topped with our signature Buffalo sauce and cheddar cheese.",
      image: "assets/images/burgers/Old School.webp",
      category: FoodCategory.burgers,
      price: 145,
      addons: [
        Addon(
          name: "Jalapeno",
          price: 5,
        ),
        Addon(
          name: "Beef Bacon",
          price: 60,
        ),
        Addon(
          name: "Salad Cup",
          price: 5,
        ),
        Addon(
          name: "Cheddar Cheese",
          price: 15,
        ),
        Addon(
          name: "Pickles",
          price: 5,
        ),
      ],
    ),
    FoodModel(
      name: "Blue Cheese",
      description:
          "Crumbles of creamy French blue cheese top our famous burger patty with our signature mayonnaise sauce.",
      image: "assets/images/burgers/Blue Cheese.webp",
      category: FoodCategory.burgers,
      price: 150,
      addons: [
        Addon(
          name: "Jalapeno",
          price: 5,
        ),
        Addon(
          name: "Beef Bacon",
          price: 60,
        ),
        Addon(
          name: "Salad Cup",
          price: 5,
        ),
        Addon(
          name: "Cheddar Cheese",
          price: 15,
        ),
        Addon(
          name: "Pickles",
          price: 5,
        ),
      ],
    ),
    FoodModel(
      name: "Bacon Mushroom Jack",
      description:
          "Beef bacon with fresh sautéed mushroom, cheddar cheese, and creamy mayonnaise.",
      image: "assets/images/burgers/Old School.webp",
      category: FoodCategory.burgers,
      price: 185,
      addons: [
        Addon(
          name: "Jalapeno",
          price: 5,
        ),
        Addon(
          name: "Beef Bacon",
          price: 60,
        ),
        Addon(
          name: "Salad Cup",
          price: 5,
        ),
        Addon(
          name: "Cheddar Cheese",
          price: 15,
        ),
        Addon(
          name: "Pickles",
          price: 5,
        ),
      ],
    ),

    // salads
    FoodModel(
      name: "Greek Salad",
      description: "greek salad dish",
      image: "assets/images/salads/Greek Salad.jpg",
      price: 30,
      category: FoodCategory.salads,
    ),
    // drinks
    FoodModel(
      name: "Orange Juice",
      description: "Freshly squeezed orange juice.",
      image: "assets/images/drinks/Orange Juice.webp",
      category: FoodCategory.drinks,
      price: 20,
    ),
    FoodModel(
      name: "Water Bottle",
      image: "assets/images/drinks/Water Bottle.webp",
      category: FoodCategory.drinks,
      price: 10,
    ),
    FoodModel(
      name: "Pure Apple Juice",
      image: "assets/images/drinks/Pure Apple Juice.webp",
      price: 15,
      category: FoodCategory.drinks,
    ),
    FoodModel(
      name: "Green Cola",
      description: "Green Cola Can",
      image: "assets/images/drinks/Green Cola.webp",
      price: 25,
      category: FoodCategory.drinks,
    ),

    // desserts
    FoodModel(
      name: "Apple Pie",
      image: "assets/images/desserts/Apple Pie.webp",
      price: 25,
      category: FoodCategory.desserts,
    ),
    FoodModel(
      name: "Cookie Slice",
      image: "assets/images/desserts/Cookie Slice.webp",
      price: 75,
      category: FoodCategory.desserts,
    ),

    // sides
    FoodModel(
      name: "Mustard",
      image: "assets/images/sides/Mustard.webp",
      price: 5,
      category: FoodCategory.sides,
    ),
    FoodModel(
      name: "Ketchup",
      image: "assets/images/sides/Ketchup.webp",
      price: 2.3,
      category: FoodCategory.sides,
    ),
    FoodModel(
      name: "Cheddar Cheese Sause",
      image: "assets/images/sides/Cheddar Cheese Sause.webp",
      price: 20,
      category: FoodCategory.sides,
    ),
    FoodModel(
      name: "Buffalo Sauce",
      image: "assets/images/sides/Buffalo Sauce.webp",
      price: 10,
      category: FoodCategory.sides,
    ),
    FoodModel(
      name: "Ranch Sauce",
      image: "assets/images/sides/Ranch Sauce.webp",
      price: 10,
      category: FoodCategory.sides,
    ),
  ];

/* 
G E T T E R S
*/

  List<FoodModel> get menu => _menu;
  List<CartModel> get cart => _cart;

  /*

  M E T H O D S

  */
// user cart
  final List<CartModel> _cart = [];
  void addToCart(
    FoodModel foodModel,
    List<Addon> selectedAddons,
  ) {
    // see if there is a cart item in cart with the same food and selected addons

    CartModel? cartItem = _cart.firstWhereOrNull(
      (cartItem) {
        // check if the food items are the same
        bool isSameFood = cartItem.foodModel == foodModel;

        // check if the list of selected addons are the same
        bool isSameAddons = const ListEquality().equals(
          cartItem.selectedAddons,
          selectedAddons,
        );

        return isSameFood && isSameAddons;
      },
    );

// if item already exists, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    // if not, add it to the cart
    else {
      _cart.add(
        CartModel(
          foodModel: foodModel,
          selectedAddons: selectedAddons,
        ),
      );
    }

    notifyListeners();
  }

  //remove from cart

  void removeFromCart(CartModel cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
      notifyListeners();
    }
  }

  // get total pice of cart

  double get totalCartPrice {
    double total = 0.0;
    for (CartModel cartItem in _cart) {
      num itemTotal = cartItem.foodModel.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += cartItem.foodModel.price * cartItem.quantity;
    }
    return total;
  }

  // get the total number of cart items in the cart

  int get totalCartItems {
    int totalCartItems = 0;
    for (CartModel cartItem in _cart) {
      totalCartItems += cartItem.quantity;
    }
    return totalCartItems;
  }

  // clear the cart

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
  // generate a receipt
}
