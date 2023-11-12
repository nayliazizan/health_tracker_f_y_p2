import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'symptom_details_model.dart';
export 'symptom_details_model.dart';

class SymptomDetailsWidget extends StatefulWidget {
  const SymptomDetailsWidget({
    Key? key,
    required this.symptomData,
  }) : super(key: key);

  final DocumentReference? symptomData;

  @override
  _SymptomDetailsWidgetState createState() => _SymptomDetailsWidgetState();
}

class _SymptomDetailsWidgetState extends State<SymptomDetailsWidget> {
  late SymptomDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SymptomDetailsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 30.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          title: Text(
            'Symptom Details',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                child: StreamBuilder<SurveyTRecord>(
                  stream: SurveyTRecord.getDocument(widget.symptomData!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 40.0,
                          height: 40.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    final rowSurveyTRecord = snapshot.data!;
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'When',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            dateTimeFormat(
                                'MMMEd', rowSurveyTRecord.submittedAt!),
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            dateTimeFormat('jm', rowSurveyTRecord.submittedAt!),
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Total score',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            rowSurveyTRecord.totalScore.toString(),
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).accent4,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Q1. General well-being. Very well (5) to terrible (0)',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Hello World',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Q2. Abdominal pain. None (5) to severe (0)',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Hello World',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Q3.  Abdominal mass. None (5) to definite (0)',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Hello World',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Q4.  Complications. None (5) to many (0)',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Hello World',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Q5. How much your IBD has been well controlled in the past 2 weeks? Great (5) to worst (0)',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Hello World',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Q6.  How much your current treatment is useful in controlling your IBD? A lot (5) to none (0)',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Hello World',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Q7. I  feel well. True (5) to false (0)',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Hello World',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Hello World',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Hello World',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Hello World',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Hello World',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
