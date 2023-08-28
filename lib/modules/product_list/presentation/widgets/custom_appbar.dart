import 'package:flutter/material.dart';
import 'package:liverpool_test/modules/product_list/presentation/delegates/search_products_delegate.dart';
import 'package:liverpool_test/modules/product_list/providers/product_list_provider.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Image.asset(
              'assets/images/liverpool-logo.png',
              width: 180,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                final productListProvider = Provider.of<ProductListProvider>(context, listen: false);
                
                showSearch(
                  context: context, 
                  delegate: SearchProductsDelegate(
                    searchProducts: productListProvider.fetchProductsList
                  )
                );
              },
              icon: const Icon(Icons.search_rounded),
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
