import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hubco/common/constant/colors.dart';
import 'package:flutter_hubco/common/constant/strings.dart';
import 'package:flutter_hubco/ui/widget/pin_field.dart';
import 'package:flutter_hubco/ui/widget/progress_bar.dart';
import 'package:flutter_hubco/ui/widget/progress_button.dart';
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

  progress() {
    showGeneralDialog(
      context: ExtendedNavigator.root.widget.navigatorKey.currentContext,
      barrierColor: Colors.black12.withOpacity(0.6),
      // background color
      barrierDismissible: false,
      // should dialog be dismissed when tapped outside
      transitionDuration: Duration(milliseconds: 400),
      // how long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) {
        // your widget implementation
        return SizedBox.expand(
            // makes widget fullscreen
            child: Center(
          child: ProgressBar(),
        ));
      },
    );
  }

  showOTP(
      {Function(String) otpValue,
      VoidCallback cancelCallback,
      VoidCallback retryCallback,
      int otpLength = 6}) {
    final TextEditingController otpController = TextEditingController();
    bool isSubmitButtonEnabled = false;

    showDialog(
        context: ExtendedNavigator.root.widget.navigatorKey.currentContext,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, state) {
            otpController.addListener(() {
              final isEnabled = otpController.text.isNotEmpty &&
                  otpController.text.length == otpLength;
              if (isEnabled != isSubmitButtonEnabled) {
                state(() => isSubmitButtonEnabled = isEnabled);
              }
            });
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              //this right here
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        child: Text(
                          AppStrings.otpVerification,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          AppStrings.verificationInstruction,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 40),
                        child: PinCodeTextField(
                          isCupertino: false,
                          maxLength: otpLength,
                          maskCharacter: "\u25CF",
                          hideCharacter: true,
                          pinBoxHeight: 30.0,
                          pinBoxWidth: 30.0,
                          hasTextBorderColor: AppColors.accent,
                          controller: otpController,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(top: 40),
                              child: ProgressButton(
                                text: AppStrings.submit,
                                enabled: isSubmitButtonEnabled,
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  otpValue?.call(otpController.text);
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(),
                          ),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.only(top: 40),
                            child: ProgressButton(
                              enabled: true,
                              text: AppStrings.cancel,
                              onPressed: () {
                                cancelCallback?.call();
                              },
                            ),
                          )),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(
                          AppStrings.notReceiveOtp,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: FlatButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                retryCallback?.call();
                              },
                              child: Text(
                                AppStrings.sendItAgain,
                                style: TextStyle(
                                    color: AppColors.accent,
                                    fontSize: 16,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  image(String imageUrl) {
    showGeneralDialog(
      context: ExtendedNavigator.root.widget.navigatorKey.currentContext,
      barrierColor: Colors.black12.withOpacity(0.6),
      // background color
      barrierDismissible: true,
      barrierLabel: "Test",
      // should dialog be dismissed when tapped outside
      transitionDuration: Duration(milliseconds: 200),
      // how long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) {
        // your widget implementation
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) => ProgressBar(),
                  errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        color: AppColors.red,
                      ))
            ]);
      },
    );
  }
}
