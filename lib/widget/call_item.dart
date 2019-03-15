import 'package:flutter/material.dart';
import '../models/calls_model.dart';

class CallsItemWidget extends StatelessWidget {
  List<CallsModel> callsModel;

  int index;

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
                    fontWeight: FontWeight.bold, color: Color(0xFF212121))),
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
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,
                          color: Color(0xFF757575))),
                )
              ],
            ),
            trailing: dummyCallData[index].callType == 'video'
                ? Icon(
                    Icons.videocam,
                    color: Color(0xFF128C7E),
                  )
                : Icon(Icons.call, color: Color(0xFF128C7E)))
      ],
    );
  }
}
