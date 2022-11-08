import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:icecommercialpowertest/core/constants/app_strings.dart';
import 'package:icecommercialpowertest/data/data.dart';
import 'package:icecommercialpowertest/domain/domain.dart';
import 'package:icecommercialpowertest/domain/entities/models/dashboard_data.dart';
import 'package:icecommercialpowertest/presentation/store/bloc/dashboard_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../repository/store_repository_test.mocks.dart';

@GenerateMocks([Dio, StoreRepositoryImplement])
void main() {
  late MockDashboardBloc dashboardBloc;
  late MockStoreRepositoryImplement storeRepository;
  late StoreUseCases storeUseCases;
  setUp(() {
    dashboardBloc = MockDashboardBloc();
    storeRepository = MockStoreRepositoryImplement();
    storeUseCases = StoreUseCases(repository: storeRepository);
  });

  group("Grouped dashboard bloc test", () {
    test("Test mocked dashbaord bloc", () async {
      whenListen<DashboardState>(
        dashboardBloc,
        Stream.fromIterable([
          const DashBoardLoading(),
          DashboardCompleted(DashBoardData(categories: null, products: null))
        ]),
        initialState: const DashBoardLoading(),
      );
      expect(dashboardBloc.state, equals(DashBoardLoading()));
    });

    blocTest<DashboardBloc, DashboardState>(
      'emits [Loading, Completed]'
      'when succeesful',
      setUp: () {
        when(storeRepository.getProducts()).thenAnswer(
          (inv) => Future.value(<ProductModel>[]),
        );
        when(storeRepository.getCategories()).thenAnswer(
          (inv) => Future.value(<String>[]),
        );
      },
      build: () => DashboardBloc(storeUseCases),
      act: (bloc) => bloc.add(const FetchDashboard()),
      expect: () => <DashboardState>[
        const DashBoardLoading(),
        DashboardCompleted(DashBoardData(
          categories: [],
          products: [],
        ))
      ],
    );

    blocTest<DashboardBloc, DashboardState>(
      'emits [Loading, Error] State'
      'When error occur',
      setUp: () {
        when(storeRepository.getProducts()).thenAnswer(
          (inv) => throw Exception(),
        );
        when(storeRepository.getCategories())
            .thenAnswer((inv) => throw Exception());
      },
      build: () => DashboardBloc(storeUseCases),
      act: (bloc) => bloc.add(const FetchDashboard()),
      expect: () => <DashboardState>[
        const DashBoardLoading(),
        const DashboardError(AppStrings.sww)
      ],
    );
  });
}

class MockDashboardBloc extends MockBloc<DashboardEvent, DashboardState>
    implements DashboardBloc {}
