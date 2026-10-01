import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

export 'flutter_flow_theme.dart';

T valueOrDefault<T>(T? value, T defaultValue) {
  if (value == null) return defaultValue;
  if (value is String && value.isEmpty) return defaultValue;
  return value;
}

String dateTimeFormat(
  String format,
  DateTime? dateTime, {
  String? locale,
}) {
  if (dateTime == null) return '';
  return DateFormat(format, locale).format(dateTime);
}

Future<void> launchURL(String url) async {}

abstract class FlutterFlowModel<T extends Widget> {
  bool _initialized = false;

  void initState(BuildContext context) {}

  void dispose() {}

  void onUpdate() {}

  void maybeDispose() {
    if (_initialized) {
      dispose();
      _initialized = false;
    }
  }

  void markInitialized() {
    _initialized = true;
  }
}

T createModel<T extends FlutterFlowModel>(
  BuildContext context,
  T Function() builder,
) {
  final model = builder();
  model.initState(context);
  model.markInitialized();
  return model;
}

Widget wrapWithModel<T extends FlutterFlowModel>({
  required T model,
  required VoidCallback updateCallback,
  required Widget child,
}) {
  return child;
}

void safeSetState(
  State state,
  VoidCallback callback,
) {
  if (state.mounted) {
    state.setState(callback);
  }
}

class FlutterFlowDynamicModels<T extends FlutterFlowModel> {
  final Map<String, T> _children = {};

  T getModel(
    String id,
    T Function() builder,
  ) {
    return _children.putIfAbsent(id, builder);
  }

  void dispose() {
    for (final model in _children.values) {
      model.dispose();
    }
    _children.clear();
  }
}

extension ListDivideExt<T extends Widget> on List<T> {
  List<Widget> divide(Widget separator) {
    if (isEmpty) return [];

    if (length == 1) {
      return [this[0]];
    }

    final List<Widget> result = [];

    for (int i = 0; i < length; i++) {
      result.add(this[i]);

      if (i != length - 1) {
        result.add(separator);
      }
    }

    return result;
  }
}
