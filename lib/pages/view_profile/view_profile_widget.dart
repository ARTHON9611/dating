import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_profile_model.dart';
export 'view_profile_model.dart';

class ViewProfileWidget extends StatefulWidget {
  const ViewProfileWidget({
    super.key,
    required this.userInfo,
  });

  final UsersRecord? userInfo;

  @override
  State<ViewProfileWidget> createState() => _ViewProfileWidgetState();
}

class _ViewProfileWidgetState extends State<ViewProfileWidget> {
  late ViewProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewProfileModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            context.pop();
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 32.0,
          ),
        ),
        title: Text(
          'Profile',
          style: FlutterFlowTheme.of(context).headlineMedium,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.userInfo?.username,
                          'username',
                        ),
                        style: FlutterFlowTheme.of(context).headlineMedium,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget.userInfo?.age?.toString(),
                            'Invalid',
                          ),
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                        ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.userInfo?.bio,
                          'Bio',
                        ),
                        style: FlutterFlowTheme.of(context).labelLarge,
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.userInfo?.occupation,
                          'Occupation',
                        ),
                        style: FlutterFlowTheme.of(context).labelLarge,
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.userInfo?.email,
                          'email',
                        ),
                        style: FlutterFlowTheme.of(context).labelLarge,
                      ),
                      Divider(
                        height: 32.0,
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 600.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Stack(
              alignment: AlignmentDirectional(0.0, 1.0),
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      widget.userInfo!.photoUrl,
                      width: 800.0,
                      height: 400.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (!((currentUserDocument?.matches?.toList() ?? [])
                        .contains(widget.userInfo?.uid) ||
                    (currentUserDocument?.reject?.toList() ?? [])
                        .contains(widget.userInfo?.uid)))
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-0.58, 0.38),
                            child: FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 70.0,
                              fillColor: FlutterFlowTheme.of(context).error,
                              icon: Icon(
                                Icons.cancel_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 40.0,
                              ),
                              onPressed: () async {
                                await currentUserReference!.update({
                                  ...mapToFirestore(
                                    {
                                      'reject': FieldValue.arrayUnion(
                                          [widget.userInfo?.uid]),
                                    },
                                  ),
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Rejected!',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                                setState(() {
                                  FFAppState().hasClicked = 1;
                                });
                              },
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Color(0xFF28AF27),
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 70.0,
                            fillColor: FlutterFlowTheme.of(context).success,
                            icon: FaIcon(
                              FontAwesomeIcons.check,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 40.0,
                            ),
                            onPressed: () async {
                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'matches': FieldValue.arrayUnion(
                                        [widget.userInfo?.uid]),
                                  },
                                ),
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Matched Succesfully!',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              setState(() {
                                FFAppState().hasClicked = 1;
                              });
                            },
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
    );
  }
}
