import 'package:flutter/material.dart';
import 'package:liverpool_test/modules/product_list/models/product_list_models.dart';
import 'package:liverpool_test/modules/product_list/presentation/widgets/build_results_widget.dart';
import 'package:liverpool_test/modules/product_list/presentation/widgets/build_sugestions_widget.dart';

typedef SearchProducts = Future<List<RecordProduct?>> Function(String termSearch);

class SearchProductsDelegate extends SearchDelegate<RecordProduct?> {
  final SearchProducts searchProducts;

  SearchProductsDelegate({required this.searchProducts});

  @override
  String? get searchFieldLabel => 'Buscar...';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close_rounded)
      ),
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: const Icon(Icons.search_rounded)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios_new));
  }

  @override
  Widget buildResults(BuildContext context) {

    if (query.isEmpty) {
      return Container();
    }
    return BuildResultsWidget(searchProducts: searchProducts, query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty || query.length < 4) {
      return Container();
    }
    return BuildSugestionsWidget(searchProducts: searchProducts, query: query);
  }
}










