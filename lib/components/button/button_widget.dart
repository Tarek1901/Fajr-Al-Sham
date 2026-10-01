import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.icon,
    bool? iconPresent,
    this.iconEnd,
    bool? iconEndPresent,
    String? content,
    String? variant,
    String? size,
    bool? fullWidth,
    bool? loading,
    bool? disabled,
  })  : iconPresent = iconPresent ?? false,
        iconEndPresent = iconEndPresent ?? false,
        content = content ?? 'عرض الكل',
        variant = variant ?? 'ghost',
        size = size ?? 'small',
        fullWidth = fullWidth ?? false,
        loading = loading ?? false,
        disabled = disabled ?? false;

  final Widget? icon;
  final bool iconPresent;

  final Widget? iconEnd;
  final bool iconEndPresent;

  final String content;
  final String variant;
  final String size;

  final bool fullWidth;
  final bool loading;
  final bool disabled;

  Color _backgroundColor(BuildContext context) {
    switch (variant) {
      case 'secondary':
        return FlutterFlowTheme.of(context).secondary;

      case 'destructive':
        return FlutterFlowTheme.of(context).error;

      case 'outline':
      case 'ghost':
        return Colors.transparent;

      default:
        return FlutterFlowTheme.of(context).primary;
    }
  }

  Color _textColor(BuildContext context) {
    switch (variant) {
      case 'secondary':
        return FlutterFlowTheme.of(context).onSecondary;

      case 'outline':
        return FlutterFlowTheme.of(context).primaryText;

      case 'ghost':
        return FlutterFlowTheme.of(context).primary;

      case 'destructive':
        return FlutterFlowTheme.of(context).onError;

      default:
        return FlutterFlowTheme.of(context).onPrimary;
    }
  }

  double _radius() {
    switch (size) {
      case 'small':
        return 8.0;
      case 'large':
        return 16.0;
      default:
        return 12.0;
    }
  }

  EdgeInsets _padding() {
    switch (size) {
      case 'small':
        return const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        );

      case 'large':
        return const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        );

      default:
        return const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColor = _textColor(context);

    return Opacity(
      opacity: disabled ? 0.55 : 1.0,
      child: Container(
        width: fullWidth ? double.infinity : null,
        decoration: BoxDecoration(
          color: _backgroundColor(context),
          borderRadius: BorderRadius.circular(_radius()),
          border: variant == 'outline'
              ? Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 1,
                )
              : null,
        ),
        child: Padding(
          padding: _padding(),
          child: loading
              ? SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      textColor,
                    ),
                  ),
                )
              : Row(
                  mainAxisSize:
                      fullWidth ? MainAxisSize.max : MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (iconPresent && icon != null) icon!,

                    if (iconPresent && icon != null)
                      const SizedBox(width: 8),

                    Text(
                      content,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                            fontFamily: 'Space Grotesk',
                            color: textColor,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                            lineHeight: 1.2,
                          ),
                    ),

                    if (iconEndPresent && iconEnd != null)
                      const SizedBox(width: 8),

                    if (iconEndPresent && iconEnd != null) iconEnd!,
                  ],
                ),
        ),
      ),
    );
  }
}
