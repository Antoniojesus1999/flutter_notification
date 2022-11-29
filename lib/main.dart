import 'package:flutter/material.dart';
import 'package:flutter_notificacion/screens/home_screen.dart';
import 'package:flutter_notificacion/screens/message_screen.dart';
import 'package:flutter_notificacion/services/push_notification_service.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await PushNotificationService.initializeApp();
     runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    PushNotificationService.messagesStream.listen((message) { 
      print('My App $message');
    });
  }
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
