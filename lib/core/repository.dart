import 'package:icecommercialpowertest/domain/domain.dart';

class Repository {
  final AuthRepository auth;
  final StoreRepository store;
  Repository({required this.auth, required this.store});
}
