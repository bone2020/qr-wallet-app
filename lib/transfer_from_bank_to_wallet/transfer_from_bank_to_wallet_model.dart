import '/appbar/single_appbar/single_appbar_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'transfer_from_bank_to_wallet_widget.dart'
    show TransferFromBankToWalletWidget;
import 'package:flutter/material.dart';

class TransferFromBankToWalletModel
    extends FlutterFlowModel<TransferFromBankToWalletWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for SingleAppbar component.
  late SingleAppbarModel singleAppbarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (initializeTransaction)] action in Button widget.
  ApiCallResponse? paystackResponse;

  @override
  void initState(BuildContext context) {
    singleAppbarModel = createModel(context, () => SingleAppbarModel());
  }

  @override
  void dispose() {
    singleAppbarModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}
