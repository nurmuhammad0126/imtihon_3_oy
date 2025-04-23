import 'package:flutter_3_oy_imtixon/data/remote_datasource/product_remote_datasource.dart';
import 'package:flutter_3_oy_imtixon/models/product_model.dart';

class ProductViewModel {
  final ProductRemoteDatasource _repo = ProductRemoteDatasource();


  Future<List<ProductModel>?> getProducts() async {
    return await _repo.getProduct();
  }


  Future<bool> addProduct(ProductModel product) async {
    return await _repo.addProduct(product);
  }


  Future<bool> updateProduct(ProductModel product) async {
    return await _repo.updateProduct(product);
  }


  Future<bool> deleteProduct(String productId) async {
    return await _repo.deleteProduct(productId);
  }
}
