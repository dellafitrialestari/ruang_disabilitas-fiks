import 'package:fluttertoast/fluttertoast.dart';
import 'package:ruang_disabilitas/auth/firebase_auth/auth_util.dart';
import 'package:ruang_disabilitas/pages/webview/payment_webview_screen.dart';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_silver_model.dart';
export 'payment_silver_model.dart';

class PaymentSilverWidget extends StatefulWidget {
  const PaymentSilverWidget({Key? key}) : super(key: key);

  @override
  _PaymentSilverWidgetState createState() => _PaymentSilverWidgetState();
}

class _PaymentSilverWidgetState extends State<PaymentSilverWidget> {
  late PaymentSilverModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentSilverModel());
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF6CC166),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 38.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Pembayaran',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<PricingRecord>>(
            stream: queryPricingRecord(
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
              List<PricingRecord> columnPricingRecordList = snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final columnPricingRecord = columnPricingRecordList.isNotEmpty
                  ? columnPricingRecordList.first
                  : null;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          29.0, 29.0, 29.0, 29.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 18.0),
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
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 12.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Ringkasan',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 10.0, 16.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 1.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Silver',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Colors.black,
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                    ),
                                                  ),
                                                  Text(
                                                    columnPricingRecord!.hargaS,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 1.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Total',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Colors.black,
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                  Text(
                                                    columnPricingRecord!.hargaS,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ],
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 18.0),
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
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 12.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color: Color(0xFFC4C4C4),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 8.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      'Transfer ke Rekening Ruang Disabilitas',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            color: Color(
                                                                0xFF1E1E1E),
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
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
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsetsDirectional.fromSTEB(
                            //       0.0, 0.0, 0.0, 18.0),
                            //   child: Container(
                            //     width: double.infinity,
                            //     decoration: BoxDecoration(
                            //       color: FlutterFlowTheme.of(context)
                            //           .secondaryBackground,
                            //       boxShadow: [
                            //         BoxShadow(
                            //           blurRadius: 3.0,
                            //           color: Color(0x20000000),
                            //           offset: Offset(0.0, 1.0),
                            //         )
                            //       ],
                            //       borderRadius: BorderRadius.circular(12.0),
                            //     ),
                            //     child: StreamBuilder<List<PropertiRecord>>(
                            //       stream: queryPropertiRecord(
                            //         singleRecord: true,
                            //       ),
                            //       builder: (context, snapshot) {
                            //         // Customize what your widget looks like when it's loading.
                            //         if (!snapshot.hasData) {
                            //           return Center(
                            //             child: SizedBox(
                            //               width: 50.0,
                            //               height: 50.0,
                            //               child: SpinKitDualRing(
                            //                 color: Color(0xFF6CC166),
                            //                 size: 50.0,
                            //               ),
                            //             ),
                            //           );
                            //         }
                            //         List<PropertiRecord>
                            //             columnPropertiRecordList =
                            //             snapshot.data!;
                            //         // Return an empty Container when the item does not exist.
                            //         if (snapshot.data!.isEmpty) {
                            //           return Container();
                            //         }
                            //         final columnPropertiRecord =
                            //             columnPropertiRecordList.isNotEmpty
                            //                 ? columnPropertiRecordList.first
                            //                 : null;
                            //         return Column(
                            //           mainAxisSize: MainAxisSize.max,
                            //           children: [
                            //             Padding(
                            //               padding:
                            //                   EdgeInsetsDirectional.fromSTEB(
                            //                       0.0, 20.0, 0.0, 10.0),
                            //               child: Row(
                            //                 mainAxisSize: MainAxisSize.max,
                            //                 children: [
                            //                   Padding(
                            //                     padding: EdgeInsetsDirectional
                            //                         .fromSTEB(
                            //                             20.0, 0.0, 0.0, 0.0),
                            //                     child: ClipRRect(
                            //                       borderRadius:
                            //                           BorderRadius.circular(
                            //                               0.0),
                            //                       child: SvgPicture.asset(
                            //                         'assets/images/BRI.svg',
                            //                         width: MediaQuery.sizeOf(
                            //                                     context)
                            //                                 .width *
                            //                             0.16,
                            //                         fit: BoxFit.fill,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   Expanded(
                            //                     child: Column(
                            //                       mainAxisSize:
                            //                           MainAxisSize.max,
                            //                       crossAxisAlignment:
                            //                           CrossAxisAlignment.start,
                            //                       children: [
                            //                         Padding(
                            //                           padding:
                            //                               EdgeInsetsDirectional
                            //                                   .fromSTEB(
                            //                                       20.0,
                            //                                       0.0,
                            //                                       10.0,
                            //                                       4.0),
                            //                           child: Text(
                            //                             'Bank Rakyat Indonesia (BRI)',
                            //                             style: FlutterFlowTheme
                            //                                     .of(context)
                            //                                 .bodyMedium
                            //                                 .override(
                            //                                   fontFamily:
                            //                                       'Poppins',
                            //                                   color:
                            //                                       Colors.black,
                            //                                 ),
                            //                           ),
                            //                         ),
                            //                         Padding(
                            //                           padding:
                            //                               EdgeInsetsDirectional
                            //                                   .fromSTEB(
                            //                                       20.0,
                            //                                       0.0,
                            //                                       10.0,
                            //                                       0.0),
                            //                           child: Text(
                            //                             columnPropertiRecord!
                            //                                 .bri,
                            //                             style: FlutterFlowTheme
                            //                                     .of(context)
                            //                                 .bodyMedium
                            //                                 .override(
                            //                                   fontFamily:
                            //                                       'Poppins',
                            //                                   color:
                            //                                       Colors.black,
                            //                                   fontWeight:
                            //                                       FontWeight
                            //                                           .w600,
                            //                                 ),
                            //                           ),
                            //                         ),
                            //                       ],
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding:
                            //                   EdgeInsetsDirectional.fromSTEB(
                            //                       0.0, 10.0, 0.0, 20.0),
                            //               child: Row(
                            //                 mainAxisSize: MainAxisSize.max,
                            //                 children: [
                            //                   Padding(
                            //                     padding: EdgeInsetsDirectional
                            //                         .fromSTEB(
                            //                             20.0, 0.0, 0.0, 0.0),
                            //                     child: ClipRRect(
                            //                       borderRadius:
                            //                           BorderRadius.circular(
                            //                               0.0),
                            //                       child: SvgPicture.asset(
                            //                         'assets/images/BNI.svg',
                            //                         width: MediaQuery.sizeOf(
                            //                                     context)
                            //                                 .width *
                            //                             0.16,
                            //                         fit: BoxFit.fill,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                   Expanded(
                            //                     child: Column(
                            //                       mainAxisSize:
                            //                           MainAxisSize.max,
                            //                       crossAxisAlignment:
                            //                           CrossAxisAlignment.start,
                            //                       children: [
                            //                         Padding(
                            //                           padding:
                            //                               EdgeInsetsDirectional
                            //                                   .fromSTEB(
                            //                                       20.0,
                            //                                       0.0,
                            //                                       10.0,
                            //                                       4.0),
                            //                           child: Text(
                            //                             'Bank Negara Indonesia (BNI)',
                            //                             style: FlutterFlowTheme
                            //                                     .of(context)
                            //                                 .bodyMedium
                            //                                 .override(
                            //                                   fontFamily:
                            //                                       'Poppins',
                            //                                   color:
                            //                                       Colors.black,
                            //                                 ),
                            //                           ),
                            //                         ),
                            //                         Padding(
                            //                           padding:
                            //                               EdgeInsetsDirectional
                            //                                   .fromSTEB(
                            //                                       20.0,
                            //                                       0.0,
                            //                                       10.0,
                            //                                       0.0),
                            //                           child: Text(
                            //                             columnPropertiRecord!
                            //                                 .bni,
                            //                             style: FlutterFlowTheme
                            //                                     .of(context)
                            //                                 .bodyMedium
                            //                                 .override(
                            //                                   fontFamily:
                            //                                       'Poppins',
                            //                                   color:
                            //                                       Colors.black,
                            //                                   fontWeight:
                            //                                       FontWeight
                            //                                           .w600,
                            //                                 ),
                            //                           ),
                            //                         ),
                            //                       ],
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //           ],
                            //         );
                            //       },
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3.0,
                          color: Color(0x33000000),
                          offset: Offset(0.0, 1.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              29.0, 18.0, 29.0, 10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pembayaranmu',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    columnPricingRecord!.hargaS,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              29.0, 0.0, 29.0, 29.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              var url = await initiatePayment(int.tryParse(columnPricingRecord.hargaS.replaceAll("Rp. ", "").replaceAll(".", "")), currentUserEmail, "silver");
                              if(url != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PaymentWebviewScreen(invoiceUrl: url)),
                                );
                              } else {
                                Fluttertoast.showToast(msg: "Something went wrong");
                              }
                              // context.pushNamed(
                              //   'PaymentRiwayat',
                              //   extra: <String, dynamic>{
                              //     kTransitionInfoKey: TransitionInfo(
                              //       hasTransition: true,
                              //       transitionType: PageTransitionType.fade,
                              //       duration: Duration(milliseconds: 0),
                              //     ),
                              //   },
                              // );
                            },
                            text: 'Bayar Sekarang',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF6CC166),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
