import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:realtime_crypto/main/data/data_source/remote/websocket_service.dart';
import 'package:realtime_crypto/main/data/models/response/stream_response.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebsocketServiceImpl implements WebsocketService{

  final WebSocketChannel _webSocketChannel;

  WebsocketServiceImpl({required WebSocketChannel webSocketChannel}) :
        _webSocketChannel = webSocketChannel;

  @override
  Future<void> closeStream() async {
    _webSocketChannel.sink.close();
    debugPrint("WEBSOCKET CHANNEL CLOSED!");
  }

  Future<void> initConnection() async {

    try{
      await _webSocketChannel.ready;
    } on SocketException catch (e){
      debugPrint("SocketException => ${e.message.toString()}");
    } on WebSocketChannelException catch (e){
      debugPrint("WebSocketChannelException => ${e.message.toString()}");
    }
  }

  @override
  StreamSubscription<dynamic> connect({String? action, String? symbols}){

    initConnection();

    _webSocketChannel.sink.add(
        jsonEncode(
            {
              "action": action,
              "symbols": symbols
            }
        )
    );

    return _webSocketChannel.stream.listen((data){
      debugPrint("LISTENED => ${data.toString()}");
    });
  }

  @override
  Stream<StreamResponseModel> connect2({String? action, String? symbols, void Function(dynamic p1)? onData}) {

    initConnection();

    _webSocketChannel.sink.add(
        jsonEncode(
            {
              "action": action,
              "symbols": symbols
            }
        )
    );

    return _webSocketChannel.stream
        .map<StreamResponseModel>(
        (value) => StreamResponseModel.fromJson(jsonDecode(value))
    );
  }

}