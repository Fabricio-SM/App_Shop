import 'dart:core';
import 'package:flutter/widgets.dart';
import 'package:shopping/models/cart-item.model.dart';

class CartBloc extends ChangeNotifier {
  var cart = <CartItemModel>[];
  double total = 0;

  get() {
    return cart;
  }

  add(CartItemModel item) {
    cart.add(item);
    calculateTotal();
  }

  itemInCart(CartItemModel item) {
    var result = false;
    cart.forEach(
      (x) {
        if (item.id == x.id) result == true;
      },
    );
    return result;
  }

  increase(CartItemModel item) {
    if (item.quantity! < 10) {
      item.quantity! + 1;
    }
    calculateTotal();
  }

  decrease(CartItemModel item) {
    if (item.quantity! < 10) {
      item.quantity! - 1;
    }
    calculateTotal();
  }

  remove(CartItemModel item) {
    cart.removeWhere((x) => x.id == item.id);
    calculateTotal();
  }

  calculateTotal() {
    total = 0;
    cart.forEach((x) {
      total += (x.price! * x.quantity!);
    });
    notifyListeners();
  }
}
