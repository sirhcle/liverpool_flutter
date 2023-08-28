import 'package:flutter/material.dart';
import 'package:liverpool_test/modules/product_list/models/product_list_models.dart';
import 'package:liverpool_test/modules/product_list/presentation/delegates/search_products_delegate.dart';

class BuildResultsWidget extends StatelessWidget {
  const BuildResultsWidget({
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
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductItem(
              product: product,
            );
          },
        );
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final RecordProduct? product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    final imgProduct = (product != null)
        ? product!.smImage
        : 'https://t3.ftcdn.net/jpg/02/48/42/64/360_F_248426448_NVKLywWqArG2ADUxDq6QprtIzsF82dMF.jpg';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          //Image
          SizedBox(
            width: size.width * 0.30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imgProduct ?? '',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(width: 10),

          //Columna
          SizedBox(
            width: size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    (product != null) 
                      ? product!.productDisplayName ?? '' 
                      : '',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 44, 41, 41),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500
                      )
                    ),
                const SizedBox(height: 10,),
                (product != null && (product!.listPrice == product!.promoPrice || product!.promoPrice == 0.0))
                ? Text(product!.listPrice.toString(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 44, 41, 41),
                      fontSize: 18.0,
                    )
                  )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text((product != null) 
                      ? '\$${product!.listPrice.toString()}' 
                      : '',
                      style: const TextStyle(
                        color: Color(0xffff0000),
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Color(0xff000000),
                        fontSize: 13.0,
                      )),
                    Text((product != null) 
                      ? '\$${product!.promoPrice.toString()}' 
                      : '',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 44, 41, 41),
                        fontSize: 18.0,
                      )),
                  ],
                ), 
              ],
            ),
          )
        ],
      ),
    );
  }
}
