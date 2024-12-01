import 'package:get/get.dart';
import 'package:realtime_crypto/core/constants/constants.dart';
import 'package:realtime_crypto/main/data/data_source/remote/websocket_service.dart';
import 'package:realtime_crypto/main/data/data_source/remote/websocket_service_impl.dart';
import 'package:realtime_crypto/main/data/repository/stream_repository_impl.dart';
import 'package:realtime_crypto/main/domain/repository/stream_repository.dart';
import 'package:realtime_crypto/main/domain/usecases/close_stream_usecase.dart';
import 'package:realtime_crypto/main/domain/usecases/connect_stream_usecase.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class AppBindings extends Bindings{

  @override
  Future<void> dependencies() async {
    Get.put<WebSocketChannel>(webSocketChannel(), permanent: true);

    Get.put<WebsocketService>(
        WebsocketServiceImpl(webSocketChannel: Get.find<WebSocketChannel>())
    );

    Get.put<StreamRepository>(
        StreamRepositoryImpl(websocketService: Get.find<WebsocketService>())
    );

    Get.put<ConnectStreamUseCase>(
        ConnectStreamUseCase(streamRepository: Get.find<StreamRepository>())
    );

    Get.put<CloseStreamUseCase>(
        CloseStreamUseCase(streamRepository: Get.find<StreamRepository>())
    );


  }

  WebSocketChannel webSocketChannel(){
    var wsUrl = Uri.parse(baseUrl);
    final websocketInstance = WebSocketChannel
        .connect(wsUrl);
    return websocketInstance;
  }
}