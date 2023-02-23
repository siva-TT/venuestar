import 'package:push/push.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:venuestar/main.dart';
import 'package:venuestar/push/android.dart';

Future<FlutterLocalNotificationsPlugin>
    initializeFlutterLocalNotifications() async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('mipmap/ic_launcher');
// initialise the plugin. app_icon needs to be a added as a drawable resou rce to the Android head project
  // 'mipmap/ic_launcher' taken from https://github.com/MaikuB/flutter_local_notifications/issues/32#issuecomment-389542800
  final IOSInitializationSettings initializationSettingsIOS =
      // ignore: prefer_const_constructors
      IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    // onDidReceiveLocalNotification: (id, title, body, payload) => ((id, title, body, payload) {}),
  );
  IOSInitializationSettings();
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  return flutterLocalNotificationsPlugin;
}

// ignore: must_be_immutable
class MyApp extends HookWidget {
  NotificationDetails? platformDetails;

  MyApp(this.flutterLocalNotificationsPlugin, {Key? key}) : super(key: key);
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  Widget build(BuildContext context) {
    final notificationWhichLaunchedApp = useState<Map<String?, Object?>?>(null);
    final messagesReceived = useState<List<RemoteMessage>>([]);
    final backgroundMessagesReceived = useState<List<RemoteMessage>>([]);
    final tappedNotificationPayloads =
        useState<List<Map<String?, Object?>>>([]);
    // ignore: unused_local_variable
    final isForegroundNotificationsEnabled = useState(true);
    final pushToken = useState<String?>(null);
    final notificationSettings = useState<UNNotificationSettings?>(null);

    useEffect(() {
      final onNewTokenSubscription = Push.instance.token.then((value) {
        print("Just got a new token: $value");
        pushToken.value = value;
      });
      Push.instance.notificationTapWhichLaunchedAppFromTerminated.then((data) {
        if (data == null) {
          print("App was not launched by tapping a notification");
        } else {
          print('Notification tap launched app from terminated state:\n'
              'Data: $data \n');
        }
        notificationWhichLaunchedApp.value = data;
      });

      // Handle notification taps
      final onNotificationTapSubscription =
          Push.instance.onNotificationTap.listen((data) {
        print('Notification was tapped:\n'
            'Data: $data \n');
        tappedNotificationPayloads.value += [data];
      });

      // Handle push notifications
      final onMessageSubscription = Push.instance.onMessage.listen((message) {
        print('RemoteMessage received while app is in foreground:\n'
            'RemoteMessage.Notification: ${message.notification} \n'
            ' title: ${message.notification?.title.toString()}\n'
            // ' body: ${message.notification?.body.toString()}\n'
            'RemoteMessage.Data: ${message.data}');
        messagesReceived.value += [message];
        _showNotification();
      });

      // Handle push notifications
      final onBackgroundMessageSubscription =
          Push.instance.onBackgroundMessage.listen((message) {
        print('RemoteMessage received while app is in background:\n'
            'RemoteMessage.Notification: ${message.notification} \n'
            'RemoteMessage.Data: ${message.data}');
        backgroundMessagesReceived.value += [message];
        _showNotification();
      });

      return () {
        onNewTokenSubscription;
        onNotificationTapSubscription.cancel();
        onMessageSubscription.cancel();
        onBackgroundMessageSubscription.cancel();
      };
    }, []);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InitialScreen(),
    );
  }

  buildTappedNotificationsSliver(BuildContext context,
      List<Map<String?, Object?>> tappedNotificationPayloads) {
    if (tappedNotificationPayloads.isEmpty) {
      return const Text("No payloads");
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              ...tappedNotificationPayloads
                  .map((data) => Text("Data", semanticsLabel: data.toString()))
                  .toList()
            ],
          ),
        ],
      );
    }
  }
}

late AndroidNotificationChannel channel;
Future _showNotification() async {
  // ignore: prefer_const_constructors
  channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
  );
  var platformChannelSpecifics = NotificationDetails(
      android: AndroidNotificationDetails(
          debugChannel.id, debugChannel.name, debugChannel.description,
          importance: Importance.max,
          priority: Priority.high,
          ticker: "A manually-sent push notification.",
          styleInformation: const DefaultStyleInformation(
            false,
            false,
          )),
      // ignore: prefer_const_constructors
      iOS: IOSNotificationDetails(presentAlert: true));

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin.show(
    0,
    'Push Received',
    'Silent Push Received',
    platformChannelSpecifics,
    payload: 'Custom_Sound',
  );
}
