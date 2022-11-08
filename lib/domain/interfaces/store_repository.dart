import 'package:icecommercialpowertest/domain/domain.dart';
import 'package:icecommercialpowertest/presentation/store/store.dart';

abstract class StoreRepository {
  Future<List<ProductModel>> getProducts();
  Future<List<String>> getCategories();
  Future<List<CartModel>> getCarts();
  Future<String> updateCart(CartUpdateType type, int cartid);
}
