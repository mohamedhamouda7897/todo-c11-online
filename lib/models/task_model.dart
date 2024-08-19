class TaskModel {
  String id;
  String title;
  String subTitle;
  bool isDone;
  int date;
  String userId;

  TaskModel({
    this.id = "",
    required this.title,
    required this.subTitle,
    this.isDone = false,
    required this.date,
    required this.userId,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          title: json['title'],
          subTitle: json['subTitle'],
          date: json['date'],
          id: json['id'],
          userId: json['userId'],
          isDone: json['isDone'],
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

// void main(){
//   TaskModel taskModel=TaskModel(title: "title", subTitle: "subTitle", date: 4525);
//   Map<String, dynamic> map= taskModel.toJson();
// }
