import 'package:customer_retention/model/evidance_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin localNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void initNotifications() async {
  var initializeAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettings =
      InitializationSettings(android: initializeAndroid);
  AndroidNotificationChannelGroup channelGroup =
      AndroidNotificationChannelGroup('com.my.app.alert1', 'mychannel1');
  await localNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannelGroup(channelGroup);

  await localNotificationsPlugin.initialize(initializationSettings);
}

int id = 1;
Future singleNotification(
    DateTime scheduledDate, List<EvidanceModel> model, int hashCode) async {
  if (model.length == 0) return;
  AndroidNotificationDetails androidNotificationDetails =
      const AndroidNotificationDetails(
    "ch101",
    "Channel 1",
    channelDescription: "channel Desc",
    importance: Importance.defaultImportance,
    priority: Priority.defaultPriority,
    groupKey: "groupkey101",
    enableVibration: true,
    enableLights: true,
    playSound: true,
  );

  AndroidNotificationDetails androidNotificationDetailsNoSound =
      const AndroidNotificationDetails(
    "ch101",
    "Channel 1",
    channelDescription: "channel Desc",
    importance: Importance.defaultImportance,
    priority: Priority.defaultPriority,
    groupKey: "groupkey101",
    playSound: false,
  );

  NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
  NotificationDetails notificationDetailsNoSound =
      NotificationDetails(android: androidNotificationDetailsNoSound);

  int it = 0;
  for (var e in model) {
    await localNotificationsPlugin.show(id, e.customerName, e.evidanceType,
        it == 0 ? notificationDetails : notificationDetailsNoSound);
    id = id + 1;
    it++;
    if (it >= 11) return;
  }
  if (id > 1000) id = 0;

  NotificationDetails groupNotification = getGroupNotifier();
  await localNotificationsPlugin.show(
      0, 'Attention', '$id messages', groupNotification);
}

NotificationDetails getGroupNotifier() {
  InboxStyleInformation inboxStyleInformation =
      InboxStyleInformation([], contentTitle: 'messages');

  AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails("ch101", "Channel 1",
          channelDescription: "channel Desc",
          styleInformation: inboxStyleInformation,
          groupKey: "groupkey101",
          playSound: false,
          setAsGroupSummary: true);

  return NotificationDetails(android: androidNotificationDetails);
}
