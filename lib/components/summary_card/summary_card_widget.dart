import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class SummaryCardWidget extends StatelessWidget {
  const SummaryCardWidget({
    super.key,
    this.title,
    this.value,
    this.icon,
  });

  final String? title;
  final String? value;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (icon != null) icon!,
                Expanded(
                  child: Text(
                    title ?? '',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ].divide(const SizedBox(width: 8.0)),
            ),
            Text(
              value ?? '',
              style: FlutterFlowTheme.of(context).titleLarge,
            ),
          ].divide(const SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
