import 'dart:io';

import 'package:bingojogador/models/device.dart';
import 'package:bingojogador/screens/auth_screen.dart';
import 'package:bingojogador/screens/events/events_screen.dart';
import 'package:bingojogador/screens/home_jogador.dart';
import 'package:bingojogador/screens/home_screen.dart';
import 'package:bingojogador/screens/jogo_simples_screen.dart';
import 'package:bingojogador/services/web.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';


// chave global para navegar entre as telas
final navigatorKey = GlobalKey<NavigatorState>();

void main() async {



  //garante que o firebase esteja inicializado
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

 
  //Firestore database
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //Firebase messages
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  String? token = await messaging.getToken();
  
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

 // Verifica se o usuario autorizou as mensagens PUSH
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('[main#autorizouMensagem] SIM PERMITIU');
     _startPushNotificationHandler(messaging);
  } else if (settings.authorizationStatus==AuthorizationStatus.provisional) {

    print('[main#autorizouMensagem] PERMITIU PROVISORIAMENTE ');
    _startPushNotificationHandler(messaging);
  }else {
    print('[main#autorizouMensagem] NAO PERMITIU - NEGADA!!!');

  }
  

 

  runApp(const MyApp());
}

void _startPushNotificationHandler(FirebaseMessaging messaging) async{
      final Logger logger = Logger();
    String? token = await messaging.getToken();
    logger.i('[#startPushNotificationHandler] TOKEN: $token');
    setPushToken(token);

    //Quando o app estiver aberto
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      logger.i('[#startPushNotificationHandler] Recebeu foreground (app Aberto)!');
      print('dados da mensagem: ${message.data}');

      if (message.notification != null) {
        print('msg tambem veio com uma notificacao: ${message.notification}');
      }
    });

    //Quando o app estiver fechado
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

        // Terminou
    var dados_recebidos = await FirebaseMessaging.instance.getInitialMessage();
    if (dados_recebidos!.data.isNotEmpty) {
      if (dados_recebidos.data['message'] != null) {
        showMyDialog(dados_recebidos.data['message']);

      }

    }
}

//Envia o token para o servidor
void setPushToken(String? token) async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? prefsToken = prefs.getString('pushToken');
  bool? prefsSent = prefs.getBool('tokenSent');

  print('Prefs token - $prefsToken');

  if(prefsToken != token || (prefsToken == token && prefsSent == false)) {
    print('Enviando o token para o servidor');

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? brand;
    String? model;

    // Mostrar os vários tipos de tratamento que existem
    // https://github.com/fluttercommunity/plus_plugins/blob/main/packages/device_info_plus/device_info_plus/example/lib/main.dart

    if(Platform.isAndroid) {

      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print('Running on ${androidInfo.model}');  // e.g. "Moto G (4)"

      model = androidInfo.model;
      brand = androidInfo.brand;
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      print('Running on ${iosInfo.utsname.machine}');  // e.g. "iPod7,1"

      model = iosInfo.utsname.machine;
      brand = 'Apple';
    }


    Device device = Device(token: token, brand: brand, model: model);
    sendDevice(device);
  }
}

//listener para mensagens em background
// quando voltar a funcionar, verificar se o token mudou e enviar para o servidor
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  
  print("---------------------------------");
  print('[main#autorizouMensagem] Mensagem recebida em background: ${message.notification}');
  return Future<void>.value();

}



void showMyDialog(String message){
  //botao
  Widget okButton = OutlinedButton(
    onPressed: () {
      //Passa o contexto do navigatorKey que vai ser preenchido no futuro.
      Navigator.pop(navigatorKey.currentContext!);
    },
    child: Text('OK'),
  );

  AlertDialog alerta = AlertDialog(
    title: Text('Promoção Imperdível'),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  //Empurrando o contexto pra dentro.
  showDialog(context: navigatorKey.currentContext!, builder: (BuildContext context){
    return alerta;

  });

}





class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RoteadorTelas(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}

//Stream de modificacoes do usuario
class RoteadorTelas extends StatelessWidget {
  const RoteadorTelas({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            //esta logado
            return EventsScreen(user: snapshot.data!);
          } else {
            return const AuthScreen();
          }
        }
      },
    );
  }



}

