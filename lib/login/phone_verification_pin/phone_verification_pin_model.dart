import '/appbar/single_appbar/single_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'phone_verification_pin_widget.dart' show PhoneVerificationPinWidget;
import 'package:flutter/material.dart';

class PhoneVerificationPinModel
    extends FlutterFlowModel<PhoneVerificationPinWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for SingleAppbar component.
  late SingleAppbarModel singleAppbarModel;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  String? _pinCodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter valid OTP';
    }
    if (val.length < 6) {
      return 'Requires 6 characters.';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    singleAppbarModel = createModel(context, () => SingleAppbarModel());
    pinCodeController = TextEditingController();
    pinCodeControllerValidator = _pinCodeControllerValidator;
  }

  @override
  void dispose() {
    singleAppbarModel.dispose();
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
