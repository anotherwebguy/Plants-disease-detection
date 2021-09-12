import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService{
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

  initialise()async{
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('sheti_icon');
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  instantNotification(String text, String body, String alert)async{
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: false);
    const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0, '$text', '$body', platformChannelSpecifics,
      payload: 'item x');
      addData(text, body, alert);
  }

  addData(String title, String body, String type)async{
    await FirebaseFirestore.instance
    .collection('users')
    .doc(FirebaseAuth.instance.currentUser.uid)
    .collection('notifications')
    .add({
      'title': title,
      'body': body,
      'time': DateTime.now(),
      'type': type,
      'existence': true,
    });
  }
}

//text ko title
//subtext body