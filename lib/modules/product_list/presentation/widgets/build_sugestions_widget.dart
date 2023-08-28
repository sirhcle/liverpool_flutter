import 'package:flutter/material.dart';
import 'package:liverpool_test/modules/product_list/presentation/delegates/search_products_delegate.dart';

class BuildSugestionsWidget extends StatelessWidget {
  const BuildSugestionsWidget({
    super.key,
    required this.searchProducts,
    required this.query,
  });

  final SearchProducts searchProducts;
  final String query;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: searchProducts(query),
      builder: (context, snapshot) {
        final products = snapshot.data ?? [];

        return ListView.builder(
          itemCount: products.length > 5 ? 5 : products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ListTile(
              title: (index == 0)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sugerencias:', 
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ), 
                        const SizedBox(height: 20,),
                        Text(product?.productDisplayName ?? '')
                      ],
                    )
                  : Text(product?.productDisplayName ?? ''),
            );
          },
        );
      },
    );
  }
}