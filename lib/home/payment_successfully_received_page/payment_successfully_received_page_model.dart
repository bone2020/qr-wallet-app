import '/appbar/single_appbar/single_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_successfully_received_page_widget.dart'
    show PaymentSuccessfullyReceivedPageWidget;
import 'package:flutter/material.dart';

class PaymentSuccessfullyReceivedPageModel
    extends FlutterFlowModel<PaymentSuccessfullyReceivedPageWidget> {
  ///  State fields for stateful widgets in this page.

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
