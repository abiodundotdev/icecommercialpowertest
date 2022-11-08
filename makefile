

built_value_build:
	flutter packages pub run build_runner build --delete-conflicting-outputs

built_value_watch:
	flutter packages pub run build_runner watch --delete-conflicting-outputs

# iOS
mock_ios:
	flutter build ios --flavor mock --dart-define=env.mode=mock

prod_ios:
	flutter build ios --flavor prod --dart-define=env.mode=prod

prod_ios_ipa:
	flutter build ipa --flavor prod --dart-define=env.mode=prod

staging_ios:
	flutter build ios --flavor staging --dart-define=env.mode=staging

install_ios_dev:
	flutter build ios --flavor dev --dart-define=env.mode=dev && flutter install

install_ios_mock:
	make mock_ios && flutter install

install_ios_prod:
	make prod_ios && flutter install

install_ios_staging:
	make staging_ios && flutter install

# Android
mock_android:
	flutter build apk --flavor mock --dart-define=env.mode=mock

prod_android:
	flutter build apk --flavor prod --dart-define=env.mode=prod

prod_android_appbundle:
	flutter build appbundle --flavor prod --dart-define=env.mode=prod

staging_android:
	flutter build apk --flavor staging --dart-define=env.mode=staging

install_android_dev:
	flutter build apk --flavor dev --dart-define=env.mode=dev && flutter install

install_android_mock:
	make mock_android && flutter install

install_android_staging:
	make staging_android && flutter install

install_android_prod:
	make prod_android && flutter install

run_mock_development:
	flutter run --flavor mock

run_staging_development:
	flutter run --flavor staging --dart-define=env.mode=staging

run_production_app:
	flutter run --flavor prod --dart-define=env.mode=prod

#run test