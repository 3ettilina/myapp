import 'dart:convert';
import 'package:flutter/services.dart';

class ShopDataService {
  Future<Map<String, dynamic>> getUser() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/user_data.json');
      final user = await json.decode(response);
      return user as Map<String, dynamic>;
    } catch (e) {
      print('ShopDataService - ERROR');
      print('getUser()');
      print('Something went wrong while fetching user from remote data source');
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/products_data.json');
      final products = await json.decode(response);
      return products as List<Map<String, dynamic>>;
    } catch (e) {
      print('ShopDataService - ERROR');
      print('getProducts()');
      print('Something went wrong while fetching products from remote data source');
      rethrow;
    }
  }
}
