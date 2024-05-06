import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/change_photo/change_photo_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_profil_model.dart';
export 'edit_profil_model.dart';

class EditProfilWidget extends StatefulWidget {
  const EditProfilWidget({Key? key}) : super(key: key);

  @override
  _EditProfilWidgetState createState() => _EditProfilWidgetState();
}

class _EditProfilWidgetState extends State<EditProfilWidget> {
  late EditProfilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfilModel());

    _model.namaController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.disabilitasController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.disabilitas, ''));
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
                                'Profile',
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
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Colors.white,
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 2.0, 2.0, 2.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => ClipRRect(
                                    borderRadius: BorderRadius.circular(40.0),
                                    child: CachedNetworkImage(
                                      fadeInDuration:
                                          Duration(milliseconds: 500),
                                      fadeOutDuration:
                                          Duration(milliseconds: 500),
                                      imageUrl: valueOrDefault<String>(
                                        currentUserPhoto,
                                        'https://lh3.googleusercontent.com/pw/AIL4fc_YbSy6IBuhq0YJPdBrzS42Ew1UK2MzCUsHbgDHMEm-LB-DrzfVzk7DsC6cWWg0wOz4PCF6-cHPEDZqunNcvpPgG0ItFL4b2vWz1UExDzYnK7jD2UAxnI0Dq8M68erWwBE7JCIeTciZ6bWYiILY_Cc=w600-h600-s-no',
                                      ),
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () => FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: ChangePhotoWidget(),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          text: 'Edit Photo',
                          options: FFButtonOptions(
                            width: 130.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            29.0, 0.0, 29.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 22.0, 0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => TextFormField(
                                  controller: _model.namaController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'masukkan nama anda',
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
                                      borderRadius:
                                          BorderRadius.circular(40.07),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFC7C8CD),
                                        width: 1.5,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(40.07),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFC7C8CD),
                                        width: 1.5,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(40.07),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFC7C8CD),
                                        width: 1.5,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(40.07),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            14.0, 14.0, 14.0, 14.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF222A21),
                                        fontSize: 14.0,
                                      ),
                                  validator: _model.namaControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 32.0, 0.0, 0.0),
                              child: Text(
                                'Disabilitas',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 22.0, 0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => TextFormField(
                                  controller: _model.disabilitasController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'jenis disabilitas',
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
                                      borderRadius:
                                          BorderRadius.circular(40.07),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFC7C8CD),
                                        width: 1.5,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(40.07),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFC7C8CD),
                                        width: 1.5,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(40.07),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFC7C8CD),
                                        width: 1.5,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(40.07),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            14.0, 14.0, 14.0, 14.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF222A21),
                                        fontSize: 14.0,
                                      ),
                                  validator: _model
                                      .disabilitasControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }

                          await currentUserReference!
                              .update(createUsersRecordData(
                            displayName: _model.namaController.text,
                            disabilitas: _model.disabilitasController.text,
                          ));
                        },
                        text: 'Submit',
                        options: FFButtonOptions(
                          width: 200.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF6CC166),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
