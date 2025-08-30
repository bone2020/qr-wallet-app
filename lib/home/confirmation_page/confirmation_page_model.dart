import '/appbar/single_appbar/single_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'confirmation_page_widget.dart' show ConfirmationPageWidget;
import 'package:flutter/material.dart';

class ConfirmationPageModel extends FlutterFlowModel<ConfirmationPageWidget> {
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
