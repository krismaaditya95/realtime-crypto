import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realtime_crypto/config/theme/app_themes.dart';
import 'package:realtime_crypto/main/data/models/response/chart_data.dart';
import 'package:realtime_crypto/main/presentation/home/getx/home_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends GetView<HomeController> {

  static const String routeName = '/home-page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(controller.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            // ---------------
            // CHART
            // ---------------
            Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                    color: AppThemes.cEEEEEE,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    border: Border(
                      top: BorderSide(color: AppThemes.cE38E49),
                      left: BorderSide(color: AppThemes.cE38E49),
                      right: BorderSide(color: AppThemes.cE38E49),
                      bottom: BorderSide(color: AppThemes.cE38E49),
                    )
                ),
                child: StreamBuilder(
                    stream: controller.broadcastStream
                        .where((item) => item.s == "BTC-USD"),
                    builder: (context, snapshot) {
                      debugPrint("home_page | getStream LISTENED => ${snapshot.data.toString()}");

                      if(snapshot.connectionState == ConnectionState.active && snapshot.hasData){
                        return SfCartesianChart(
                          title: ChartTitle(text: '${snapshot.data!.s.toString()}\n'
                              '${double.parse(double.parse(snapshot.data!.p!).toStringAsFixed(2))}'),
                          // primaryXAxis: const CategoryAxis(),

                          series: <LineSeries<ChartData, double>>[
                            LineSeries<ChartData, double>(
                              onRendererCreated: (ChartSeriesController chartController){
                                controller.chartSeriesController = chartController;
                              },
                              dataSource: controller.chartData,
                              xValueMapper: (ChartData data, _) => data.second,
                              yValueMapper: (ChartData data, _) => data.p,
                              // dataLabelSettings: const DataLabelSettings(isVisible: true),
                            )
                          ],

                        );


                      }else{
                        return const Center(child: CircularProgressIndicator());
                      }
                    }
                )
            ),

            // ---------------
            // WATCHLIST
            // ---------------

            const Text('WATCHLIST', style: TextStyle(
                color: AppThemes.c0A3981, fontSize: 16)
            ),

            Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: AppThemes.cEEEEEE,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    border: Border(
                      top: BorderSide(color: AppThemes.cE38E49),
                      left: BorderSide(color: AppThemes.cE38E49),
                      right: BorderSide(color: AppThemes.cE38E49),
                      bottom: BorderSide(color: AppThemes.cE38E49),
                    )
                ),
                child: Column(
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Symbol', style: TextStyle(
                            color: AppThemes.c1F509A, fontSize: 14)
                        ),

                        Text('Last', style: TextStyle(
                            color: AppThemes.c1F509A, fontSize: 14)
                        ),

                        Text('Chg', style: TextStyle(
                            color: AppThemes.c1F509A, fontSize: 14)
                        ),

                        Text('Chg%', style: TextStyle(
                            color: AppThemes.c1F509A, fontSize: 14)
                        ),
                      ],
                    ),

                    const Divider(),

                    StreamBuilder(
                      stream: controller.broadcastStream
                          .where((item) => item.s == "ETH-USD"),
                      builder: (context, snapshot) {

                        debugPrint("home_page | getStream LISTENED => ${snapshot.data.toString()}");

                        if(snapshot.connectionState == ConnectionState.active && snapshot.hasData){
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${snapshot.data?.s.toString().replaceAll("-", "")}", style: const TextStyle(
                                  color: AppThemes.c1F509A, fontSize: 14)
                              ),

                              Text("${double.parse(double.parse(snapshot.data!.p!).toStringAsFixed(2))}", style: const TextStyle(
                                  color: AppThemes.c1F509A, fontSize: 14)
                              ),

                              Text("${double.parse(double.parse(snapshot.data!.dd!).toStringAsFixed(2))}", style: const TextStyle(
                                  color: AppThemes.c1F509A, fontSize: 14)
                              ),

                              Text("${double.parse(double.parse(snapshot.data!.dc!).toStringAsFixed(2))}%", style: const TextStyle(
                                  color: AppThemes.c1F509A, fontSize: 14)
                              )
                            ],
                          );
                        }else{
                          return const Center(child: CircularProgressIndicator());
                        }
                      }
                    ),

                    const Divider(),

                    StreamBuilder(
                        stream: controller.broadcastStream
                            .where((item) => item.s == "BTC-USD"),
                        builder: (context, snapshot) {

                          debugPrint("home_page | getStream LISTENED => ${snapshot.data.toString()}");

                          if(snapshot.connectionState == ConnectionState.active && snapshot.hasData){
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${snapshot.data?.s.toString().replaceAll("-", "")}", style: const TextStyle(
                                    color: AppThemes.c1F509A, fontSize: 14)
                                ),

                                Text("${double.parse(double.parse(snapshot.data!.p!).toStringAsFixed(2))}", style: const TextStyle(
                                    color: AppThemes.c1F509A, fontSize: 14)
                                ),

                                Text("${double.parse(double.parse(snapshot.data!.dd!).toStringAsFixed(2))}", style: const TextStyle(
                                    color: AppThemes.c1F509A, fontSize: 14)
                                ),

                                Text("${double.parse(double.parse(snapshot.data!.dc!).toStringAsFixed(2))}%", style: const TextStyle(
                                    color: AppThemes.c1F509A, fontSize: 14)
                                )
                              ],
                            );
                          }else{
                            return const Center(child: CircularProgressIndicator());
                          }
                        }
                    ),

                  ],
                )
            )
          ],
        ),
      )

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
