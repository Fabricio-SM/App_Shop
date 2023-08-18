import 'package:flutter/material.dart';
import 'package:shopping/models/product-details.model.dart';
import 'package:shopping/repositories/product.repository.dart';
import 'package:shopping/ui/shared/widgets/shared/progress-indicator.widget.dart';

class ProductPage extends StatelessWidget {
  final String tag;
  final _repository = ProductRepository();

  ProductPage({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductDetailsModel>(
      // espera a requisição ser concluída para construir a tela
      future: _repository.get(tag),
      builder: (context, snapshot) {
        var product = snapshot.data as ProductDetailsModel;

        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text("Aguardando...");
          case ConnectionState.active:
          case ConnectionState.waiting:
            return const Center(
              child: GenericProgressIndicator(),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Não foi possível encontrar o produto. Erro: ${snapshot.error}"),
              );
            }
            return content(product);
        }
      },
    );
  }

  Widget content(ProductDetailsModel product) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product.images!.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Column(
            children: <Widget>[
              SizedBox(
                width: 300,
                child: Image.network(
                  product.images![index],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
