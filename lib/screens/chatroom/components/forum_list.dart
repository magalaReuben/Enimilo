import 'package:enimilo/screens/chatroom/components/group_card.dart';
import 'package:flutter/material.dart';

String getId(String res) {
  return res.substring(0, res.indexOf("_"));
}

String getName(String res) {
  return res.substring(res.indexOf("_") + 1);
}

// ignore: non_constant_identifier_names
ForumList(forums) {
  return StreamBuilder(
    stream: forums,
    builder: (context, AsyncSnapshot snapshot) {
      // make some checks
      if (snapshot.hasData) {
        print(snapshot.data['forums']);
        if (snapshot.data['forums'] != null) {
          if (snapshot.data['forums'].length != 0) {
            print(snapshot.data['forums']);
            return ListView.builder(
              itemCount: snapshot.data['forums'].length,
              itemBuilder: (context, index) {
                int reverseIndex = snapshot.data['forums'].length - index - 1;
                return GroupCard(
                    context,
                    getId(snapshot.data['forums'][reverseIndex]),
                    getName(snapshot.data['forums'][reverseIndex]),
                    snapshot.data['fullName']);
              },
            );
          } else {
            return Container();
            //return noForumWidget();
          }
        } else {
          return Container();
          //return noForumWidget();
        }
      } else {
        return Center(
          child:
              CircularProgressIndicator(color: Theme.of(context).primaryColor),
        );
      }
    },
  );
}
