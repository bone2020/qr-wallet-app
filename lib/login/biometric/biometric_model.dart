import '/appbar/single_appbar/single_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'biometric_widget.dart' show BiometricWidget;
import 'package:flutter/material.dart';

class BiometricModel extends FlutterFlowModel<BiometricWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for SingleAppbar component.
  late SingleAppbarModel singleAppbarModel;
  // State field(s) for FullNameFieldBIO widget.
  FocusNode? fullNameFieldBIOFocusNode;
  TextEditingController? fullNameFieldBIOTextController;
  String? Function(BuildContext, String?)?
      fullNameFieldBIOTextControllerValidator;
  // State field(s) for UserName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
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
  // State field(s) for NextOfKing widget.
  FocusNode? nextOfKingFocusNode;
  TextEditingController? nextOfKingTextController;
  String? Function(BuildContext, String?)? nextOfKingTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  bool isDataUploading_biometricIDFrontAppState1 = false;
  FFUploadedFile uploadedLocalFile_biometricIDFrontAppState1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_biometricIDFrontFirebase = false;
  FFUploadedFile uploadedLocalFile_biometricIDFrontFirebase =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_biometricIDBackFirebase = false;
  FFUploadedFile uploadedLocalFile_biometricIDBackFirebase =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadDataBio = false;
  FFUploadedFile uploadedLocalFile_uploadDataBio =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataBio = '';

  DateTime? datePicked;
  bool isDataUploading_biometricIDfront = false;
  FFUploadedFile uploadedLocalFile_biometricIDfront =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_biometricIDfront = '';

  @override
  void initState(BuildContext context) {
    singleAppbarModel = createModel(context, () => SingleAppbarModel());
    emailTextControllerValidator = _emailTextControllerValidator;
  }

  @override
  void dispose() {
    singleAppbarModel.dispose();
    fullNameFieldBIOFocusNode?.dispose();
    fullNameFieldBIOTextController?.dispose();

    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    nextOfKingFocusNode?.dispose();
    nextOfKingTextController?.dispose();
  }
}
