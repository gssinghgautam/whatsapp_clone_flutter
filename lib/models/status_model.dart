class StatusModel {
  String name;
  String statusTime;
  String avatarUrl;

  StatusModel({this.name, this.statusTime, this.avatarUrl});
}

List<StatusModel> dummyStatusData = [
  StatusModel(
      name: "Chhutki",
      statusTime: '21 minutes ago',
      avatarUrl: 'https://randomuser.me/api/portraits/women/44.jpg'),
  StatusModel(
      name: "Pooja Pathak",
      statusTime: '55 minutes ago',
      avatarUrl: 'https://randomuser.me/api/portraits/women/45.jpg'),
  StatusModel(
      name: "Nikhil",
      statusTime: 'Today, 9:12 PM',
      avatarUrl: 'https://randomuser.me/api/portraits/men/46.jpg'),
  StatusModel(
      name: "Priya Sood",
      statusTime: 'Today, 6:35 PM',
      avatarUrl: 'https://randomuser.me/api/portraits/women/43.jpg'),
  StatusModel(
      name: "Cherag",
      statusTime: 'Today, 4:11 PM',
      avatarUrl: 'https://randomuser.me/api/portraits/men/1.jpg'),
  StatusModel(
      name: "Lovely Singh",
      statusTime: 'Today, 2:57 PM',
      avatarUrl: 'https://randomuser.me/api/portraits/women/40.jpg'),
  StatusModel(
      name: "Avinash Chandra",
      statusTime: 'Today, 9:10 AM',
      avatarUrl: 'https://randomuser.me/api/portraits/men/10.jpg')
];
