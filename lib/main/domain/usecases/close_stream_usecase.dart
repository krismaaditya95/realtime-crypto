import 'dart:async';

import 'package:realtime_crypto/core/usecase/base_usecase.dart';
import 'package:realtime_crypto/main/domain/repository/stream_repository.dart';

class CloseStreamUseCase extends BaseCloseUseCase<void>{

  final StreamRepository _streamRepository;

  CloseStreamUseCase({required StreamRepository streamRepository})
      : _streamRepository = streamRepository;

  @override
  Future<void> call() {
    return _streamRepository.closeStream();
  }
}