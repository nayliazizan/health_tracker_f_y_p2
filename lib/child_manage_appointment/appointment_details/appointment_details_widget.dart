import '/backend/backend.dart';
import '/child_manage_appointment/edit_appointment/edit_appointment_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appointment_details_model.dart';
export 'appointment_details_model.dart';

class AppointmentDetailsWidget extends StatefulWidget {
  const AppointmentDetailsWidget({
    Key? key,
    this.appointmentData,
  }) : super(key: key);

  final DocumentReference? appointmentData;

  @override
  _AppointmentDetailsWidgetState createState() =>
      _AppointmentDetailsWidgetState();
}

class _AppointmentDetailsWidgetState extends State<AppointmentDetailsWidget> {
  late AppointmentDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppointmentDetailsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppointmentsRecord>(
      stream: AppointmentsRecord.getDocument(widget.appointmentData!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final appointmentDetailsAppointmentsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              title: Text(
                'Appointment Details',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Type of Appointment',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              appointmentDetailsAppointmentsRecord
                                  .appointmentType,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Your Concerns',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              appointmentDetailsAppointmentsRecord
                                  .appointmentDesc,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'For',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              appointmentDetailsAppointmentsRecord
                                  .appointmentName,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Text(
                                'When',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            dateTimeFormat(
                                'MMMEd',
                                appointmentDetailsAppointmentsRecord
                                    .appointmentTime!),
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                dateTimeFormat(
                                    'jm',
                                    appointmentDetailsAppointmentsRecord
                                        .appointmentTime!),
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 36.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: Color(0x230E151B),
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => FocusScope.of(context)
                                    .requestFocus(_model.unfocusNode),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: EditAppointmentWidget(
                                    appointmentRef:
                                        appointmentDetailsAppointmentsRecord,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        text: 'Reschedule',
                        options: FFButtonOptions(
                          width: 300.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).textColor,
                                fontSize: 18.0,
                              ),
                          elevation: 6.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 36.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await widget.appointmentData!.delete();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Your appointment have cancelled successfully!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: Color(0xFFE86969),
                            ),
                          );
                          context.safePop();
                        },
                        text: 'Cancel Appointment',
                        options: FFButtonOptions(
                          width: 230.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFFDF3F3F),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 6.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
