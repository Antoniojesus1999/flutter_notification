import 'package:flutter/material.dart';
import 'package:flutter_notificacion/screens/home_screen.dart';
import 'package:flutter_notificacion/screens/message_screen.dart';
import 'package:flutter_notificacion/services/push_notification_service.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await PushNotificationService.initializeApp();
     runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {'home': ( _ ) => HomeScreen(), 'message': ( _ ) => MessageScreen()},
    );
  }
}
