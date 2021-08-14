import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:timeago/timeago.dart' as tAgo;

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  String time;

  @override
  Widget build(BuildContext context) {
    Widget mPopup() => PopupMenuButton(
          itemBuilder: (context) {
            var list = List<PopupMenuEntry<Object>>();
            list.add(
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () async {
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser.uid)
                        .collection('notifications')
                        .snapshots()
                        .forEach((element) {
                      for (QueryDocumentSnapshot snapshot in element.docs) {
                        snapshot.reference.delete();
                      }
                    });
                  },
                  child: Text("Clear Notifications"),
                ),
                value: 1,
              ),
            );
            return list;
          },
          child: Container(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.1,
              padding: EdgeInsets.all(6),
              child: Icon(
                Icons.more_vert,
                color: Colors.black,
              )),
        );
    DateTime now = DateTime.now();
    var timeNow = int.parse(DateFormat('kk').format(now));
    List<String> resultTime = now.toString().split(' ');
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text('Notification', style: boldTextStyle(size: 20)),
        actions: <Widget>[mPopup()],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser.uid)
                    .collection('notifications')
                    .orderBy('time', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('We got an Error ${snapshot.error}');
                  }
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(
                        child: Text('Loading'),
                      );

                    case ConnectionState.none:
                      return Text('No notifications');

                    case ConnectionState.done:
                      return Text('We are Done');

                    default:
                      return Container(
                          //color: Colors.black,
                          margin: EdgeInsets.symmetric(
                              horizontal: 0.0, vertical: 10.0),
                          child: ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                DocumentSnapshot not =
                                    snapshot.data.docs[index];
                                return GestureDetector(
                                  onTap: () {
                                    if (not.data()['from'] == "news") {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          backgroundColor: Colors.white,
                                          titlePadding: EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 16),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 16),
                                          title: Text(not.data()['title'],
                                              style: boldTextStyle(size: 20)),
                                          content: Text(not.data()['body'],
                                              style: primaryTextStyle()),
                                          actions: [
                                            RaisedButton(
                                              color: Colors.blue,
                                              onPressed: () {
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (context) => //PersonalDetails(),
                                                //   ),
                                                // );
                                              },
                                              child: Text("Check"),
                                            )
                                          ],
                                        ),
                                      );
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) => SimpleDialog(
                                          backgroundColor: Colors.white,
                                          titlePadding: EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 16),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 16),
                                          title: Text(not.data()['title'],
                                              style: boldTextStyle(size: 20)),
                                          children: [
                                            Text(not.data()['body'],
                                                style: primaryTextStyle()),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                  child: Container(
                                    // margin: EdgeInsets.only(left: 2),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4.0, right: 4.0),
                                      child: ListTile(
                                          leading: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              height: 50,
                                              // width: 50,
                                              child: not.data()['from'] ==
                                                          "news" ? Icon(
                                                          Icons
                                                              .article,
                                                          color: Colors.blue,
                                                        )
                                                      : Icon(
                                                          Icons
                                                              .add_alert_sharp,
                                                          color: Colors.red,
                                                        )),
                                          title: Text(
                                            not.data()['title'],
                                            style: boldTextStyle(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          subtitle: Container(
                                            margin: EdgeInsets.only(top: 4),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      not
                                                              .data()['body']
                                                              .substring(
                                                                  0, 15) +
                                                          "...",
                                                      style: TextStyle(
                                                        color: Colors.grey[500],
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                      maxLines: 1,
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      (tAgo.format(not
                                                              .data()['time']
                                                              .toDate()))
                                                          .toString(),
                                                      style:
                                                          secondaryTextStyle(),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          ),
                                    ),
                                  ),
                                );
                              }));
                  }
                })
          ],
        ),
      ),
    );
  }
}
