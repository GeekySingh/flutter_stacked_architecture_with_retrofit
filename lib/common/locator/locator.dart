import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

import 'locator.config.dart';

final locator = GetIt.instance;

@injectableInit
void setupLocator() => $initGetIt(locator);

/// define all the view models here to locate their dependencies
@module
abstract class ViewModelModule {

}