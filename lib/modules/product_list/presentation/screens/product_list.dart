import 'package:flutter/material.dart';
import 'package:liverpool_test/modules/product_list/presentation/widgets/custom_appbar.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    //final productListProvider = Provider.of<ProductListProvider>(context);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: colors.primary,
          title: const CustomAppbar(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(
                'assets/images/bann1.png',
                fit: BoxFit.fitHeight,
              ),
              Image.asset(
                'assets/images/bann2.png',
                fit: BoxFit.fitHeight,
              ),
              Image.asset(
                'assets/images/bann3.png',
                fit: BoxFit.fitHeight,
              )
            ],
          ),
        ),
        backgroundColor: colors.surface,
      );
  }
}


