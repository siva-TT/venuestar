import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const debugChannel = AndroidNotificationChannel(
  'debug',
  'Debug',
  'This channel is used to demo all notifications manually for development/debug purposes.',
  importance: Importance.max,
);

final _flutterLocalNotifications = FlutterLocalNotificationsPlugin()
    .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

void configureAndroidPushNotificationChannels() async {
  if (!Platform.isAndroid) {
    return;
  }

  await _flutterLocalNotifications!.createNotificationChannel(debugChannel);
}
