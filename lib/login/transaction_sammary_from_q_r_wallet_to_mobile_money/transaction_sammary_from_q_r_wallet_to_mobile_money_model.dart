import '/appbar/single_appbar/single_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'transaction_sammary_from_q_r_wallet_to_mobile_money_widget.dart'
    show TransactionSammaryFromQRWalletToMobileMoneyWidget;
import 'package:flutter/material.dart';

class TransactionSammaryFromQRWalletToMobileMoneyModel extends FlutterFlowModel<
    TransactionSammaryFromQRWalletToMobileMoneyWidget> {
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
