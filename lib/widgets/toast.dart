import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../routes/route.dart';

final FToast fToast = FToast();
bool _isInit = false;

void toast(dynamic message, {Duration? duration}) {
  if (!initFToast()) return;

  final toast = ToastWidget(child: Builder(builder: (context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: Text(message.toString(),
                style: TextStyle(color: Colors.black))),
      ],
    );
  }));

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: duration ?? Duration(seconds: 2),
  );
}

bool initFToast() {
  if (!_isInit) {
    final context = AppRoute.navigatorKey.currentContext;
    if (context == null) {
      return false;
    }
    fToast.init(context);
    _isInit = true;
  }
  return true;
}

void toastSuccess0(dynamic message, {Duration? duration}) {
  toastSuccess(message: message, duration: duration);
}

void toastSuccess({dynamic message, Duration? duration}) {
  if (!initFToast()) return;

  message ??= '成功';

  final toast = ToastWidget(
      child: Builder(
          builder: (context) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check, color: Colors.green),
              SizedBox(width: 12.0),
              Flexible(
                  child: Text(message.toString(),
                      style: TextStyle(color: Colors.black))),
            ],
          )));

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: duration ?? Duration(seconds: 2),
  );
}

void toastFailure0(dynamic message, {error, Duration? duration}) {
  toastFailure(message: message, error: error, duration: duration);
}

void toastFailure({dynamic message, error, Duration? duration}) {
  if (!initFToast()) return;

  message ??= '失败';

  final toast = ToastWidget(child: Builder(builder: (context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.clear, color: Colors.red),
        SizedBox(width: 12.0),
        Flexible(
            child: Text("${message}${error != null ? ": ${error}" : ""}",
                style: TextStyle(color: Colors.black))),
      ],
    );
  }));

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.BOTTOM,
    toastDuration: duration ?? Duration(seconds: 2),
  );
}

class ToastWidget extends StatelessWidget {
  final Widget child;

  const ToastWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
