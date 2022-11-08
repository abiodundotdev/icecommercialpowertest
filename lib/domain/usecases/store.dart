import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icecommercialpowertest/app_logger.dart';
import 'package:icecommercialpowertest/core/core.dart';
import 'package:icecommercialpowertest/domain/domain.dart';
import 'package:icecommercialpowertest/domain/entities/models/dashboard_data.dart';
import 'package:icecommercialpowertest/presentation/store/bloc/dashboard_bloc.dart';
import 'package:icecommercialpowertest/presentation/store/cartbloc/cart_bloc.dart';

class StoreUseCases {
  final StoreRepository repository;
  StoreUseCases({required this.repository});
  void fetchDashboardData(
      DashboardEvent event, Emitter<DashboardState> emit) async {
    emit(const DashBoardLoading());
    try {
      final categories = await repository.getCategories();
      final products = await repository.getProducts();

      emit(DashboardCompleted(
          DashBoardData(categories: categories, products: products)));
    } catch (e, _) {
      AppLogger().debug(e);
      final res = ErrorResponse(e);
      emit(DashboardError(res.message));
    }
  }

  void fetchCartData(CartEvent event, Emitter<CartState> emit) async {
    emit(const CartLoading());
    try {
      final carts = await repository.getCarts();
      emit(CartCompleted(carts));
    } catch (e, _) {
      AppLogger().debug(e);
      final res = ErrorResponse(e);
      emit(CartError(res.message));
    }
  }
}
