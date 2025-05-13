import 'package:injectable/injectable.dart';
import 'package:apptours/core/preferences.dart';

@module
abstract class AppModule {
  @singleton
  Preferences get preferences => Preferences();
}
