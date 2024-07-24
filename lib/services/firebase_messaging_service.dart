
import 'package:firebase_messaging/firebase_messaging.dart';


class FirebaseMessagingService{



FirebaseMessagingService();

    Future<void> initialize() async{
    

    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
    );

    
    }


 




}