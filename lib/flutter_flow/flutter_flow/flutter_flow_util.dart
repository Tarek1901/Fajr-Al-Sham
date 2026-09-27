import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

export 'flutter_flow_theme.dart';

T valueOrDefault<T>(T? value, T defaultValue) =>
    (value == null || (value is String && value.isEmpty)) ? defaultValue : value;

String dateTimeFormat(String format, DateTime? dateTime, {String? locale}) {
  if (dateTime == null) {
    return '';
  }
  return DateFormat(format, locale).format(dateTime);
}

Future launchURL(String url) async {}

abstract class FlutterFlowModel<T extends Widget> {
  void initState(BuildContext context);
  void dispose();
}

class FlutterFlowDynamicModels<T extends FlutterFlowModel> {
  final Map<String, T> _children = {};
  T getModel(String id, T Function() builder) {
    return _children.putIfAbsent(id, builder);
  }
  void dispose() {
    for (var model in _children.values) {
      model.dispose();
    }
  }
}
