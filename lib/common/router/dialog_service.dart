
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_stacked_arch_retrofit/common/constant/strings.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DialogService {
  Future<OkCancelResult> error({String title, String message}) {
    return showOkAlertDialog(
        context: ExtendedNavigator.root.widget.navigatorKey.currentContext,
        title: title,
        message: message);
  }

  Future<OkCancelResult> ask({String title, String message}) {
    return showOkCancelAlertDialog(
        context: ExtendedNavigator.root.widget.navigatorKey.currentContext,
        title: title,
        message: message,
        okLabel: AppStrings.yes,
        cancelLabel: AppStrings.no);
  }
}
