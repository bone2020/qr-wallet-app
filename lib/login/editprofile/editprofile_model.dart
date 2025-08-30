import '/appbar/single_appbar/single_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'editprofile_widget.dart' show EditprofileWidget;
import 'package:flutter/material.dart';

class EditprofileModel extends FlutterFlowModel<EditprofileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for SingleAppbar component.
  late SingleAppbarModel singleAppbarModel;
  bool isDataUploading_uploadData7w3 = false;
  FFUploadedFile uploadedLocalFile_uploadData7w3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_profilePicAppstate = false;
  FFUploadedFile uploadedLocalFile_profilePicAppstate =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for ProfileUserName widget.
  FocusNode? profileUserNameFocusNode;
  TextEditingController? profileUserNameTextController;
  String? Function(BuildContext, String?)?
      profileUserNameTextControllerValidator;
  String? _profileUserNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter valid name';
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
      return 'Please enter valid email address';
    }
    return null;
  }

  // State field(s) for PhoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for BrandName widget.
  FocusNode? brandNameFocusNode;
  TextEditingController? brandNameTextController;
  String? Function(BuildContext, String?)? brandNameTextControllerValidator;
  bool isDataUploading_companyLogo = false;
  FFUploadedFile uploadedLocalFile_companyLogo =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for message widget.
  FocusNode? messageFocusNode;
  TextEditingController? messageTextController;
  String? Function(BuildContext, String?)? messageTextControllerValidator;

  @override
  void initState(BuildContext context) {
    singleAppbarModel = createModel(context, () => SingleAppbarModel());
    profileUserNameTextControllerValidator =
        _profileUserNameTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
  }

  @override
  void dispose() {
    singleAppbarModel.dispose();
    profileUserNameFocusNode?.dispose();
    profileUserNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    brandNameFocusNode?.dispose();
    brandNameTextController?.dispose();

    messageFocusNode?.dispose();
    messageTextController?.dispose();
  }
}
