import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

QRCodeDateBaseStruct parseQrData(String? qrString) {
  try {
    if (qrString == null || qrString.isEmpty) {
      print('Error: Input QR string is null or empty.');
      return QRCodeDateBaseStruct(
        transactionID: '',
        buyerID: '',
        sellerID: '',
        amount: 0.0,
        buyersDisplayName: '',
        sellersDisplayName: '',
        itemOrPurpose: '',
        timeStamp: DateTime.fromMillisecondsSinceEpoch(0),
        status: '',
        companyName: null,
        companyLog: null,
        companyMessage: null,
        userName: '',
      );
    }

    final Map<String, dynamic> data = jsonDecode(qrString);
    return QRCodeDateBaseStruct.fromMap(data);
  } catch (e) {
    print('Error parsing QR data: $e');
    return QRCodeDateBaseStruct(
      transactionID: '',
      buyerID: '',
      sellerID: '',
      amount: 0.0,
      buyersDisplayName: '',
      sellersDisplayName: '',
      itemOrPurpose: '',
      timeStamp: DateTime.fromMillisecondsSinceEpoch(0),
      status: '',
      companyName: null,
      companyLog: null,
      companyMessage: null,
      userName: '',
    );
  }
}

String? getJsonValue(
  String? jsonString,
  String jsonPath,
) {
  // This function safely parses a JSON string and returns a value from it.
  if (jsonString == null || jsonString.isEmpty) {
    return null;
  }
  try {
    final parsedJson = json.decode(jsonString);
    // We assume a simple, flat JSON structure.
    // The 'jsonPath' will be the key, e.g., "receiverId", "amount".
    return parsedJson[jsonPath]?.toString();
  } catch (e) {
    print('Error parsing JSON or getting path: $e');
    return null;
  }
}
