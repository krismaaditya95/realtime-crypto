import 'dart:async';
import 'package:realtime_crypto/core/usecase/base_usecase.dart';
import 'package:realtime_crypto/main/data/models/request/stream_request.dart';
import 'package:realtime_crypto/main/domain/entity/stream_response_entity.dart';
import 'package:realtime_crypto/main/domain/repository/stream_repository.dart';

class ConnectStreamUseCase extends BaseStreamUseCase<StreamResponseEntity, StreamRequest>{

  final StreamRepository _streamRepository;

  ConnectStreamUseCase({required StreamRepository streamRepository})
      : _streamRepository = streamRepository;

  @override
  Stream<StreamResponseEntity> call(StreamRequest params) {
    return _streamRepository.connect2(
        action: params.action,
        symbols: params.symbols,
        onData: params.onData
    );
  }

}