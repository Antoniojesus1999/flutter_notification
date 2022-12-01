import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService{
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStream = StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

// Dependiendo donde se este ejecutando la aplicación entra en un método otro
//message.notification.title message.notification.body
  static Future _backgroudHandler(RemoteMessage message) async {
    //print('entra por el background Handler ${message.messageId}');
    _messageStream.add(message.data['product'] ?? 'No title');
  }

  static Future _onMessageHandler(RemoteMessage message) async{
    //print(' entra por el segundo onMessage Hnadler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.data['product'] ?? 'No title');
  }
  static Future _onMessageOpenApp(RemoteMessage message) async {
    //print('onMessageOpenApp Handler ${message.messageId}');
    _messageStream.add(message.data['product'] ?? 'No title');
  }

  static Future initializeApp() async {
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('token: ${token}');

    FirebaseMessaging.onBackgroundMessage(_backgroudHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }
  static closeStreams(){
    _messageStream.close();
  }
}