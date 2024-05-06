import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'recovery_password_model.dart';
export 'recovery_password_model.dart';

class RecoveryPasswordWidget extends StatefulWidget {
  const RecoveryPasswordWidget({Key? key}) : super(key: key);

  @override
  _RecoveryPasswordWidgetState createState() => _RecoveryPasswordWidgetState();
}

class _RecoveryPasswordWidgetState extends State<RecoveryPasswordWidget> {
  late RecoveryPasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecoveryPasswordModel());

    _model.emailAddressRecoveryController ??= TextEditingController();
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: SvgPicture.asset(
                      'assets/images/name.svg',
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.04,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(29.0, 0.0, 29.0, 0.0),
                  child: Text(
                    'kami akan mengirimkan email kepada Anda dengan tautan untuk mengatur ulang kata sandi Anda, silakan masukkan email yang terkait dengan akun Anda di bawah ini',
                    textAlign: TextAlign.justify,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF1E1E1E),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(29.0, 20.0, 29.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                        child: TextFormField(
                          controller: _model.emailAddressRecoveryController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'email',
                            hintStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFFC7C8CD),
                                  fontSize: 12.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFC7C8CD),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(40.07),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFC7C8CD),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(40.07),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFC7C8CD),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(40.07),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFC7C8CD),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(40.07),
                            ),
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                14.0, 14.0, 14.0, 14.0),
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFF222A21),
                                fontSize: 14.0,
                              ),
                          keyboardType: TextInputType.emailAddress,
                          validator: _model
                              .emailAddressRecoveryControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(29.0, 44.0, 29.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (_model.emailAddressRecoveryController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Email required!',
                            ),
                          ),
                        );
                        return;
                      }
                      await authManager.resetPassword(
                        email: _model.emailAddressRecoveryController.text,
                        context: context,
                      );
                    },
                    text: 'Kirim Link',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF6CC166),
                      textStyle: GoogleFonts.getFont(
                        'Poppins',
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      elevation: 2.0,
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
                      EdgeInsetsDirectional.fromSTEB(29.0, 108.0, 29.0, 50.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum memiliki akun?',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'signUp',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: Text(
                          'Daftar',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF6CC166),
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
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
  }
}
