import '/appbar/single_appbar/single_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'mobile_money_transaction_sammarypage_widget.dart'
    show MobileMoneyTransactionSammarypageWidget;
import 'package:flutter/material.dart';

class MobileMoneyTransactionSammarypageModel
    extends FlutterFlowModel<MobileMoneyTransactionSammarypageWidget> {
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
