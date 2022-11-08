part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.loading() = DashBoardLoading;
  const factory DashboardState.error(String message) = DashboardError;
  const factory DashboardState.completed(DashBoardData data) =
      DashboardCompleted;
}
