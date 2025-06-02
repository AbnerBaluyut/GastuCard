part of 'dependencies.dart';

Future<void> _initRepositories() async {

  getIt.registerLazySingleton<CardRepository>(
    () => CardRepositoryImpl(
      db: getIt()
    )
  );
}