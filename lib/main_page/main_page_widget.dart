import '../backend/backend.dart';
import '../faculty_map/faculty_map_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../vtop_webview/vtop_webview_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({Key? key}) : super(key: key);

  @override
  _MainPageWidgetState createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget>
    with TickerProviderStateMixin {
  PageController? pageViewController;
  PagingController<DocumentSnapshot?, MainpageNoticeRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-64, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 200,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-67, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 200,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-69, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 700,
      delay: 25,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 0.95,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 700,
      delay: 25,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 0.95,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 700,
      delay: 25,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 0.95,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'buttonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-8, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(8, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-2, -5),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(-2, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 400,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, -10),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, -8),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).textColor,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(13, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, -1),
                            child: Text(
                              'Hello  👋',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ).animated(
                                [animationsMap['textOnPageLoadAnimation1']!]),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Sai Charan venna ',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryText,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                                child: Text(
                                  '(20BCR2000)',
                                  style: FlutterFlowTheme.of(context).bodyText2,
                                ),
                              ),
                            ],
                          ).animated(
                              [animationsMap['rowOnPageLoadAnimation1']!]),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [],
          elevation: 0,
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.bottomToTop,
              duration: Duration(milliseconds: 220),
              reverseDuration: Duration(milliseconds: 220),
              child: VtopWebviewWidget(),
            ),
          );
        },
        backgroundColor: Color(0xFF7341D4),
        elevation: 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ))
              Image.asset(
                'assets/images/ArrowSquareUpRight.png',
                width: 25,
                height: 25,
                fit: BoxFit.cover,
              ),
            FaIcon(
              FontAwesomeIcons.globe,
              color: FlutterFlowTheme.of(context).textColor,
              size: 25,
            ),
            Text(
              'VTOP',
              style: FlutterFlowTheme.of(context).subtitle2.override(
                fontFamily: 'Poppins',
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.05, 0),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 9, 0, 9),
                                    child: Text(
                                      'Today class',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                    ).animated([
                                      animationsMap['textOnPageLoadAnimation2']!
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                          ),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 1, 6),
                                child: Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.92,
                                  height: 2,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 6,
                                        color: Color(0x4B1A1F24),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF6424DB),
                                        Color(0xFFAF84FF)
                                      ],
                                      stops: [0, 1],
                                      begin: AlignmentDirectional(0.79, -1),
                                      end: AlignmentDirectional(-0.79, 1),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20, 0, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 69,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.only(
                                                      bottomLeft:
                                                      Radius.circular(7),
                                                      bottomRight:
                                                      Radius.circular(7),
                                                      topLeft:
                                                      Radius.circular(0),
                                                      topRight:
                                                      Radius.circular(0),
                                                    ),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                    AlignmentDirectional(
                                                        0.1, 0),
                                                    child: Text(
                                                      'Present',
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyText2
                                                          .override(
                                                        fontFamily:
                                                        'Poppins',
                                                        color: FlutterFlowTheme.of(
                                                            context)
                                                            .darkBackground,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20, 8, 20, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 3, 0),
                                                  child: Text(
                                                    'Operation Systems',
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .title3
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      color: FlutterFlowTheme
                                                          .of(context)
                                                          .textColor,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 2),
                                                  child: Text(
                                                    'TC-1',
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyText2
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                      Color(0xFFE9E9E9),
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20, 12, 20, 16),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  '416/AB1',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'Roboto Mono',
                                                    color:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .textColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.92,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFF191B1F),
                                                      Color(0xFF45484E)
                                                    ],
                                                    stops: [0, 1],
                                                    begin: AlignmentDirectional(
                                                        0.64, -1),
                                                    end: AlignmentDirectional(
                                                        -0.64, 1),
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    bottomLeft:
                                                    Radius.circular(8),
                                                    bottomRight:
                                                    Radius.circular(8),
                                                    topLeft: Radius.circular(0),
                                                    topRight:
                                                    Radius.circular(0),
                                                  ),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    -0.85, 0),
                                                child: Text(
                                                  '09:00 - 09:50',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ).animated([
                                  animationsMap[
                                  'containerOnPageLoadAnimation1']!
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 1, 6),
                                child: Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.92,
                                  height: 2,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 6,
                                        color: Color(0x4B1A1F24),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF6424DB),
                                        Color(0xFFAF84FF)
                                      ],
                                      stops: [0, 1],
                                      begin: AlignmentDirectional(0.79, -1),
                                      end: AlignmentDirectional(-0.79, 1),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20, 0, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: Container(
                                                    width: 69,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                      BorderRadius.only(
                                                        bottomLeft:
                                                        Radius.circular(7),
                                                        bottomRight:
                                                        Radius.circular(7),
                                                        topLeft:
                                                        Radius.circular(0),
                                                        topRight:
                                                        Radius.circular(0),
                                                      ),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                      AlignmentDirectional(
                                                          0.1, 0),
                                                      child: Text(
                                                        'Next',
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyText2
                                                            .override(
                                                          fontFamily:
                                                          'Poppins',
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .darkBackground,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20, 8, 20, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 3, 0),
                                                  child: Text(
                                                    'Operation Systems',
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .title3
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      color: FlutterFlowTheme
                                                          .of(context)
                                                          .textColor,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 2),
                                                  child: Text(
                                                    'TC-1',
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyText2
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                      Color(0xFFE9E9E9),
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20, 12, 20, 16),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  '416/AB1',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'Roboto Mono',
                                                    color:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .textColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.92,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFF191B1F),
                                                      Color(0xFF45484E)
                                                    ],
                                                    stops: [0, 1],
                                                    begin: AlignmentDirectional(
                                                        0.64, -1),
                                                    end: AlignmentDirectional(
                                                        -0.64, 1),
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    bottomLeft:
                                                    Radius.circular(8),
                                                    bottomRight:
                                                    Radius.circular(8),
                                                    topLeft: Radius.circular(0),
                                                    topRight:
                                                    Radius.circular(0),
                                                  ),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    -0.85, 0),
                                                child: Text(
                                                  '09:00 - 09:50',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ).animated([
                                  animationsMap[
                                  'containerOnPageLoadAnimation2']!
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 5, 6),
                                child: Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.92,
                                  height: 2,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 6,
                                        color: Color(0x4B1A1F24),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF6424DB),
                                        Color(0xFFAF84FF)
                                      ],
                                      stops: [0, 1],
                                      begin: AlignmentDirectional(0.79, -1),
                                      end: AlignmentDirectional(-0.79, 1),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0x00FFFFFF),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20, 0, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 69,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.only(
                                                      bottomLeft:
                                                      Radius.circular(7),
                                                      bottomRight:
                                                      Radius.circular(7),
                                                      topLeft:
                                                      Radius.circular(0),
                                                      topRight:
                                                      Radius.circular(0),
                                                    ),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                    AlignmentDirectional(
                                                        0.1, 0),
                                                    child: Text(
                                                      'Later',
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyText2
                                                          .override(
                                                        fontFamily:
                                                        'Poppins',
                                                        color: FlutterFlowTheme.of(
                                                            context)
                                                            .darkBackground,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20, 8, 20, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 3, 0),
                                                  child: Text(
                                                    'Operation Systems',
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .title3
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      color: FlutterFlowTheme
                                                          .of(context)
                                                          .textColor,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 2),
                                                  child: Text(
                                                    'TC-1',
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyText2
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                      Color(0xFFE9E9E9),
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20, 12, 20, 16),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  '416/AB1',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'Roboto Mono',
                                                    color:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .textColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.92,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFF191B1F),
                                                      Color(0xFF45484E)
                                                    ],
                                                    stops: [0, 1],
                                                    begin: AlignmentDirectional(
                                                        0.64, -1),
                                                    end: AlignmentDirectional(
                                                        -0.64, 1),
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    bottomLeft:
                                                    Radius.circular(8),
                                                    bottomRight:
                                                    Radius.circular(8),
                                                    topLeft: Radius.circular(0),
                                                    topRight:
                                                    Radius.circular(0),
                                                  ),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    -0.85, 0),
                                                child: Text(
                                                  '09:00 - 09:50',
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ).animated([
                                  animationsMap[
                                  'containerOnPageLoadAnimation3']!
                                ]),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(16, 16, 16, 1),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NavBarPage(
                                            initialPage: 'TimetablePage'),
                                      ),
                                    );
                                  },
                                  text: 'View full Timetable →',
                                  options: FFButtonOptions(
                                    width: 170,
                                    color: Color(0x0000968A),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .darkBackground,
                                      fontSize: 14,
                                    ),
                                    elevation: 0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ).animated([
                                  animationsMap['buttonOnPageLoadAnimation']!
                                ]),
                              ),
                            ],
                          ).animated(
                              [animationsMap['rowOnPageLoadAnimation2']!]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FacultyMapWidget(),
                        ),
                      );
                    },
                    child: Container(
                      width: 144,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Color(0xFF2D2F34),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: FaIcon(
                              FontAwesomeIcons.chalkboardTeacher,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Text(
                              'Faculty',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animated([animationsMap['containerOnPageLoadAnimation4']!]),
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NavBarPage(initialPage: 'AcademicsPage'),
                        ),
                      );
                    },
                    child: Container(
                      width: 144,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Color(0xFF2D2F34),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Icon(
                                Icons.schedule,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                'Attendance',
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ).animated([animationsMap['containerOnPageLoadAnimation5']!]),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 143,
                        decoration: BoxDecoration(
                          color:
                          FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Color(0x2FFFFFFF),
                          ),
                        ),
                        child: StreamBuilder<List<MainpageSliderImageRecord>>(
                          stream: queryMainpageSliderImageRecord(),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .plumpPurple,
                                  ),
                                ),
                              );
                            }
                            List<MainpageSliderImageRecord>
                            pageViewMainpageSliderImageRecordList =
                            snapshot.data!;
                            return Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 1.43,
                              child: Stack(
                                children: [
                                  PageView.builder(
                                    controller: pageViewController ??=
                                        PageController(
                                            initialPage: min(
                                                0,
                                                pageViewMainpageSliderImageRecordList
                                                    .length -
                                                    1)),
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                    pageViewMainpageSliderImageRecordList
                                        .length,
                                    itemBuilder: (context, pageViewIndex) {
                                      final pageViewMainpageSliderImageRecord =
                                      pageViewMainpageSliderImageRecordList[
                                      pageViewIndex];
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          pageViewMainpageSliderImageRecord
                                              .imageUrl!,
                                          width: double.infinity,
                                          height: 1,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 1),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: SmoothPageIndicator(
                                        controller: pageViewController ??=
                                            PageController(
                                                initialPage: min(
                                                    0,
                                                    pageViewMainpageSliderImageRecordList
                                                        .length -
                                                        1)),
                                        count:
                                        pageViewMainpageSliderImageRecordList
                                            .length,
                                        axisDirection: Axis.horizontal,
                                        onDotClicked: (i) {
                                          pageViewController!.animateToPage(
                                            i,
                                            duration:
                                            Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        effect: SlideEffect(
                                          spacing: 8,
                                          radius: 16,
                                          dotWidth: 8,
                                          dotHeight: 8,
                                          dotColor: Colors.white,
                                          activeDotColor: Color(0xFF2D2F34),
                                          paintStyle: PaintingStyle.stroke,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ).animated(
                          [animationsMap['containerOnPageLoadAnimation6']!]),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.68,
                    decoration: BoxDecoration(
                      color: Color(0x00FFFFFF),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFF292B2F),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 32,
                                      height: 1,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF8B56EE),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 15, 15, 15),
                                      child: Text(
                                        'News and Updates',
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                          fontFamily: 'Poppins',
                                          color:
                                          FlutterFlowTheme.of(context)
                                              .textColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          lineHeight: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ).animated([
                                  animationsMap['rowOnPageLoadAnimation3']!
                                ]),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.85,
                                      height:
                                      MediaQuery.of(context).size.height *
                                          0.5,
                                      decoration: BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                      ),
                                      child: PagedListView<
                                          DocumentSnapshot<Object?>?,
                                          MainpageNoticeRecord>(
                                        pagingController: () {
                                          final Query<Object?> Function(
                                              Query<Object?>) queryBuilder =
                                              (mainpageNoticeRecord) =>
                                          mainpageNoticeRecord;
                                          if (_pagingController != null) {
                                            final query = queryBuilder(
                                                MainpageNoticeRecord
                                                    .collection);
                                            if (query != _pagingQuery) {
                                              // The query has changed
                                              _pagingQuery = query;
                                              _streamSubscriptions
                                                  .forEach((s) => s?.cancel());
                                              _streamSubscriptions.clear();
                                              _pagingController!.refresh();
                                            }
                                            return _pagingController!;
                                          }

                                          _pagingController = PagingController(
                                              firstPageKey: null);
                                          _pagingQuery = queryBuilder(
                                              MainpageNoticeRecord.collection);
                                          _pagingController!
                                              .addPageRequestListener(
                                                  (nextPageMarker) {
                                                queryMainpageNoticeRecordPage(
                                                  queryBuilder:
                                                      (mainpageNoticeRecord) =>
                                                  mainpageNoticeRecord,
                                                  nextPageMarker: nextPageMarker,
                                                  pageSize: 25,
                                                  isStream: true,
                                                ).then((page) {
                                                  _pagingController!.appendPage(
                                                    page.data,
                                                    page.nextPageMarker,
                                                  );
                                                  final streamSubscription = page
                                                      .dataStream
                                                      ?.listen((data) {
                                                    final itemIndexes =
                                                    _pagingController!.itemList!
                                                        .asMap()
                                                        .map((k, v) => MapEntry(
                                                        v.reference.id, k));
                                                    data.forEach((item) {
                                                      final index = itemIndexes[
                                                      item.reference.id];
                                                      final items =
                                                      _pagingController!
                                                          .itemList!;
                                                      if (index != null) {
                                                        items.replaceRange(index,
                                                            index + 1, [item]);
                                                        _pagingController!
                                                            .itemList = {
                                                          for (var item in items)
                                                            item.reference: item
                                                        }.values.toList();
                                                      }
                                                    });
                                                    setState(() {});
                                                  });
                                                  _streamSubscriptions
                                                      .add(streamSubscription);
                                                });
                                              });
                                          return _pagingController!;
                                        }(),
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        builderDelegate:
                                        PagedChildBuilderDelegate<
                                            MainpageNoticeRecord>(
                                          // Customize what your widget looks like when it's loading the first page.
                                          firstPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: CircularProgressIndicator(
                                                color:
                                                FlutterFlowTheme.of(context)
                                                    .plumpPurple,
                                              ),
                                            ),
                                          ),

                                          itemBuilder:
                                              (context, _, listViewIndex) {
                                            final listViewMainpageNoticeRecord =
                                            _pagingController!
                                                .itemList![listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 10),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Color(0x0BFFFFFF),
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                  border: Border.all(
                                                    color: Color(0x23F1F4F8),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          16, 12, 0, 0),
                                                      child: Text(
                                                        listViewMainpageNoticeRecord
                                                            .title!,
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .subtitle2
                                                            .override(
                                                          fontFamily:
                                                          'Poppins',
                                                          fontWeight:
                                                          FontWeight
                                                              .w600,
                                                        ),
                                                      ).animated([
                                                        animationsMap[
                                                        'textOnPageLoadAnimation3']!
                                                      ]),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          16, 0, 0, 12),
                                                      child: Text(
                                                        listViewMainpageNoticeRecord
                                                            .message!,
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyText1
                                                            .override(
                                                          fontFamily:
                                                          'Outfit',
                                                          color:
                                                          Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight
                                                              .normal,
                                                        ),
                                                      ).animated([
                                                        animationsMap[
                                                        'textOnPageLoadAnimation4']!
                                                      ]),
                                                    ),
                                                  ],
                                                ),
                                              ).animated([
                                                animationsMap[
                                                'containerOnPageLoadAnimation7']!
                                              ]),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
