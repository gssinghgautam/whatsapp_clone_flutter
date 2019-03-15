class CallsModel {
  String name;
  String avatarUrl;
  String callTime;
  String type;
  String callType;

  CallsModel(
      {this.name, this.avatarUrl, this.callTime, this.type, this.callType});
}

List<CallsModel> dummyCallData = [
  new CallsModel(
      name: "Nilesh Tiwari",
      avatarUrl: "https://randomuser.me/api/portraits/men/1.jpg",
      callTime: "Just Now",
      type: 'incoming',
      callType: 'video'),
  new CallsModel(
      name: "Ankleshwar",
      avatarUrl: "https://randomuser.me/api/portraits/men/2.jpg",
      callTime: "20 minutes ago",
      type: 'outgoing',
      callType: 'audio'),
  new CallsModel(
      name: "Akshay",
      avatarUrl: "https://randomuser.me/api/portraits/men/3.jpg",
      callTime: "25 minutes ago",
      type: 'incoming',
      callType: 'video'),
  new CallsModel(
      name: "Afsar",
      avatarUrl: "https://randomuser.me/api/portraits/men/4.jpg",
      callTime: "30 minutes ago",
      type: 'outgoing',
      callType: 'audio'),
  new CallsModel(
      name: "Atul Mishra",
      avatarUrl: "https://randomuser.me/api/portraits/men/5.jpg",
      callTime: "40 minutes ago",
      type: 'incoming',
      callType: 'video'),
  new CallsModel(
      name: "Khushboo",
      avatarUrl: "https://randomuser.me/api/portraits/men/6.jpg",
      callTime: "55 minutes ago",
      type: 'outgoing',
      callType: 'audio'),
  new CallsModel(
      name: "Kusum",
      avatarUrl: "https://randomuser.me/api/portraits/men/7.jpg",
      callTime: "1 hour ago",
      type: 'incoming',
      callType: 'video')
];
