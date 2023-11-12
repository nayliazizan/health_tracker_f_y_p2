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

class AddMedicModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for medicNameField widget.
  TextEditingController? medicNameFieldController;
  String? Function(BuildContext, String?)? medicNameFieldControllerValidator;
  // State field(s) for medicDosageField widget.
  TextEditingController? medicDosageFieldController;
  String? Function(BuildContext, String?)? medicDosageFieldControllerValidator;
  // State field(s) for frequencyField widget.
  TextEditingController? frequencyFieldController;
  String? Function(BuildContext, String?)? frequencyFieldControllerValidator;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    medicNameFieldController?.dispose();
    medicDosageFieldController?.dispose();
    frequencyFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
