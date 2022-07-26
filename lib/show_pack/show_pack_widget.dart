import '../backend/api_requests/api_calls.dart';
import '../components/git_gift_task_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowPackWidget extends StatefulWidget {
  const ShowPackWidget({
    Key? key,
    this.pack,
  }) : super(key: key);

  final dynamic pack;

  @override
  _ShowPackWidgetState createState() => _ShowPackWidgetState();
}

class _ShowPackWidgetState extends State<ShowPackWidget> {
  ApiCallResponse? rCheckOrderPack;
  Completer<ApiCallResponse>? _apiRequestCompleter;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Pack',
          style: FlutterFlowTheme.of(context).subtitle2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0x32171717),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                      'Budget Name',
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 0),
                                  child: Text(
                                    formatNumber(
                                      functions.jsonToDouble(getJsonField(
                                        widget.pack,
                                        r'''$.obj1''',
                                      )),
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.automatic,
                                      currency: 'DA ',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .title1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 36,
                                          fontWeight: FontWeight.normal,
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: Text(
                                'Orders',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder<ApiCallResponse>(
                      future:
                          (_apiRequestCompleter ??= Completer<ApiCallResponse>()
                                ..complete(TaskOrdersPackByUserCall.call(
                                  packId: getJsonField(
                                    widget.pack,
                                    r'''$.id''',
                                  ),
                                )))
                              .future,
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        final listViewTaskOrdersPackByUserResponse =
                            snapshot.data!;
                        return Builder(
                          builder: (context) {
                            final order = getJsonField(
                              listViewTaskOrdersPackByUserResponse.jsonBody,
                              r'''$''',
                            ).toList();
                            return RefreshIndicator(
                              onRefresh: () async {
                                setState(() => _apiRequestCompleter = null);
                                await waitForApiRequestCompleter();
                              },
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: order.length,
                                itemBuilder: (context, orderIndex) {
                                  final orderItem = order[orderIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.92,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3,
                                            color: Color(0x35000000),
                                            offset: Offset(0, 1),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 1,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 4, 4, 4),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      getJsonField(
                                                        orderItem,
                                                        r'''$.name''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 4, 0, 0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                            'relative',
                                                            functions.jsonToDate(
                                                                getJsonField(
                                                              orderItem,
                                                              r'''$.created''',
                                                            ))),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 12, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    getJsonField(
                                                      orderItem,
                                                      r'''$.totallines''',
                                                    ).toString(),
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xFF090F13),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (getJsonField(
                                                  orderItem,
                                                  r'''$.target_id''',
                                                ) ==
                                                null)
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30,
                                                borderWidth: 1,
                                                buttonSize: 60,
                                                icon: Icon(
                                                  Icons.cached,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 30,
                                                ),
                                                onPressed: () async {
                                                  rCheckOrderPack =
                                                      await TaskCheckOrderPackCall
                                                          .call(
                                                    orderId:
                                                        valueOrDefault<String>(
                                                      getJsonField(
                                                        orderItem,
                                                        r'''$.c_order_id''',
                                                      ).toString(),
                                                      '0',
                                                    ),
                                                    packId:
                                                        valueOrDefault<String>(
                                                      getJsonField(
                                                        widget.pack,
                                                        r'''$.id''',
                                                      ).toString(),
                                                      '0',
                                                    ),
                                                  );
                                                  if ((rCheckOrderPack
                                                          ?.succeeded ??
                                                      true)) {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .viewInsets,
                                                          child: Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.5,
                                                            child:
                                                                GitGiftTaskWidget(
                                                              task:
                                                                  getJsonField(
                                                                widget.pack,
                                                                r'''$''',
                                                              ),
                                                              orderId:
                                                                  getJsonField(
                                                                orderItem,
                                                                r'''$.c_order_id''',
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          getJsonField(
                                                            (rCheckOrderPack
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.error''',
                                                          ).toString(),
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Roboto',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBtnText,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor3,
                                                      ),
                                                    );
                                                  }

                                                  setState(() {});
                                                },
                                              ),
                                            if (getJsonField(
                                                  orderItem,
                                                  r'''$.target_id''',
                                                ) !=
                                                null)
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30,
                                                borderWidth: 1,
                                                buttonSize: 60,
                                                icon: Icon(
                                                  Icons.card_giftcard,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryColor,
                                                  size: 30,
                                                ),
                                                onPressed: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBtnText,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.75,
                                                          child:
                                                              GitGiftTaskWidget(
                                                            task: widget.pack,
                                                            orderId:
                                                                getJsonField(
                                                              orderItem,
                                                              r'''$.c_order_id''',
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
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

  Future waitForApiRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
