import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'symptoms_bar_chart_model.dart';
export 'symptoms_bar_chart_model.dart';

class SymptomsBarChartWidget extends StatefulWidget {
  const SymptomsBarChartWidget({Key? key}) : super(key: key);

  @override
  _SymptomsBarChartWidgetState createState() => _SymptomsBarChartWidgetState();
}

class _SymptomsBarChartWidgetState extends State<SymptomsBarChartWidget> {
  late SymptomsBarChartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SymptomsBarChartModel());
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
              color: FlutterFlowTheme.of(context).textColor,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'My symptoms bar chart',
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
            mainAxisSize: MainAxisSize.min,
            children: [
              StreamBuilder<List<SurveyTRecord>>(
                stream: querySurveyTRecord(
                  queryBuilder: (surveyTRecord) => surveyTRecord
                      .where('respondent', isEqualTo: currentUserReference)
                      .orderBy('submitted_at'),
                ),
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
                  List<SurveyTRecord> chartSurveyTRecordList = snapshot.data!;
                  return Container(
                    width: 300.0,
                    height: 300.0,
                    child: FlutterFlowLineChart(
                      data: [
                        FFLineChartData(
                          xData: chartSurveyTRecordList
                              .map((d) => d.submittedAt)
                              .toList(),
                          yData: chartSurveyTRecordList
                              .map((d) => d.totalScore)
                              .toList(),
                          settings: LineChartBarData(
                            color: Color(0xFFFB745C),
                            barWidth: 1.0,
                            isCurved: true,
                            dotData: FlDotData(show: false),
                          ),
                        )
                      ],
                      chartStylingInfo: ChartStylingInfo(
                        backgroundColor: Colors.white,
                        showBorder: false,
                      ),
                      axisBounds: AxisBounds(),
                      xAxisLabelInfo: AxisLabelInfo(),
                      yAxisLabelInfo: AxisLabelInfo(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
