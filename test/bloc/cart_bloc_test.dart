import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icecommercialpowertest/core/constants/constants.dart';
import 'package:icecommercialpowertest/data/data.dart';
import 'package:icecommercialpowertest/domain/domain.dart';
import 'package:icecommercialpowertest/presentation/store/cartbloc/cart_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../repository/store_repository_test.mocks.dart';

@GenerateMocks([Dio, StoreRepositoryImplement])
void main() {
  late MockCartBloc cartBloc;
  late MockStoreRepositoryImplement storeRepository;
  late StoreUseCases storeUseCases;
  setUp(() {
    cartBloc = MockCartBloc();
    storeRepository = MockStoreRepositoryImplement();
    storeUseCases = StoreUseCases(repository: storeRepository);
  });

  group("Grouped Cart bloc test", () {
    test("Test mocked Cart bloc", () async {
      whenListen<CartState>(
        cartBloc,
        Stream.fromIterable([const CartLoading(), CartCompleted([])]),
        initialState: const CartLoading(),
      );
      expect(cartBloc.state, equals(CartLoading()));
    });

    blocTest<CartBloc, CartState>(
      'emits [Loading, Completed] '
      'when succeesful',
      setUp: () {
        when(storeRepository.getCarts()).thenAnswer(
          (inv) => Future.value(<CartModel>[]),
        );
      },
      build: () => CartBloc(storeUseCases),
      act: (bloc) => bloc.add(const FetchCart()),
      expect: () => <CartState>[const CartLoading(), CartCompleted([])],
    );

    blocTest<CartBloc, CartState>(
      'emits [Loading, Error] State'
      'When error occur',
      setUp: () {
        when(storeRepository.getCarts()).thenAnswer(
          (inv) => throw Exception(),
        );
      },
      build: () => CartBloc(storeUseCases),
      act: (bloc) => bloc.add(const FetchCart()),
      expect: () =>
          <CartState>[const CartLoading(), const CartError(AppStrings.sww)],
    );
  });
}

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}
