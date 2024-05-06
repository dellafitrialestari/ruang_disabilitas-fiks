import 'package:flutter/material.dart';
import 'package:ruang_disabilitas/auth/firebase_auth/auth_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DetailPsikologModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  bool berlangananButton() {
    return valueOrDefault(
        currentUserDocument
            ?.video,
        null) != null &&
        valueOrDefault(
            currentUserDocument
                ?.telepon,
            null) != null &&
        valueOrDefault(
            currentUserDocument
                ?.chat,
            null) != null;
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
