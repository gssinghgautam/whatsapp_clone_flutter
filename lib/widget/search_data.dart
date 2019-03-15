import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? dummyData
        : dummyData
            .where((chatModel) =>
                chatModel.name.toLowerCase().contains(query.toLowerCase()) ||
                chatModel.message.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => Column(
            children: <Widget>[
              Divider(
                height: 10.0,
                indent: 70.0,
              ),
              ListTile(
                onTap: () => print('${suggestionList[index].name} is clicked'),
                leading: CircleAvatar(
                  radius: 20.0,
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage:
                      NetworkImage(suggestionList[index].avatarUrl),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      suggestionList[index].name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF212121)),
                    ),
                    Text(
                      suggestionList[index].time,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                          color: Color(0xFF757575)),
                    )
                  ],
                ),
                subtitle: Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    suggestionList[index].message,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                        color: Color(0xFF757575)),
                  ),
                ),
              )
            ],
          ),
    );
  }
}
