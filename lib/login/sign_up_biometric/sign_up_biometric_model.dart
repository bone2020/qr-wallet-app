import '/appbar/single_appbar/single_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'sign_up_biometric_widget.dart' show SignUpBiometricWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpBiometricModel extends FlutterFlowModel<SignUpBiometricWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for SingleAppbar component.
  late SingleAppbarModel singleAppbarModel;
  // State field(s) for SignUpNextOfKing widget.
  FocusNode? signUpNextOfKingFocusNode;
  TextEditingController? signUpNextOfKingTextController;
  String? Function(BuildContext, String?)?
      signUpNextOfKingTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  bool isDataUploading_biometricIDFrontAppState = false;
  FFUploadedFile uploadedLocalFile_biometricIDFrontAppState =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_biometricIDBackAppState = false;
  FFUploadedFile uploadedLocalFile_biometricIDBackAppState =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadData0p1 = false;
  FFUploadedFile uploadedLocalFile_uploadData0p1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData0p1 = '';

  DateTime? datePicked;
  bool isDataUploading_signupIDFrontfire = false;
  FFUploadedFile uploadedLocalFile_signupIDFrontfire =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_signupIDFrontfire = '';

  @override
  void initState(BuildContext context) {
    singleAppbarModel = createModel(context, () => SingleAppbarModel());
  }

  @override
  void dispose() {
    singleAppbarModel.dispose();
    signUpNextOfKingFocusNode?.dispose();
    signUpNextOfKingTextController?.dispose();
  }
}
