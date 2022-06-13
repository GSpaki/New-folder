import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'modules/app/app.dart';

Future<void> main() async {
  await Hive.initFlutter();
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
