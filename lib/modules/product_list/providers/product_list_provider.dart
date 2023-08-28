import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:liverpool_test/modules/product_list/models/product_list_models.dart';
import 'package:liverpool_test/modules/product_list/providers/api_service.dart';

class ProductListProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  //Properties
  List<RecordProduct?> _plpRecords = [];
  List<RecordProduct?> get plpRecords => _plpRecords;

  //TODO: getters y setters para paginacion y filtros
  // String _searchString = '';
  // String get searchString => _searchString;

  // set searchString(String newString) {
  //   _searchString = newString;
  //   notifyListeners();
  // }

  //Methods

  Future<List<RecordProduct?>> fetchProductsList(String termSearch) async {
    try {
      final productList = await _apiService.fetchProducts(termSearch);

      if (productList.plpResults != null &&
          productList.plpResults!.records.isNotEmpty) {
        _plpRecords = productList.plpResults!.records;
        notifyListeners();
      }
      return _plpRecords;
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}
