import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _islogin = prefs.getBool('ff_islogin') ?? _islogin;
    });
    _safeInit(() {
      _isintro = prefs.getBool('ff_isintro') ?? _isintro;
    });
    _safeInit(() {
      _introindex = prefs.getInt('ff_introindex') ?? _introindex;
    });
    _safeInit(() {
      _bottomindex = prefs.getInt('ff_bottomindex') ?? _bottomindex;
    });
    _safeInit(() {
      _BankDetailsSa = prefs.getBool('ff_BankDetailsSa') ?? _BankDetailsSa;
    });
    _safeInit(() {
      _selectedProviderCode =
          prefs.getString('ff_selectedProviderCode') ?? _selectedProviderCode;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<RecentactivityStruct> _recentactivity = [
    RecentactivityStruct.fromSerializableMap(jsonDecode(
        '{\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walletify-e-wallet-app-uqsvi2/assets/v4emk4s2qk4c/img-1.png\",\"name\":\"Ronald richards\",\"date\":\"August 05, 2024\",\"massges\":\"Recieved\",\"idname\":\"@ralph_edwards\",\"dollar\":\"+\$832.00\",\"id\":\"0\",\"images\":\"img-1.png\"}')),
    RecentactivityStruct.fromSerializableMap(jsonDecode(
        '{\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walletify-e-wallet-app-uqsvi2/assets/dqhbldmdu6um/img-2.png\",\"name\":\"Ralph edwards\",\"date\":\"August 05, 2024\",\"massges\":\"Sent\",\"idname\":\"@ronald_richards\",\"dollar\":\"+\$32.00\",\"id\":\"1\",\"images\":\"img-2.png\"}')),
    RecentactivityStruct.fromSerializableMap(jsonDecode(
        '{\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walletify-e-wallet-app-uqsvi2/assets/duww8u9git4r/img-3.png\",\"name\":\"Esther howards\",\"date\":\"August 03, 2024\",\"massges\":\"Pending\",\"idname\":\"@jenny_wilson\",\"dollar\":\"+42.00\",\"id\":\"2\",\"images\":\"img-3.png\"}')),
    RecentactivityStruct.fromSerializableMap(jsonDecode(
        '{\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walletify-e-wallet-app-uqsvi2/assets/iof8fxubtn3h/img-4.png\",\"name\":\"Jenny wilson \",\"date\":\"August 03, 2024\",\"massges\":\"Cancelled\",\"idname\":\"@jenny_wilson\",\"dollar\":\"+42.00\",\"id\":\"3\",\"images\":\"img-4.png\"}')),
    RecentactivityStruct.fromSerializableMap(jsonDecode(
        '{\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walletify-e-wallet-app-uqsvi2/assets/3b8qpmtd3kvc/img-6.png\",\"name\":\"John cooper\",\"date\":\"August 03, 2024\",\"massges\":\"Sent\",\"idname\":\"@robert_fox\",\"dollar\":\"+42.00\",\"id\":\"4\",\"images\":\"img-6.png\"}')),
    RecentactivityStruct.fromSerializableMap(jsonDecode(
        '{\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walletify-e-wallet-app-uqsvi2/assets/2zw9ght8kq2m/img-7.png\",\"name\":\"Kristin Watson\",\"date\":\"August 03, 2024\",\"massges\":\"Recieved\",\"idname\":\"@Leslie_alexender\",\"dollar\":\"+42.00\",\"id\":\"5\",\"images\":\"img-7.png\"}')),
    RecentactivityStruct.fromSerializableMap(jsonDecode(
        '{\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walletify-e-wallet-app-uqsvi2/assets/nu4drpib88j3/img-8.png\",\"name\":\"Leslie alexender\",\"date\":\"August 03, 2024\",\"massges\":\"Cancelled\",\"idname\":\"@esther_howards\",\"dollar\":\"+42.00\",\"id\":\"6\",\"images\":\"img-8.png\"}')),
    RecentactivityStruct.fromSerializableMap(jsonDecode(
        '{\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walletify-e-wallet-app-uqsvi2/assets/o6ur9gyvly14/img-9.png\",\"name\":\"Ronald richards\",\"date\":\"August 03, 2024\",\"massges\":\"Recieved\",\"idname\":\"@Kristin_watson\",\"dollar\":\"+42.00\",\"id\":\"7\",\"images\":\"img-9.png\"}')),
    RecentactivityStruct.fromSerializableMap(jsonDecode(
        '{\"img\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/walletify-e-wallet-app-uqsvi2/assets/dqhbldmdu6um/img-2.png\",\"name\":\"Ronald richards\",\"date\":\"August 03, 2024\",\"massges\":\"Recieved\",\"idname\":\"@Kristin_watson\",\"dollar\":\"+42.00\",\"id\":\"8\",\"images\":\"img-2.png\"}'))
  ];
  List<RecentactivityStruct> get recentactivity => _recentactivity;
  set recentactivity(List<RecentactivityStruct> value) {
    _recentactivity = value;
  }

  void addToRecentactivity(RecentactivityStruct value) {
    recentactivity.add(value);
  }

  void removeFromRecentactivity(RecentactivityStruct value) {
    recentactivity.remove(value);
  }

  void removeAtIndexFromRecentactivity(int index) {
    recentactivity.removeAt(index);
  }

  void updateRecentactivityAtIndex(
    int index,
    RecentactivityStruct Function(RecentactivityStruct) updateFn,
  ) {
    recentactivity[index] = updateFn(_recentactivity[index]);
  }

  void insertAtIndexInRecentactivity(int index, RecentactivityStruct value) {
    recentactivity.insert(index, value);
  }

  bool _islogin = false;
  bool get islogin => _islogin;
  set islogin(bool value) {
    _islogin = value;
    prefs.setBool('ff_islogin', value);
  }

  bool _isintro = false;
  bool get isintro => _isintro;
  set isintro(bool value) {
    _isintro = value;
    prefs.setBool('ff_isintro', value);
  }

  int _introindex = 0;
  int get introindex => _introindex;
  set introindex(int value) {
    _introindex = value;
    prefs.setInt('ff_introindex', value);
  }

  int _bottomindex = 0;
  int get bottomindex => _bottomindex;
  set bottomindex(int value) {
    _bottomindex = value;
    prefs.setInt('ff_bottomindex', value);
  }

  String _countryCode = '';
  String get countryCode => _countryCode;
  set countryCode(String value) {
    _countryCode = value;
  }

  List<ChartdataStruct> _chartdata = [
    ChartdataStruct.fromSerializableMap(
        jsonDecode('{\"id\":\"0\",\"xvalue\":\"Mon\",\"yvalue\":\"0\"}')),
    ChartdataStruct.fromSerializableMap(
        jsonDecode('{\"id\":\"1\",\"xvalue\":\"Tue\",\"yvalue\":\"5\"}')),
    ChartdataStruct.fromSerializableMap(
        jsonDecode('{\"id\":\"2\",\"xvalue\":\"Wed\",\"yvalue\":\"10\"}')),
    ChartdataStruct.fromSerializableMap(
        jsonDecode('{\"id\":\"3\",\"xvalue\":\"Thu\",\"yvalue\":\"15\"}')),
    ChartdataStruct.fromSerializableMap(
        jsonDecode('{\"id\":\"4\",\"xvalue\":\"Fri\",\"yvalue\":\"20\"}'))
  ];
  List<ChartdataStruct> get chartdata => _chartdata;
  set chartdata(List<ChartdataStruct> value) {
    _chartdata = value;
  }

  void addToChartdata(ChartdataStruct value) {
    chartdata.add(value);
  }

  void removeFromChartdata(ChartdataStruct value) {
    chartdata.remove(value);
  }

  void removeAtIndexFromChartdata(int index) {
    chartdata.removeAt(index);
  }

  void updateChartdataAtIndex(
    int index,
    ChartdataStruct Function(ChartdataStruct) updateFn,
  ) {
    chartdata[index] = updateFn(_chartdata[index]);
  }

  void insertAtIndexInChartdata(int index, ChartdataStruct value) {
    chartdata.insert(index, value);
  }

  List<NotificationStruct> _notification = [
    NotificationStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Notifications show when you swipe\",\"time\":\"10 Min\"}')),
    NotificationStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"How can I get full details of UPI transaction\",\"time\":\"15 Min\"}')),
    NotificationStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"What is the full form of RuPay\",\"time\":\"20 Min\"}')),
    NotificationStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Is UPI private or government\",\"time\":\"26 Min\"}')),
    NotificationStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"UPI is slowly becoming the most preferred form of digital payment.\",\"time\":\"30 Min\"}'))
  ];
  List<NotificationStruct> get notification => _notification;
  set notification(List<NotificationStruct> value) {
    _notification = value;
  }

  void addToNotification(NotificationStruct value) {
    notification.add(value);
  }

  void removeFromNotification(NotificationStruct value) {
    notification.remove(value);
  }

  void removeAtIndexFromNotification(int index) {
    notification.removeAt(index);
  }

  void updateNotificationAtIndex(
    int index,
    NotificationStruct Function(NotificationStruct) updateFn,
  ) {
    notification[index] = updateFn(_notification[index]);
  }

  void insertAtIndexInNotification(int index, NotificationStruct value) {
    notification.insert(index, value);
  }

  bool _DropDownVisibilit = false;
  bool get DropDownVisibilit => _DropDownVisibilit;
  set DropDownVisibilit(bool value) {
    _DropDownVisibilit = value;
  }

  QRCodeDateBaseStruct _QRCodeInfor = QRCodeDateBaseStruct.fromSerializableMap(
      jsonDecode(
          '{\"QRAmount\":\"1005\",\"QRUserName\":\"xnxhn\",\"QRItemNameOrPurpose\":\"xbxb\"}'));
  QRCodeDateBaseStruct get QRCodeInfor => _QRCodeInfor;
  set QRCodeInfor(QRCodeDateBaseStruct value) {
    _QRCodeInfor = value;
  }

  void updateQRCodeInforStruct(Function(QRCodeDateBaseStruct) updateFn) {
    updateFn(_QRCodeInfor);
  }

  TransactionStruct _latestReceivedTransaction =
      TransactionStruct.fromSerializableMap(jsonDecode('{}'));
  TransactionStruct get latestReceivedTransaction => _latestReceivedTransaction;
  set latestReceivedTransaction(TransactionStruct value) {
    _latestReceivedTransaction = value;
  }

  void updateLatestReceivedTransactionStruct(
      Function(TransactionStruct) updateFn) {
    updateFn(_latestReceivedTransaction);
  }

  QRCodeDateBaseStruct _scannedTransactionDetail = QRCodeDateBaseStruct();
  QRCodeDateBaseStruct get scannedTransactionDetail =>
      _scannedTransactionDetail;
  set scannedTransactionDetail(QRCodeDateBaseStruct value) {
    _scannedTransactionDetail = value;
  }

  void updateScannedTransactionDetailStruct(
      Function(QRCodeDateBaseStruct) updateFn) {
    updateFn(_scannedTransactionDetail);
  }

  bool _BankDetailsSa = false;
  bool get BankDetailsSa => _BankDetailsSa;
  set BankDetailsSa(bool value) {
    _BankDetailsSa = value;
    prefs.setBool('ff_BankDetailsSa', value);
  }

  bool _SaveMobileMoneyDetiles = false;
  bool get SaveMobileMoneyDetiles => _SaveMobileMoneyDetiles;
  set SaveMobileMoneyDetiles(bool value) {
    _SaveMobileMoneyDetiles = value;
  }

  String _companyLogo = '';
  String get companyLogo => _companyLogo;
  set companyLogo(String value) {
    _companyLogo = value;
  }

  /// Please enter an amount and generate a code.
  String _qrCodeData = '';
  String get qrCodeData => _qrCodeData;
  set qrCodeData(String value) {
    _qrCodeData = value;
  }

  String _selectedProviderCode = '';
  String get selectedProviderCode => _selectedProviderCode;
  set selectedProviderCode(String value) {
    _selectedProviderCode = value;
    prefs.setString('ff_selectedProviderCode', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
