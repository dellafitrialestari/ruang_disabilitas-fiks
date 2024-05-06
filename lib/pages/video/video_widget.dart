import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'video_model.dart';

export 'video_model.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({Key? key}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoModel());
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
                                context.safePop();
                              },
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Development Video',
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
                      EdgeInsetsDirectional.fromSTEB(29.0, 0.0, 29.0, 10.0),
                  child: StreamBuilder<List<VideoRecord>>(
                    stream: queryVideoRecord(),
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
                      List<VideoRecord> listViewVideoRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        primary: false,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        clipBehavior: Clip.none,
                        itemCount: listViewVideoRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewVideoRecord =
                              listViewVideoRecordList[listViewIndex];
                          final youtubePlayerController =
                              YoutubePlayerController.fromVideoId(
                            videoId: _convertUrlToId(listViewVideoRecord.link)!,
                            autoPlay: false,
                            params: YoutubePlayerParams(
                              mute: false,
                              // loop: true,
                              showControls: false,
                              showFullscreenButton: false,
                            ),
                          );
                          return YoutubePlayerControllerProvider(
                            controller: youtubePlayerController,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 18.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await launchURL(listViewVideoRecord.connect);
                                },
                                child: Container(
                                  width: 372.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        YoutubeValueBuilder(
                                            controller: youtubePlayerController,
                                            builder: (context, value) {
                                              return Stack(
                                                children: [
                                                  YoutubePlayerScaffold(
                                                      builder:
                                                          (context, player) =>
                                                              player,
                                                      controller:
                                                          youtubePlayerController),
                                                  // FlutterFlowYoutubePlayer(
                                                  //   url: listViewVideoRecord.link,
                                                  //   width: double.infinity,
                                                  //   height: double.infinity,
                                                  //   autoPlay: false,
                                                  //   looping: true,
                                                  //   mute: false,
                                                  //   showControls: true,
                                                  //   showFullScreen: false,
                                                  // ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      // if(await youtubePlayerController.playerState == PlayerState.playing) {
                                                      //   await youtubePlayerController.pauseVideo();
                                                      // }
                                                      // await youtubePlayerController.playVideo();
                                                      if(value.playerState == PlayerState.playing) {
                                                        context.ytController.pauseVideo();
                                                      } else {
                                                        context.ytController.playVideo();
                                                      }
                                                      debugPrint("should be playing");
                                                    },
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      width: double.infinity,
                                                      height: 200,
                                                    ),
                                                  )
                                                ],
                                              );
                                            }),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 8.0, 4.0, 4.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                listViewVideoRecord.judul,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Color(0xFF1E1E1E),
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 6.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  1.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'By: ',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        listViewVideoRecord
                                                            .channel,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color(
                                                                  0xFF074471),
                                                              fontSize: 12.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _convertUrlToId(String url, {bool trimWhitespaces = true}) {
    assert(url.isNotEmpty, 'Url cannot be empty');
    if (!url.contains("http") && (url.length == 11)) return url;
    if (trimWhitespaces) url = url.trim();
    for (final regex in [
      RegExp(
        r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$",
      ),
      RegExp(
        r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$",
      ),
      RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
    ]) {
      final match = regex.firstMatch(url);
      if (match != null && match.groupCount >= 1) return match.group(1);
    }
    return null;
  }
}
