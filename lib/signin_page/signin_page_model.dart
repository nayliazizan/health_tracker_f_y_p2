import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SigninPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for email-signin widget.
  TextEditingController? emailSigninController;
  String? Function(BuildContext, String?)? emailSigninControllerValidator;
  // State field(s) for password-signin widget.
  TextEditingController? passwordSigninController;
  late bool passwordSigninVisibility;
  String? Function(BuildContext, String?)? passwordSigninControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordSigninVisibility = false;
  }

  void dispose() {
    emailSigninController?.dispose();
    passwordSigninController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
