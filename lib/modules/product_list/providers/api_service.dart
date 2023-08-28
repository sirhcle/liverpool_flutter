import 'package:http/http.dart' as http;
import 'package:liverpool_test/modules/product_list/models/product_list_models.dart';

class ApiService {
  Future<ProductListModel> fetchProducts(String termSearch) async {
    final url =
        'https://shoppapp.liverpool.com.mx/appclienteservices/services/v6/plp/sf?page-number=1&search-string=$termSearch&force-plp=false&number-of-items-per-page=40&cleanProductName=false';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final productListModel = productListModelFromJson(response.body);
      return productListModel;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
