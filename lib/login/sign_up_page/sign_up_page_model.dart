import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sign_up_page_widget.dart' show SignUpPageWidget;
import 'package:flutter/material.dart';

class SignUpPageModel extends FlutterFlowModel<SignUpPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for SignupUserFullName widget.
  FocusNode? signupUserFullNameFocusNode;
  TextEditingController? signupUserFullNameTextController;
  String? Function(BuildContext, String?)?
      signupUserFullNameTextControllerValidator;
  String? _signupUserFullNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter valid full  name';
    }

    return null;
  }

  // State field(s) for UserName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  String? _userNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter valid username';
    }

    return null;
  }

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter valid email address';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for SignupUserPassword widget.
  FocusNode? signupUserPasswordFocusNode;
  TextEditingController? signupUserPasswordTextController;
  late bool signupUserPasswordVisibility;
  String? Function(BuildContext, String?)?
      signupUserPasswordTextControllerValidator;
  String? _signupUserPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter valid password';
    }

    return null;
  }

  // State field(s) for SignupUserPasswordCimfirmation widget.
  FocusNode? signupUserPasswordCimfirmationFocusNode;
  TextEditingController? signupUserPasswordCimfirmationTextController;
  late bool signupUserPasswordCimfirmationVisibility;
  String? Function(BuildContext, String?)?
      signupUserPasswordCimfirmationTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    signupUserFullNameTextControllerValidator =
        _signupUserFullNameTextControllerValidator;
    userNameTextControllerValidator = _userNameTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    signupUserPasswordVisibility = false;
    signupUserPasswordTextControllerValidator =
        _signupUserPasswordTextControllerValidator;
    signupUserPasswordCimfirmationVisibility = false;
  }

  @override
  void dispose() {
    signupUserFullNameFocusNode?.dispose();
    signupUserFullNameTextController?.dispose();

    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    signupUserPasswordFocusNode?.dispose();
    signupUserPasswordTextController?.dispose();

    signupUserPasswordCimfirmationFocusNode?.dispose();
    signupUserPasswordCimfirmationTextController?.dispose();
  }
}
