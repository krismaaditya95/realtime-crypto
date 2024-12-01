

import 'dart:async';

import 'package:realtime_crypto/main/data/models/response/stream_response.dart';

abstract class WebsocketService{

  StreamSubscription<dynamic> connect({
    String? action,
    String? symbols
  });

  Stream<StreamResponseModel> connect2({
    String? action,
    String? symbols,
    void Function(dynamic)? onData
  });

  Future<void> closeStream() async{}


}