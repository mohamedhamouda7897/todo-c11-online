class TaskModel {
  String id;
  String title;
  String subTitle;
  int date;
  bool isDone;

  TaskModel({
    this.id = "",
    required this.title,
    required this.subTitle,
    required this.date,
    this.isDone = false,
  });

  TaskModel.fromJson(Map<String, dynamic> data)
      : this(
          title: data['title'],
          subTitle: data['subTitle'],
          date: data['date'],
          id: data['id'],
          isDone: data['isDone'],
        );

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "subTitle": subTitle,
      "date": date,
      "id": id,
      "isDone": isDone,
    };
  }
}
