import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SymptomsAddModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Q1_field widget.
  TextEditingController? q1FieldController;
  String? Function(BuildContext, String?)? q1FieldControllerValidator;
  // State field(s) for Q2_field widget.
  TextEditingController? q2FieldController;
  String? Function(BuildContext, String?)? q2FieldControllerValidator;
  // State field(s) for Q3_field widget.
  TextEditingController? q3FieldController;
  String? Function(BuildContext, String?)? q3FieldControllerValidator;
  // State field(s) for Q4_field widget.
  TextEditingController? q4FieldController;
  String? Function(BuildContext, String?)? q4FieldControllerValidator;
  // State field(s) for Q5_field widget.
  TextEditingController? q5FieldController;
  String? Function(BuildContext, String?)? q5FieldControllerValidator;
  // State field(s) for Q6_field widget.
  TextEditingController? q6FieldController;
  String? Function(BuildContext, String?)? q6FieldControllerValidator;
  // State field(s) for Q7_field widget.
  TextEditingController? q7FieldController;
  String? Function(BuildContext, String?)? q7FieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    q1FieldController?.dispose();
    q2FieldController?.dispose();
    q3FieldController?.dispose();
    q4FieldController?.dispose();
    q5FieldController?.dispose();
    q6FieldController?.dispose();
    q7FieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
