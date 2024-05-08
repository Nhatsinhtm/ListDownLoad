
import 'dart:async';
import 'dart:ui';

import 'package:animationproject/Badge_test.dart';
import 'package:animationproject/HomePage.dart';
import 'package:animationproject/Model/Data_Provider.dart';
import 'package:animationproject/screen/download.dart';
import 'package:animationproject/screen/list_download_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeService();
  runApp(const MyApp());
}

Future<void> initializeService() async{
  final service = FlutterBackgroundService();
  await service.configure(
      iosConfiguration:IosConfiguration(),
      androidConfiguration: AndroidConfiguration(
          onStart: onStart,
          isForegroundMode: true));
  service.startService();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
create: (context) => DataProvider(),
      child: Builder(
        builder: (context) {
          return  MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            home:ListDownload(),
          );
        }
      ),
    );
  }
}

@pragma('vm:entry_point')
void onStart(ServiceInstance service) async {
DartPluginRegistrant.ensureInitialized();
service.on('setAsForeground').listen((event) {
  print('foreground-----------------------');
},);
service.on('setAsBackground').listen((event) {
  print('background-----------------------');
},);
service.on('stopService').listen((event) {
  service.stopSelf();
},);
// display notification
Timer.periodic(Duration(seconds: 2), (timer) {

});

}
@pragma('vm:entry_point')
 Future<bool> iosBackground(ServiceInstance service) async {

  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
return true;
}
