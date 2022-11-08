import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icecommercialpowertest/core/exceptions.dart';
import 'package:icecommercialpowertest/data/repository/repository.dart';
import 'package:icecommercialpowertest/domain/domain.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'store_repository_test.mocks.dart';

@GenerateMocks([StoreRepository])
void main() {
  late MockStoreRepository storeRepository;

  setUp(() {
    storeRepository = MockStoreRepository();
  });

  group("Store repoitory test", () {
    test('Products fetched successfully', () async {
      when(storeRepository.getProducts()).thenAnswer(
        (inv) => Future.value(<ProductModel>[]),
      );
      expect(
        await storeRepository.getProducts(),
        isA<List<ProductModel>>(),
      );
    });

    test('Categories fetched successfully', () async {
      when(storeRepository.getCategories()).thenAnswer(
        (inv) => Future.value(<String>[]),
      );
      expect(
        await storeRepository.getCategories(),
        isA<List<String>>(),
      );
    });

    test('Carts fetched successfully', () async {
      when(storeRepository.getCarts()).thenAnswer(
        (inv) => Future.value(<CartModel>[]),
      );
      expect(
        await storeRepository.getCarts(),
        isA<List<CartModel>>(),
      );
    });
  });
}
