import 'package:flutter/material.dart';
import 'package:whatsapp_clone/widget/call_item.dart';
import '../models/calls_model.dart';

class CallsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyCallData.length,
      itemBuilder: (context, index) => CallsItemWidget(
            callsModel: dummyCallData,
            index: index,
          ),
    );
  }
}
