import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class ChatItemWidget extends StatelessWidget {
  final List<ChatModel> chatModelList;
  final int index;

  ChatItemWidget({this.chatModelList, this.index});

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Divider(
            height: 10.0,
            indent: 70.0,
          ),
          ListTile(
            onTap: () => print('${chatModelList[index].name} is clicked'),
            leading: CircleAvatar(
              radius: 20.0,
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(chatModelList[index].avatarUrl),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  chatModelList[index].name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0),
                ),
                Text(
                  chatModelList[index].time,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 14.0),
                )
              ],
            ),
            subtitle: Container(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                chatModelList[index].message,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 15.0),
              ),
            ),
          )
        ],
      );
}
