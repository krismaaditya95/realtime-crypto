

import 'dart:async';

import 'package:realtime_crypto/main/data/data_source/remote/websocket_service.dart';
import 'package:realtime_crypto/main/data/mapper/stream_response_mapper.dart';
import 'package:realtime_crypto/main/domain/entity/stream_response_entity.dart';
import 'package:realtime_crypto/main/domain/repository/stream_repository.dart';

class StreamRepositoryImpl implements StreamRepository{

  final WebsocketService _websocketService;

  StreamRepositoryImpl({required WebsocketService websocketService})
      : _websocketService = websocketService;

  @override
  StreamSubscription connect({String? action, String? symbols}) {

    return _websocketService.connect(
      action: action,
      symbols: symbols
    );

  }

  @override
  Future<void> closeStream() {
    return _websocketService.closeStream();
  }

  @override
  Stream<StreamResponseEntity> connect2({String? action, String? symbols, void Function(dynamic p1)? onData}) {
    return _websocketService.connect2(
        action: action,
        symbols: symbols,
        onData: onData
    ).map<StreamResponseEntity>(
        (value) => StreamResponseMapper.toEntity(value)
    );
        // .skipWhile((item) => item.s.toString() == "BTC-USD");
  }
}