import 'package:realtime_crypto/main/data/models/response/stream_response.dart';
import 'package:realtime_crypto/main/domain/entity/stream_response_entity.dart';

class StreamResponseMapper{
  static StreamResponseEntity toEntity(StreamResponseModel model) => StreamResponseEntity(
    s: model.s,
    p: model.p,
    q: model.q,
    dc: model.dc,
    dd: model.dd,
    t: model.t
  );
}