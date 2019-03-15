class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  ChatModel({this.name, this.message, this.time, this.avatarUrl});
}

List<ChatModel> dummyData = [
  new ChatModel(
      name: "Gautam Kumar",
      message: "Hey Flutter, You are so amazing !",
      time: "15:30",
      avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg"),
  new ChatModel(
      name: "Aditya Bhardwaj",
      message: "How are you?",
      time: "17:30",
      avatarUrl: "https://randomuser.me/api/portraits/men/2.jpg"),
  new ChatModel(
      name: "Akshay",
      message: "Wassup !",
      time: "5:00",
      avatarUrl: "https://randomuser.me/api/portraits/men/3.jpg"),
  new ChatModel(
      name: "Kusum",
      message: "I'm good!",
      time: "10:30",
      avatarUrl: "https://randomuser.me/api/portraits/men/4.jpg"),
  new ChatModel(
      name: "Kishan Singh",
      message: "I'm the fastest man alive!",
      time: "12:30",
      avatarUrl: "https://randomuser.me/api/portraits/men/5.jpg"),
  new ChatModel(
      name: "Badal Kumar",
      message: "Hey Flutter, You are so cool !",
      time: "15:30",
      avatarUrl: "https://randomuser.me/api/portraits/men/6.jpg"),
];
