import 'package:enimilo/screens/chatscreen/components/message_tile.dart';
import 'package:flutter/material.dart';

chatMessages(chats, widget) {
  return StreamBuilder(
    stream: chats,
    builder: (context, AsyncSnapshot snapshot) {
      return snapshot.hasData
          ? ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                return MessageTile(
                    message: snapshot.data.docs[index]['message'],
                    sender: snapshot.data.docs[index]['sender'],
                    sentByMe:
                        widget.userName == snapshot.data.docs[index]['sender']);
              },
            )
          : Container();
    },
  );
}
