// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/cart.bloc.dart';
import 'package:shopping/models/cart-item.model.dart';
import 'package:shopping/models/product-list-item.model.dart';

class AddToCart extends StatelessWidget {
  final ProductListItemModel item;

  AddToCart({required this.item});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);
    var cartItem = CartItemModel(
      id: item.id,
      price: item.price,
      image: item.image,
      title: item.title,
      quantity: 1,
    );

    if (bloc.itemInCart(cartItem)) {
      // se o item não tiver no carrinho ..
      return Container(
        width: 80,
        height: 40,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.red,
            ),
          ),
          child: Icon(
            Icons.remove_shopping_cart,
            color: Colors.white,
          ),
          onPressed: () {
            bloc.remove(
              cartItem,
            );
            final snackBar = SnackBar(
              content: Text('${item.title} removido'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      );
    } else {
      return Container(
        width: 80,
        height: 40,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Theme.of(context).primaryColor,
            ),
          ),
          child: Icon(
            Icons.add_shopping_cart,
            color: Colors.white,
          ),
          onPressed: () {
            bloc.add(
              cartItem,
            );
            final snackBar = SnackBar(
              content: Text('${item.title} adicionado'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      );
    }
  }
}
