import '/appbar/single_appbar/single_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'phone_number_input_verifi_widget.dart'
    show PhoneNumberInputVerifiWidget;
import 'package:flutter/material.dart';

class PhoneNumberInputVerifiModel
    extends FlutterFlowModel<PhoneNumberInputVerifiWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for SingleAppbar component.
  late SingleAppbarModel singleAppbarModel;
  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;

  @override
  void initState(BuildContext context) {
    singleAppbarModel = createModel(context, () => SingleAppbarModel());
  }

  @override
  void dispose() {
    singleAppbarModel.dispose();
    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();
  }
}
