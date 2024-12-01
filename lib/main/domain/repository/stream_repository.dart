import 'dart:async';

import 'package:realtime_crypto/main/domain/entity/stream_response_entity.dart';

abstract class StreamRepository{

  StreamSubscription<dynamic> connect({
    String? action,
    String? symbols
  });

  Stream<StreamResponseEntity> connect2({
    String? action,
    String? symbols,
    void Function(dynamic)? onData
  });

  Future<void> closeStream() async {}
}