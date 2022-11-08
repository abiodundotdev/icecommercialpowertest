part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.loading() = CartLoading;
  const factory CartState.error(String message) = CartError;
  const factory CartState.completed(List<CartModel> items) = CartCompleted;
}
