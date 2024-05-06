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

class EditProfilModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for nama widget.
  TextEditingController? namaController;
  String? Function(BuildContext, String?)? namaControllerValidator;
  String? _namaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Kolom harus diisi';
    }

    return null;
  }

  // State field(s) for disabilitas widget.
  TextEditingController? disabilitasController;
  String? Function(BuildContext, String?)? disabilitasControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    namaControllerValidator = _namaControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    namaController?.dispose();
    disabilitasController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
