import 'package:flutter/foundation.dart';

class LogInfo{
  void logInfo({required Object text}) {
    if (kDebugMode) {
      print("调试日志$text");
    }
  }
}