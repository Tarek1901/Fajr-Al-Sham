import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

export 'flutter_flow_theme.dart';

T valueOrDefault<T>(T? value, T defaultValue) {
  if (value == null) {
    return defaultValue;
  }

  if (value is String && value.isEmpty) {
    return defaultValue;
  }

  return value;
}

String dateTimeFormat(
  String format,
  DateTime? dateTime, {
  String? locale,
}) {
  if (dateTime == null) {
    return '';
  }

  return DateFormat(format, locale).format(dateTime);
}

Future<void> launchURL(String url) async {
  // Placeholder for FlutterFlow URL action.
}

abstract class FlutterFlowModel<T extends Widget> {
  void initState(BuildContext context) {}

  void dispose() {}

  void onUpdate() {}

  void maybeDispose() {
    dispose();
  }
}

T createModel<T extends FlutterFlowModel>(
  BuildContext context,
  T Function() modelBuilder,
) {
  final model = modelBuilder();
  model.initState(context);
  return model;
}

Widget wrapWithModel({
  required dynamic model,
  required Widget child,
  required VoidCallback updateCallback,
  bool updateCallbackOnDispose = false,
}) {
  if (model is FlutterFlowModel) {
    model.initState(_modelContext);
  }

  return child;
}

BuildContext? _modelContext;

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
    if (isEmpty) {
      return [];
    }

    if (length == 1) {
      return [this[0]];
    }

    final List<Widget> result = [];

    for (var i = 0; i < length; i++) {
      result.add(this[i]);

      if (i != length - 1) {
        result.add(separator);
      }
    }

    return result;
  }
}
