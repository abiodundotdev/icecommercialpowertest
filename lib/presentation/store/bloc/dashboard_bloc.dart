import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:icecommercialpowertest/domain/domain.dart';
import 'package:icecommercialpowertest/domain/entities/models/dashboard_data.dart';

part 'dashboard_state.dart';
part 'dashboard_event.dart';
part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final StoreUseCases usecase;
  DashboardBloc(this.usecase) : super(const DashboardState.loading()) {
    on<FetchDashboard>(usecase.fetchDashboardData);
  }

  static fetch(BuildContext context) {
    BlocProvider.of<DashboardBloc>(context, listen: false).add(
      const FetchDashboard(),
    );
  }
}
