import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'summary_card_model.dart';
export 'summary_card_model.dart';

class SummaryCardWidget extends StatefulWidget {
  const SummaryCardWidget({
    super.key,
    String? label,
    String? value,
    String? tone,
    String? subLabel,
  })  : this.label = label ?? 'Ø§ÙÙØ´Ø§Ø±ÙØ¹ Ø§ÙÙØ³Ø§ÙÙ Ø¨ÙØ§',
        this.value = value ?? '5',
        this.tone = tone ?? 'primary',
        this.subLabel = subLabel ?? 'ÙØ´Ø§Ø±ÙØ¹ ÙØ´Ø·Ø©';

  final String label;
  final String value;
  final String tone;
  final String subLabel;

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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                valueOrDefault<String>(
                  widget!.label,
                  'Ø§ÙÙØ´Ø§Ø±ÙØ¹ Ø§ÙÙØ³Ø§ÙÙ Ø¨ÙØ§',
                ),
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      font: GoogleFonts.spaceGrotesk(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      lineHeight: 1.2,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  widget!.value,
                  '5',
                ),
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      font: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      ),
                      color: valueOrDefault<Color>(
                        () {
                          if (valueOrDefault<String>(
                                widget!.tone,
                                'primary',
                              ) ==
                              'primary') {
                            return FlutterFlowTheme.of(context).primary;
                          } else if (valueOrDefault<String>(
                                widget!.tone,
                                'primary',
                              ) ==
                              'success') {
                            return FlutterFlowTheme.of(context).success;
                          } else {
                            return FlutterFlowTheme.of(context).primaryText;
                          }
                        }(),
                        FlutterFlowTheme.of(context).primary,
                      ),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      lineHeight: 1.4,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  widget!.subLabel,
                  'ÙØ´Ø§Ø±ÙØ¹ ÙØ´Ø·Ø©',
                ),
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      font: GoogleFonts.spaceGrotesk(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      lineHeight: 1.2,
                    ),
              ),
            ].divide(SizedBox(height: 4)),
          ),
        ),
      ),
    );
  }
}
