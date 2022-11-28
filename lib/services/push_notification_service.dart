import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService{
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

// Dependiendo donde se este ejecutando la aplicación entra en un método otro
  static Future _backgroudHandler(RemoteMessage message) async {
    print('entra por el background Handler ${message.messageId}');
  }

  static Future _onMessageHandler(RemoteMessage message) async{
    print(' entra por el segundo onMessage Hnadler ${message.messageId}');
  }
  static Future _onMessageOpenApp(RemoteMessage message) async {
    print('onMessageOpenApp Handler ${message.messageId}');
  }

  static Future initializeApp() async {
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('token: ${token}');

    FirebaseMessaging.onBackgroundMessage(_backgroudHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }
}