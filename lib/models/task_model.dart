class TaskModel {
  String id;
  String title;
  String subTitle;
  int date;
  bool isDone;
  String userId;

  TaskModel({
    this.id = "",
    required this.title,
    required this.subTitle,
    required this.date,
    required this.userId,
    this.isDone = false,
  });

  TaskModel.fromJson(Map<String, dynamic> data)
      : this(
          title: data['title'],
          subTitle: data['subTitle'],
          date: data['date'],
          id: data['id'],
          userId: data['userId'],
          isDone: data['isDone'],
        );

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "subTitle": subTitle,
      "date": date,
      "id": id,
      "userId": userId,
      "isDone": isDone,
    };
  }
}
