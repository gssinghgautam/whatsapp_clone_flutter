import 'package:flutter/material.dart';
import 'package:whatsapp_clone/helper/utils.dart';
import '../models/calls_model.dart';

class CallsItemWidget extends StatelessWidget {
  final List<CallsModel> callsModel;

  final int index;

  CallsItemWidget({this.callsModel, this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          height: index == 0 ? 0.0 : 10.0,
          indent: 70.0,
        ),
        ListTile(
            leading: CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.grey,
              foregroundColor: Theme.of(context).primaryColor,
              backgroundImage: NetworkImage(dummyCallData[index].avatarUrl),
            ),
            title: Text(dummyCallData[index].name,
                style: TextStyle(
                    color: Color(Utils.primaryTextColor()),
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0)),
            subtitle: Row(
              children: <Widget>[
                Icon(
                  dummyCallData[index].type == 'incoming'
                      ? Icons.call_received
                      : Icons.call_made,
                  size: 16.0,
                  color: dummyCallData[index].type == 'incoming'
                      ? Colors.red
                      : Colors.green,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text(dummyCallData[index].callTime,
                      style: TextStyle(
                          color: Color(Utils.secondaryTextColor()),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0)),
                )
              ],
            ),
            trailing: dummyCallData[index].callType == 'video'
                ? Icon(
                    Icons.videocam,
                    color: Theme.of(context).primaryColor,
                  )
                : Icon(Icons.call, color: Theme.of(context).primaryColor))
      ],
    );
  }
}
