import 'package:flutter/material.dart';
import '../models/status_model.dart';

class StatusItemWidget extends StatelessWidget {
  final List<StatusModel> statusModelList;
  final int index;

  StatusItemWidget({this.statusModelList, this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          height: index == 0 ? 0 : 10.0,
          indent: 70.0,
        ),
        ListTile(
          onTap: () => print('Clicked'),
          leading: CircleAvatar(
            radius: 24.0,
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.grey,
            backgroundImage: NetworkImage(statusModelList[index].avatarUrl),
          ),
          title: Text(
            statusModelList[index].name,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16.0),
          ),
          subtitle: Text(
            statusModelList[index].statusTime,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 14.0),
          ),
        )
      ],
    );
  }
}
