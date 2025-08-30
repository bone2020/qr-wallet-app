import '/appbar/single_appbar/single_appbar_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'payment_confirmation_page_widget.dart'
    show PaymentConfirmationPageWidget;
import 'package:flutter/material.dart';

class PaymentConfirmationPageModel
    extends FlutterFlowModel<PaymentConfirmationPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for SingleAppbar component.
  late SingleAppbarModel singleAppbarModel;
  // Stores action output result for [Backend Call - API (internalTransfer)] action in Button widget.
  ApiCallResponse? internalTransaction;

  @override
  void initState(BuildContext context) {
    singleAppbarModel = createModel(context, () => SingleAppbarModel());
  }

  @override
  void dispose() {
    singleAppbarModel.dispose();
  }
}
