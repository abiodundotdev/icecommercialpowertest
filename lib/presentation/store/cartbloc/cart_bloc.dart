import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icecommercialpowertest/domain/domain.dart';

part 'cart_state.dart';
part 'cart_event.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final StoreUseCases usecase;

  CartBloc(this.usecase) : super(const CartState.loading()) {
    on<FetchCart>(usecase.fetchCartData);
  }

  static fetch(BuildContext context) {
    BlocProvider.of<CartBloc>(context, listen: false).add(
      const FetchCart(),
    );
  }
}
