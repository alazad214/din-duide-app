import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<PopupMenuButtonState<String>> popUpGlobalkey =
    GlobalKey<PopupMenuButtonState<String>>();

enum StatusType { order, delivery }

Color statuscolor(StatusType status, String statusCode) {
  late Color stcolor;
  if (StatusType.order == status) {
    switch (statusCode) {
      case OrderStatusNo.kPENDING:
        stcolor = OrderStatusColor.kPENDING;
        break;
      case OrderStatusNo.kACCEPTED:
        stcolor = OrderStatusColor.kACCEPTED;
        break;
      case OrderStatusNo.kFOODPROCESSING:
        stcolor = OrderStatusColor.kFOODPROCESSING;
        break;
      case OrderStatusNo.kFOODREADY:
        stcolor = OrderStatusColor.kFOODREADY;
        break;
      case OrderStatusNo.kFOODPICKED:
        stcolor = OrderStatusColor.kFOODPICKED;
        break;
      case OrderStatusNo.kFOODDELIVERED:
        stcolor = OrderStatusColor.kFOODDELIVERED;
        break;
      case OrderStatusNo.kCANCELLED:
        stcolor = OrderStatusColor.kCANCELLED;
        break;
      case OrderStatusNo.kREJECTEDBYSHOP:
        stcolor = OrderStatusColor.kREJECTEDBYSHOP;
        break;
      case OrderStatusNo.kFAILED:
        stcolor = OrderStatusColor.kFAILED;
        break;
    }
  }
  if (StatusType.delivery == status) {
    switch (statusCode) {
      case DeliveryStatusNo.kPENDIG:
        stcolor = DeliveryStatusColor.kPENDING;
        break;
      case DeliveryStatusNo.kONTRANSIT:
        stcolor = DeliveryStatusColor.kONTRANSIT;
        break;
      case DeliveryStatusNo.kARRIVEDATSHOP:
        stcolor = DeliveryStatusColor.kARRIVEDATSHOP;
        break;
      case DeliveryStatusNo.kDELIVERYMANCONFIRMED:
        stcolor = DeliveryStatusColor.kDELIVERYMANCONFIRMED;
        break;
      case DeliveryStatusNo.kDELIVERYSTARTED:
        stcolor = DeliveryStatusColor.kDELIVERYSTARTED;
        break;
      case DeliveryStatusNo.kDELIVERED:
        stcolor = DeliveryStatusColor.kDELIVERED;
        break;
    }
  }

  return stcolor;
}

Future<void> setInitValue() async {
  await Future.delayed(const Duration(seconds: 2));
}

Completer<T> wrapInCompleter<T>(Future<T> future) {
  final completer = Completer<T>();
  future.then(completer.complete).catchError(completer.completeError);
  return completer;
}

Future<void> getInvisible() async {
  Future.delayed(const Duration(milliseconds: 500), () {});
}

Future<File> getLocalFile(String filename) async {
  File f = File(filename);
  return f;
}
