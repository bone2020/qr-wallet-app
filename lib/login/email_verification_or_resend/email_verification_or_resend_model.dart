import '/appbar/single_appbar/single_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'email_verification_or_resend_widget.dart'
    show EmailVerificationOrResendWidget;
import 'package:flutter/material.dart';

class EmailVerificationOrResendModel
    extends FlutterFlowModel<EmailVerificationOrResendWidget> {
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
