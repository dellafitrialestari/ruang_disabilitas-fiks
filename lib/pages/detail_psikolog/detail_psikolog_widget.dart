import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ruang_disabilitas/auth/firebase_auth/auth_util.dart';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'detail_psikolog_model.dart';

export 'detail_psikolog_model.dart';

class DetailPsikologWidget extends StatefulWidget {
  const DetailPsikologWidget({
    Key? key,
    required this.psikologRef,
  }) : super(key: key);

  final DocumentReference? psikologRef;

  @override
  _DetailPsikologWidgetState createState() => _DetailPsikologWidgetState();
}

class _DetailPsikologWidgetState extends State<DetailPsikologWidget>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late DetailPsikologModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(70.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _model = createModel(context, () => DetailPsikologModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PsikologRecord>(
      stream: PsikologRecord.getDocument(widget.psikologRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFFBFBFB),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitDualRing(
                  color: Color(0xFF6CC166),
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final detailPsikologPsikologRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFFBFBFB),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF6CC166), Color(0xFFB4E28B)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.87, -1.0),
                          end: AlignmentDirectional(-0.87, 1.0),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(44.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 60.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  buttonSize: 46.0,
                                  icon: Icon(
                                    Icons.chevron_left,
                                    color: Colors.white,
                                    size: 38.0,
                                  ),
                                  onPressed: () async {
                                    context.pop();
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Text(
                                    'Details',
                                    style: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(29.0, 29.0, 29.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 18.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                detailPsikologPsikologRecord.image,
                                width: double.infinity,
                                height: 330.0,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Text(
                                        detailPsikologPsikologRecord.name,
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      detailPsikologPsikologRecord.description1,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: RatingBar.builder(
                                        onRatingUpdate: (newValue) => setState(
                                            () => _model.ratingBarValue =
                                                newValue),
                                        itemBuilder: (context, index) => Icon(
                                          Icons.star_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .warning,
                                        ),
                                        direction: Axis.horizontal,
                                        initialRating: _model.ratingBarValue ??=
                                            detailPsikologPsikologRecord.rating,
                                        unratedColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        itemCount: 5,
                                        itemSize: 24.0,
                                        glowColor: FlutterFlowTheme.of(context)
                                            .warning,
                                      ),
                                    ),
                                    Visibility(
                                      visible: _model.berlangananButton(),
                                      replacement: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF6CC166),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: TextButton(
                                            onPressed: () => context.pushNamed(
                                              'pricing-2',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            ),
                                            child: Text(
                                              "Berlanganan Sekarang!",
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        color: Colors.white,
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Video Call ${detailPsikologPsikologRecord.name} ?'),
                                                          content: Text(
                                                              "Anda yakin akan video call dengan ${detailPsikologPsikologRecord.name} dan mengurangi point video call anda ?"),
                                                          actions: [
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .labelLarge,
                                                              ),
                                                              child: const Text(
                                                                  'Cancel'),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .labelLarge,
                                                              ),
                                                              child: const Text(
                                                                  'OK'),
                                                              onPressed:
                                                                  () async {
                                                                final users = FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'users')
                                                                    .doc(
                                                                        currentUserUid);
                                                                if (valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.video,
                                                                            null) !=
                                                                        null &&
                                                                    valueOrDefault(
                                                                            currentUserDocument?.video,
                                                                            0) >
                                                                        0) {
                                                                  users.update({
                                                                    'video': valueOrDefault(
                                                                            currentUserDocument?.video,
                                                                            0) -
                                                                        1
                                                                  });
                                                                  await launchURL(
                                                                          detailPsikologPsikologRecord
                                                                              .linkVideo)
                                                                      .then(
                                                                          (value) async {
                                                                    await authManager
                                                                        .refreshUser();
                                                                  });
                                                                } else {
                                                                  context.pushNamed(
                                                                      "pricing-2");
                                                                }
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .video,
                                                          color:
                                                              Color(0xFF6CC166),
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Video',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Color(
                                                                    0xFF446DE6),
                                                              ),
                                                        ),
                                                      ),
                                                      Visibility(
                                                          visible: valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.video,
                                                                      null) !=
                                                                  null &&
                                                              valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.video,
                                                                      null) !=
                                                                  0,
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                Color(
                                                                    0xFF446DE6),
                                                            child: Text(
                                                                valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.video,
                                                                        0)
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: Colors
                                                                          .white,
                                                                    )),
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 100.0,
                                                child: VerticalDivider(
                                                  thickness: 1.0,
                                                  indent: 12.0,
                                                  endIndent: 12.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ),
                                              Expanded(
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Telepon ${detailPsikologPsikologRecord.name} ?'),
                                                          content: Text(
                                                              "Anda yakin akan menelepon dengan ${detailPsikologPsikologRecord.name} dan mengurangi point telepon anda ?"),
                                                          actions: [
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .labelLarge,
                                                              ),
                                                              child: const Text(
                                                                  'Cancel'),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                            TextButton(
                                                              style: TextButton
                                                                  .styleFrom(
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .labelLarge,
                                                              ),
                                                              child: const Text(
                                                                  'OK'),
                                                              onPressed:
                                                                  () async {
                                                                final users = FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'users')
                                                                    .doc(
                                                                        currentUserUid);
                                                                if (valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.telepon,
                                                                            null) !=
                                                                        null &&
                                                                    valueOrDefault(
                                                                            currentUserDocument?.telepon,
                                                                            0) >
                                                                        0) {
                                                                  users.update({
                                                                    'telepon': valueOrDefault(
                                                                            currentUserDocument?.telepon,
                                                                            0) -
                                                                        1
                                                                  });
                                                                  await launchURL(
                                                                      detailPsikologPsikologRecord
                                                                          .linkCall);
                                                                } else {
                                                                  context.pushNamed(
                                                                      "pricing-2");
                                                                }
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    12.0),
                                                        child: Icon(
                                                          Icons.call_rounded,
                                                          color:
                                                              Color(0xFF6CC166),
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Call',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: Color(
                                                                    0xFF446DE6),
                                                              ),
                                                        ),
                                                      ),
                                                      Visibility(
                                                          visible: valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.telepon,
                                                                      null) !=
                                                                  null &&
                                                              valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.telepon,
                                                                      null) !=
                                                                  0,
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                Color(
                                                                    0xFF446DE6),
                                                            child: Text(
                                                                valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.telepon,
                                                                        0)
                                                                    .toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      color: Colors
                                                                          .white,
                                                                    )),
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 12.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3.0,
                                              color: Color(0x20000000),
                                              offset: Offset(0.0, 1.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 20.0, 20.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: Text(
                                                  'Jadwal',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              StreamBuilder<List<JadwalRecord>>(
                                                stream: queryJadwalRecord(
                                                  parent: widget.psikologRef,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child: SpinKitDualRing(
                                                          color:
                                                              Color(0xFF6CC166),
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<JadwalRecord>
                                                      listViewJadwalRecordList =
                                                      snapshot.data!;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewJadwalRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewJadwalRecord =
                                                          listViewJadwalRecordList[
                                                              listViewIndex];
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  listViewJadwalRecord
                                                                      .jam,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  listViewJadwalRecord
                                                                      .hari,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                            thickness: 1.0,
                                                            color: Color(
                                                                0xFFE0E3E7),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Text(
                                        'Deskripsi',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 12.0),
                                        child: Text(
                                          detailPsikologPsikologRecord.detail,
                                          textAlign: TextAlign.justify,
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.black,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3.0,
                                              color: Color(0x430F1113),
                                              offset: Offset(0.0, 1.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 8.0),
                                          child: StreamBuilder<List<JbiRecord>>(
                                            stream: queryJbiRecord(
                                              parent: widget.psikologRef,
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitDualRing(
                                                      color: Color(0xFF6CC166),
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<JbiRecord>
                                                  columnJbiRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final columnJbiRecord =
                                                  columnJbiRecordList.isNotEmpty
                                                      ? columnJbiRecordList
                                                          .first
                                                      : null;
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  12.0),
                                                      child: Text(
                                                        'Pendampig Juru Bahasa Isyarat',
                                                        textAlign:
                                                            TextAlign.justify,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Hero(
                                                        tag: columnJbiRecord!
                                                            .image,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            columnJbiRecord!
                                                                .image,
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.2,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          10.0),
                                                                      child:
                                                                          Text(
                                                                        columnJbiRecord!
                                                                            .nama,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 12.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        columnJbiRecord!
                                                                            .deskripsi,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 12.0,
                                                                              fontWeight: FontWeight.w300,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation']!),
                                    ),
                                    Visibility(
                                      visible: _model.berlangananButton(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Chat ${detailPsikologPsikologRecord.name} ?'),
                                                        content: Text(
                                                            "Anda yakin akan chat dengan ${detailPsikologPsikologRecord.name} dan mengurangi point chat anda ?"),
                                                        actions: [
                                                          TextButton(
                                                            style: TextButton
                                                                .styleFrom(
                                                              textStyle: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelLarge,
                                                            ),
                                                            child: const Text(
                                                                'Cancel'),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                          TextButton(
                                                            style: TextButton
                                                                .styleFrom(
                                                              textStyle: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelLarge,
                                                            ),
                                                            child:
                                                                const Text('OK'),
                                                            onPressed: () async {
                                                              final users =
                                                                  FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          'users')
                                                                      .doc(
                                                                          currentUserUid);
                                                              if (valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.chat,
                                                                          null) !=
                                                                      null &&
                                                                  valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.chat,
                                                                          0) >
                                                                      0) {
                                                                await launchURL(
                                                                    detailPsikologPsikologRecord
                                                                        .linkChat);
                                                                users.update({
                                                                  'chat': valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.chat,
                                                                          0) -
                                                                      1
                                                                });
                                                              } else {
                                                                context.pushNamed(
                                                                    "pricing-2");
                                                              }
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                text: 'Mulai Konsultasi',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 48.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              0.0, 0.0, 0.0, 0.0),
                                                  color: Color(0xFF6CC166),
                                                  textStyle:
                                                      FlutterFlowTheme.of(context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily: 'Poppins',
                                                            color: Colors.white,
                                                          ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8.0),
                                                ),
                                              ),
                                            ),
                                            Visibility(
                                              visible: valueOrDefault(
                                                          currentUserDocument
                                                              ?.chat,
                                                          null) !=
                                                      null &&
                                                  valueOrDefault(
                                                          currentUserDocument
                                                              ?.chat,
                                                          null) !=
                                                      0,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xFF6CC166),
                                                  child: Text(
                                                      valueOrDefault(
                                                              currentUserDocument
                                                                  ?.chat,
                                                              0)
                                                          .toString(),
                                                      style: FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.white,
                                                          )),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
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

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (mounted) {
        setState(() {
          authManager.refreshUser();
        });
      }
    }
    super.didChangeAppLifecycleState(state);
  }
}
