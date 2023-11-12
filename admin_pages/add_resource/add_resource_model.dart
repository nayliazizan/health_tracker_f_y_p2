import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddResourceModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for resourceNameField widget.
  TextEditingController? resourceNameFieldController;
  String? Function(BuildContext, String?)? resourceNameFieldControllerValidator;
  // State field(s) for resourceDescField widget.
  TextEditingController? resourceDescFieldController;
  String? Function(BuildContext, String?)? resourceDescFieldControllerValidator;
  // State field(s) for linkurlField widget.
  TextEditingController? linkurlFieldController;
  String? Function(BuildContext, String?)? linkurlFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    resourceNameFieldController?.dispose();
    resourceDescFieldController?.dispose();
    linkurlFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
