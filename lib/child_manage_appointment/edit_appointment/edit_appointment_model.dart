import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditAppointmentModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for personNameField widget.
  TextEditingController? personNameFieldController;
  String? Function(BuildContext, String?)? personNameFieldControllerValidator;
  // State field(s) for typeAppointmentField widget.
  String? typeAppointmentFieldValue;
  FormFieldController<String>? typeAppointmentFieldValueController;
  // State field(s) for concernDescField widget.
  TextEditingController? concernDescFieldController;
  String? Function(BuildContext, String?)? concernDescFieldControllerValidator;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    personNameFieldController?.dispose();
    concernDescFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
