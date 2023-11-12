import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddDiagnosisModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for diagnosisNameField widget.
  TextEditingController? diagnosisNameFieldController;
  String? Function(BuildContext, String?)?
      diagnosisNameFieldControllerValidator;
  // State field(s) for diagnosisDescField widget.
  TextEditingController? diagnosisDescFieldController;
  String? Function(BuildContext, String?)?
      diagnosisDescFieldControllerValidator;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    diagnosisNameFieldController?.dispose();
    diagnosisDescFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
