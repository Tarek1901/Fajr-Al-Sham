import 'package:flutter/material.dart';

extension StateFixes<T extends StatefulWidget> on State<T> {
  void safeSetState(VoidCallback fn) {
    if (mounted) {
      // ignore: invalid_use_of_protected_member
      setState(fn);
    }
  }

  Widget wrapWithModel({
    required dynamic model,
    required Widget child,
    required VoidCallback updateCallback,
    bool updateCallbackOnDispose = false,
  }) {
    return child;
  }
}
