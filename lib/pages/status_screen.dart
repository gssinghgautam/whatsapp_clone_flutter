import 'package:flutter/material.dart';
import '../models/status_model.dart';
import '../widget/status_item.dart';

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            onTap: () => print('Clicked'),
            leading: CircleAvatar(
              radius: 24.0,
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/43.jpg'),
            ),
            title: Text(
              "My Status",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              'Tap to add a status update',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Text("Recent updates", style: TextStyle(color: Colors.grey)),
            decoration: BoxDecoration(color: Colors.grey[200]),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dummyStatusData.length,
              itemBuilder: (context, index) => StatusItemWidget(
                    statusModelList: dummyStatusData,
                    index: index,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
