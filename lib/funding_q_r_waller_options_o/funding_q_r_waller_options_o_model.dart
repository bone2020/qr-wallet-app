import '/appbar/single_appbar/single_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'funding_q_r_waller_options_o_widget.dart'
    show FundingQRWallerOptionsOWidget;
import 'package:flutter/material.dart';

class FundingQRWallerOptionsOModel
    extends FlutterFlowModel<FundingQRWallerOptionsOWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for SingleAppbar component.
  late SingleAppbarModel singleAppbarModel;

  @override
  void initState(BuildContext context) {
    singleAppbarModel = createModel(context, () => SingleAppbarModel());
  }

  @override
  void dispose() {
    singleAppbarModel.dispose();
  }
}
