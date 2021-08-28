import 'package:flutter/material.dart';
import 'package:push_app/services/push_notifications_service.dart';
import 'package:push_app/src/pages/home_page.dart';
import 'package:push_app/src/pages/message_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    //implement initState
    super.initState();

    //Acceso a context
    PushNotificationService.messageStream.listen((message) {
      print('MyApp: $message');
     });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home' : (_) => HomePage(),
        'message' : (_) => MessagePage(),
      },
    );
  }
}
