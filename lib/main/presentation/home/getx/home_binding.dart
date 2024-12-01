import 'package:get/get.dart';
import 'package:realtime_crypto/main/domain/usecases/close_stream_usecase.dart';
import 'package:realtime_crypto/main/domain/usecases/connect_stream_usecase.dart';
import 'package:realtime_crypto/main/presentation/home/getx/home_controller.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeBinding extends Bindings{

  @override
  Future<void> dependencies() async {

    // Get.put(HomeController());

    Get.put(HomeController(
        connectStreamUseCase: Get.find<ConnectStreamUseCase>(),
      closeStreamUseCase: Get.find<CloseStreamUseCase>(),
      webSocketChannelInstance: Get.find<WebSocketChannel>()
    ));
  }
}