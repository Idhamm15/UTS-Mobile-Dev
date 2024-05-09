import 'dart:convert';

import 'package:ucommerce_apps/data/model/product.dart';
import 'package:ucommerce_apps/data/service/data_repository.dart';

class ApiRepository {
  final DataService dataService;
  ApiRepository({
    required this.dataService,
  });

  Future<List<Product>> getProductList() async {
    final response = await dataService.getProduct();
    if (response!.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final products = json.map((e) => Product.fromJson(e)).toList();
      return products;
    } else {
      throw Exception('Failed to load Posts');
    }
  }
}
