import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '/backend/backend.dart';

import '../../auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : SigninPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : SigninPageWidget(),
        ),
        FFRoute(
          name: 'homePage',
          path: '/homePage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'homePage')
              : HomePageWidget(),
        ),
        FFRoute(
          name: 'signinPage',
          path: '/signinPage',
          builder: (context, params) => SigninPageWidget(),
        ),
        FFRoute(
          name: 'profilePage',
          path: '/profilePage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'profilePage')
              : ProfilePageWidget(),
        ),
        FFRoute(
          name: 'editProfile',
          path: '/editProfile',
          builder: (context, params) => EditProfileWidget(
            profileData: params.getParam(
                'profileData', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'viewDiagnosis',
          path: '/viewDiagnosis',
          builder: (context, params) => ViewDiagnosisWidget(
            patientIdData: params.getParam(
                'patientIdData', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'manageAppointments',
          path: '/manageAppointments',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'manageAppointments')
              : ManageAppointmentsWidget(),
        ),
        FFRoute(
          name: 'viewConsultNotes',
          path: '/viewConsultNotes',
          builder: (context, params) => ViewConsultNotesWidget(
            patientIDInfo: params.getParam(
                'patientIDInfo', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'appointmentDetails',
          path: '/appointmentDetails',
          builder: (context, params) => AppointmentDetailsWidget(
            appointmentData: params.getParam('appointmentData',
                ParamType.DocumentReference, false, ['appointments']),
          ),
        ),
        FFRoute(
          name: 'adminDashboard',
          path: '/adminDashboard',
          builder: (context, params) => AdminDashboardWidget(),
        ),
        FFRoute(
          name: 'patientRegistration',
          path: '/patientRegistration',
          builder: (context, params) => PatientRegistrationWidget(),
        ),
        FFRoute(
          name: 'resourcesList',
          path: '/resourcesList',
          builder: (context, params) => ResourcesListWidget(),
        ),
        FFRoute(
          name: 'patientList',
          path: '/patientList',
          builder: (context, params) => PatientListWidget(),
        ),
        FFRoute(
          name: 'resourceDetails',
          path: '/resourceDetails',
          builder: (context, params) => ResourceDetailsWidget(
            resourceNote: params.getParam('resourceNote',
                ParamType.DocumentReference, false, ['resources']),
          ),
        ),
        FFRoute(
          name: 'viewResources',
          path: '/viewResources',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'viewResources')
              : ViewResourcesWidget(),
        ),
        FFRoute(
          name: 'diagnosisDetails',
          path: '/diagnosisDetails',
          builder: (context, params) => DiagnosisDetailsWidget(
            patientIDRef: params.getParam(
                'patientIDRef', ParamType.DocumentReference, false, ['users']),
            diagnosisPatientRef: params.getParam('diagnosisPatientRef',
                ParamType.DocumentReference, false, ['diagnoses']),
          ),
        ),
        FFRoute(
          name: 'diagnosesList_1',
          path: '/diagnosesList1',
          builder: (context, params) => DiagnosesList1Widget(),
        ),
        FFRoute(
          name: 'diagnosesList_2',
          path: '/diagnosesList2',
          builder: (context, params) => DiagnosesList2Widget(
            patientIDRef: params.getParam(
                'patientIDRef', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'testResultList_1',
          path: '/testResultList1',
          builder: (context, params) => TestResultList1Widget(),
        ),
        FFRoute(
          name: 'testResultList_2',
          path: '/testResultList2',
          builder: (context, params) => TestResultList2Widget(
            patientData: params.getParam(
                'patientData', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'iii_testResultDetails',
          path: '/iiiTestResultDetails',
          builder: (context, params) => IiiTestResultDetailsWidget(
            patientQuote3: params.getParam(
                'patientQuote3', ParamType.DocumentReference, false, ['users']),
            testResultQuote: params.getParam('testResultQuote',
                ParamType.DocumentReference, false, ['testResults']),
          ),
        ),
        FFRoute(
          name: 'viewDiagnosisDetails',
          path: '/viewDiagnosisDetails',
          builder: (context, params) => ViewDiagnosisDetailsWidget(
            patientIDRef: params.getParam(
                'patientIDRef', ParamType.DocumentReference, false, ['users']),
            diagnosisPatientRef: params.getParam('diagnosisPatientRef',
                ParamType.DocumentReference, false, ['diagnoses']),
          ),
        ),
        FFRoute(
          name: 'viewTestResult',
          path: '/viewTestResult',
          builder: (context, params) => ViewTestResultWidget(
            patientData: params.getParam(
                'patientData', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'viewTestResultDetails',
          path: '/viewTestResultDetails',
          builder: (context, params) => ViewTestResultDetailsWidget(
            patientData: params.getParam(
                'patientData', ParamType.DocumentReference, false, ['users']),
            testResultData: params.getParam('testResultData',
                ParamType.DocumentReference, false, ['testResults']),
          ),
        ),
        FFRoute(
          name: 'viewConsultNoteDetails',
          path: '/viewConsultNoteDetails',
          builder: (context, params) => ViewConsultNoteDetailsWidget(
            patientIDMention: params.getParam('patientIDMention',
                ParamType.DocumentReference, false, ['users']),
            noteMention: params.getParam('noteMention',
                ParamType.DocumentReference, false, ['consultationNotes']),
          ),
        ),
        FFRoute(
          name: 'concernsList_1',
          path: '/concernsList1',
          builder: (context, params) => ConcernsList1Widget(),
        ),
        FFRoute(
          name: 'concernsList_2',
          path: '/concernsList2',
          builder: (context, params) => ConcernsList2Widget(
            patientCite: params.getParam(
                'patientCite', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'concernDetails',
          path: '/concernDetails',
          builder: (context, params) => ConcernDetailsWidget(
            patientCite2: params.getParam(
                'patientCite2', ParamType.DocumentReference, false, ['users']),
            concernCite: params.getParam('concernCite',
                ParamType.DocumentReference, false, ['appointments']),
          ),
        ),
        FFRoute(
          name: 'a_doctorDashboard',
          path: '/aDoctorDashboard',
          builder: (context, params) => ADoctorDashboardWidget(),
        ),
        FFRoute(
          name: 'b_ListOfPatients',
          path: '/bListOfPatients',
          builder: (context, params) => BListOfPatientsWidget(),
        ),
        FFRoute(
          name: 'c_OnePatient',
          path: '/cOnePatient',
          builder: (context, params) => COnePatientWidget(
            patientQuote: params.getParam(
                'patientQuote', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'i_notes',
          path: '/iNotes',
          builder: (context, params) => INotesWidget(
            patientQuote2: params.getParam(
                'patientQuote2', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'ii_diagnoses',
          path: '/iiDiagnoses',
          builder: (context, params) => IiDiagnosesWidget(
            patientQuote2: params.getParam(
                'patientQuote2', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'iii_testResult',
          path: '/iiiTestResult',
          builder: (context, params) => IiiTestResultWidget(
            patientQuote2: params.getParam(
                'patientQuote2', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'iv_symptoms',
          path: '/ivSymptoms',
          builder: (context, params) => IvSymptomsWidget(
            patientQuote2: params.getParam(
                'patientQuote2', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'v_concerns',
          path: '/vConcerns',
          builder: (context, params) => VConcernsWidget(
            patientQuote2: params.getParam(
                'patientQuote2', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'i_notesDetails',
          path: '/iNotesDetails',
          builder: (context, params) => INotesDetailsWidget(
            patientQuote3: params.getParam(
                'patientQuote3', ParamType.DocumentReference, false, ['users']),
            noteQuote: params.getParam('noteQuote', ParamType.DocumentReference,
                false, ['consultationNotes']),
          ),
        ),
        FFRoute(
          name: 'ii_diagnosesDetails',
          path: '/iiDiagnosesDetails',
          builder: (context, params) => IiDiagnosesDetailsWidget(
            patientQuote3: params.getParam(
                'patientQuote3', ParamType.DocumentReference, false, ['users']),
            diagnosisQuote: params.getParam('diagnosisQuote',
                ParamType.DocumentReference, false, ['diagnoses']),
          ),
        ),
        FFRoute(
          name: 'testResultDetails',
          path: '/testResultDetails',
          builder: (context, params) => TestResultDetailsWidget(
            patientData: params.getParam(
                'patientData', ParamType.DocumentReference, false, ['users']),
            testResultData: params.getParam('testResultData',
                ParamType.DocumentReference, false, ['testResults']),
          ),
        ),
        FFRoute(
          name: 'v_concernsDetails',
          path: '/vConcernsDetails',
          builder: (context, params) => VConcernsDetailsWidget(
            patientQuote3: params.getParam(
                'patientQuote3', ParamType.DocumentReference, false, ['users']),
            concernQuote: params.getParam('concernQuote',
                ParamType.DocumentReference, false, ['appointments']),
          ),
        ),
        FFRoute(
          name: 'manageSymptoms',
          path: '/manageSymptoms',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'manageSymptoms')
              : ManageSymptomsWidget(),
        ),
        FFRoute(
          name: 'symptoms_add',
          path: '/symptomsAdd',
          builder: (context, params) => SymptomsAddWidget(),
        ),
        FFRoute(
          name: 'symptoms_barChart',
          path: '/symptomsBarChart',
          builder: (context, params) => SymptomsBarChartWidget(),
        ),
        FFRoute(
          name: 'symptom_details',
          path: '/symptomDetails',
          builder: (context, params) => SymptomDetailsWidget(
            symptomData: params.getParam(
                'symptomData', ParamType.DocumentReference, false, ['surveyT']),
          ),
        ),
        FFRoute(
          name: 'medicList_1',
          path: '/medicList1',
          builder: (context, params) => MedicList1Widget(),
        ),
        FFRoute(
          name: 'medicList_2',
          path: '/medicList2',
          builder: (context, params) => MedicList2Widget(
            patientIDRef: params.getParam(
                'patientIDRef', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'medicDetails',
          path: '/medicDetails',
          builder: (context, params) => MedicDetailsWidget(
            patientIDRef: params.getParam(
                'patientIDRef', ParamType.DocumentReference, false, ['users']),
            medicRef: params.getParam('medicRef', ParamType.DocumentReference,
                false, ['medications']),
          ),
        ),
        FFRoute(
          name: 'viewMedications',
          path: '/viewMedications',
          builder: (context, params) => ViewMedicationsWidget(
            patientData: params.getParam(
                'patientData', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'viewMedicationsDetails',
          path: '/viewMedicationsDetails',
          builder: (context, params) => ViewMedicationsDetailsWidget(
            patientData: params.getParam(
                'patientData', ParamType.DocumentReference, false, ['users']),
            medicData: params.getParam('medicData', ParamType.DocumentReference,
                false, ['medications']),
          ),
        ),
        FFRoute(
          name: 'vi_medic',
          path: '/viMedic',
          builder: (context, params) => ViMedicWidget(
            patientQuote2: params.getParam(
                'patientQuote2', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'vi_medicDetails',
          path: '/viMedicDetails',
          builder: (context, params) => ViMedicDetailsWidget(
            patientQuote3: params.getParam(
                'patientQuote3', ParamType.DocumentReference, false, ['users']),
            medicRef: params.getParam('medicRef', ParamType.DocumentReference,
                false, ['medications']),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/signinPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
