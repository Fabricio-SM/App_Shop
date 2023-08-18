import 'package:flutter/material.dart';
import 'package:shopping/blocs/home.bloc.dart';
import 'package:shopping/models/category-list-item.model.dart';
import 'package:provider/provider.dart';
import '../../../../settings.dart';

class CategoryCard extends StatelessWidget {
  final CategoryListItemModel item;

  const CategoryCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);

    return Container(
      width: 70,
      height: 70,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: item.tag == bloc.selectedCategory
            ? Theme.of(context).primaryColor.withOpacity(0.3)
            : Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(70),
        ),
      ),
      child: TextButton(
        child:
            Image.asset("assets/categories/${Settings.theme}/${item.tag}.png"),
        onPressed: () {
          bloc.changeCategory(item.tag);
        },
      ),
    );
  }
}
