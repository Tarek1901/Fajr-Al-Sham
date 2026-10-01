import '/components/nav_item/nav_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        border: Border(
          top: BorderSide(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NavItemWidget(
            label: 'الرئيسية',
            icon: Icon(
              Icons.home_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24,
            ),
            target: 'HomeDashboard',
            selected: true,
          ),

          NavItemWidget(
            label: 'المشاريع',
            icon: Icon(
              Icons.list_alt_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24,
            ),
            target: 'ProjectsFeed',
            selected: false,
          ),

          NavItemWidget(
            label: 'مساهماتي',
            icon: Icon(
              Icons.donut_large_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24,
            ),
            target: 'MyParticipation',
            selected: false,
          ),

          NavItemWidget(
            label: 'المحفظة',
            icon: Icon(
              Icons.account_balance_wallet_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24,
            ),
            target: 'Wallet',
            selected: false,
          ),

          NavItemWidget(
            label: 'حسابي',
            icon: Icon(
              Icons.person_outline_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24,
            ),
            target: 'UserProfile',
            selected: false,
          ),
        ],
      ),
    );
  }
}
