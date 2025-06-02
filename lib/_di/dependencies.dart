import 'package:get_it/get_it.dart';

import '../core/services/database/app_database.dart';
import '../data/repositories/card_repository.dart';

part 'app.dart';
part 'repositories.dart';


final getIt = GetIt.I;

Future<void> initDependencies() async {

  // App
  await _initApp();

  // Repositories
  await _initRepositories();
}