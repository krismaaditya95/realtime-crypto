
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realtime_crypto/main/data/mapper/stream_response_mapper.dart';
import 'package:realtime_crypto/main/data/models/request/stream_request.dart';
import 'package:realtime_crypto/main/data/models/response/chart_data.dart';
import 'package:realtime_crypto/main/data/models/response/stream_response.dart';
import 'package:realtime_crypto/main/domain/entity/stream_response_entity.dart';
import 'package:realtime_crypto/main/domain/usecases/close_stream_usecase.dart';
import 'package:realtime_crypto/main/domain/usecases/connect_stream_usecase.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeController extends GetxController{

  final title = "Home";

  final ConnectStreamUseCase _connectStreamUseCase;
  final CloseStreamUseCase _closeStreamUseCase;
  final WebSocketChannel webSocketChannel;

  HomeController({
    required ConnectStreamUseCase connectStreamUseCase,
    required CloseStreamUseCase closeStreamUseCase,
    required WebSocketChannel webSocketChannelInstance
  }) : _connectStreamUseCase = connectStreamUseCase,
        _closeStreamUseCase = closeStreamUseCase,
  webSocketChannel = webSocketChannelInstance;

  List<StreamResponseEntity> responseEntityList = [];
  late Stream<StreamResponseEntity> broadcastStream;


  ChartSeriesController? chartSeriesController;
  late Timer timer;
  List<ChartData> chartData = [];


  @override
  void onInit() async {
    super.onInit();
    connectStream();
    timer = Timer.periodic(const Duration(seconds: 1), chartTick);
  }

  void connectStream(){
    broadcastStream =
    _connectStreamUseCase.call(
      StreamRequest(
        action: "subscribe",
        symbols: "ETH-USD,BTC-USD",
        onData: (data){
          debugPrint("LISTENED => ${data.toString()}");
          var model = StreamResponseModel.fromJson(jsonDecode(data.toString()));
          responseEntityList.add(StreamResponseMapper.toEntity(model));
        }
      )
    ).asBroadcastStream();
  }

  void chartTick(Timer timer){
    broadcastStream
    .where((item) => item.s == "BTC-USD").listen((data){
      chartData.add(ChartData(timer.tick.toDouble(), double.parse(double.parse(data!.p!).toStringAsFixed(2))));
    });

    if(chartData.length == 5){
      chartData.removeAt(0);
      chartSeriesController?.updateDataSource(
          addedDataIndexes: <int>[chartData.length - 1],
          removedDataIndexes: <int>[0]
      );
    }
  }

  @override
  void onClose() {
    super.onClose();
    debugPrint("onClose dipanggil => Check");
    // channel.sink.close();
    _closeStreamUseCase.call();
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("dispose dipanggil => Check");
    // channel.sink.close();
    _closeStreamUseCase.call();
  }
}