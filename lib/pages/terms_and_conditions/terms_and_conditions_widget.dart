import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'terms_and_conditions_model.dart';
export 'terms_and_conditions_model.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({Key? key}) : super(key: key);

  @override
  _TermsAndConditionsWidgetState createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  late TermsAndConditionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsAndConditionsModel());
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 60.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
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
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 50.0,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: AutoSizeText(
                                      'terms and conditions',
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
                                ),
                              ),
                            ],
                          ),
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
                      StreamBuilder<List<PropertiRecord>>(
                        stream: queryPropertiRecord(
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
                          List<PropertiRecord> columnPropertiRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final columnPropertiRecord =
                              columnPropertiRecordList.isNotEmpty
                                  ? columnPropertiRecordList.first
                                  : null;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  'Definisi',
                                  textAlign: TextAlign.justify,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF074471),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Text(
                                    columnPropertiRecord!.definition,
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
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  'Produk dan Pelayanan',
                                  textAlign: TextAlign.justify,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF074471),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Text(
                                    columnPropertiRecord!.produkPelayanan,
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
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  'Hak Cipta',
                                  textAlign: TextAlign.justify,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF074471),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Text(
                                    columnPropertiRecord!.hakCipta,
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
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  'Ketentuan umum dan keamanan',
                                  textAlign: TextAlign.justify,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF074471),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Text(
                                    columnPropertiRecord!.ketentuanKeamanan,
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
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  'Informasi pembayaran dan berlangganan',
                                  textAlign: TextAlign.justify,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF074471),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Text(
                                    columnPropertiRecord!.informasiPembayaran,
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
                            ],
                          );
                        },
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
  }
}
