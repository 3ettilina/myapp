import 'package:myapp/core/models/product.dart';
import 'package:myapp/core/service/shop_data_service.dart';
import 'package:myapp/profile/models/user.dart';

class ShopRepo {
  ShopRepo({
    ShopDataService? dataService,
  }) : _dataService = dataService ?? ShopDataService();

  final ShopDataService _dataService;

  Future<User> getUser() async {
    try {
      Future.delayed(const Duration(seconds: 2));
      final userResponse = await _dataService.getUser();
      return User.fromJson(userResponse);
    } catch (e) {
      print('Something went wrong while retrieving the user');
      rethrow;
    }
  }

  Future<List<Product>> getProducts() async {
    try {
      Future.delayed(const Duration(seconds: 2));
      final productsResponse = await _dataService.getProducts();
      final products =
          productsResponse.map((prod) => Product.fromJson(prod)).toList();
      return products;
    } catch (e) {
      print('Something went wrong while retrieving products');
      rethrow;
    }
  }
}
