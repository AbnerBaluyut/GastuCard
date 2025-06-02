part of 'dependencies.dart';

Future<void> _initApp() async {

  getIt.registerSingleton<AppDatabase>(AppDatabase.instance());
}