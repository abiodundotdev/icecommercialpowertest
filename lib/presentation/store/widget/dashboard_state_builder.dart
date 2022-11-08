import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icecommercialpowertest/domain/entities/models/dashboard_data.dart';
import 'package:icecommercialpowertest/presentation/store/bloc/dashboard_bloc.dart';

class DashboardStateBuilder extends StatelessWidget {
  final Widget Function(DashBoardData) builder;
  const DashboardStateBuilder({Key? key, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (message) => Center(
            child: Text(message),
          ),
          completed: builder,
        );
      },
    );
  }
}
