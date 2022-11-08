import 'package:icecommercialpowertest/core/constants/constants.dart';
import 'package:icecommercialpowertest/core/response.dart';
import 'package:icecommercialpowertest/domain/domain.dart';
import 'package:icecommercialpowertest/presentation/store/my_cart_page.dart';

class StoreRepositoryImplement extends StoreRepository {
  final AppHttpClient httpClient;
  StoreRepositoryImplement(this.httpClient);

  @override
  Future<List<CartModel>> getCarts() async {
    final resdata =
        AppResponse(await httpClient.get(Endpoints.allCarts)).rawData;
    return List.generate(
      resdata.length,
      (index) => CartModel.fromJson(resdata[index]),
    );
  }

  @override
  Future<List<String>> getCategories() async {
    final _res =
        AppResponse(await httpClient.get(Endpoints.categories)).rawData;
    return List<String>.from(_res);
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final resdata =
        AppResponse(await httpClient.get(Endpoints.products)).rawData;
    return List.generate(
      resdata.length,
      (index) => ProductModel.fromJson(resdata[index]),
    );
  }

  @override
  Future<String> updateCart(CartUpdateType type, int cartid) {
    // TODO: implement updateCart
    throw UnimplementedError();
  }
}
