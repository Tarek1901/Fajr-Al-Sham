import 'package:flutter/material.dart';
import 'package:fajr_al_sham/flutter_flow/flutter_flow_theme.dart';
import 'package:fajr_al_sham/flutter_flow/flutter_flow_util.dart';
import 'summary_card_model.dart';

class SummaryCardWidget extends StatefulWidget {
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
  State<SummaryCardWidget> createState() => _SummaryCardWidgetState();
}

class _SummaryCardWidgetState extends State<SummaryCardWidget> {
  late SummaryCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SummaryCardModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
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
                if (widget.icon != null) widget.icon!,
                Expanded(
                  child: Text(
                    widget.title ?? '',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ),
              ].divide(const SizedBox(width: 8.0)),
            ),
            Text(
              widget.value ?? '',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ].divide(const SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
