class TaskModel {
  String id;
  String title;
  String description;
  String category;
  int date;
  bool isDone;
  String userId;

  TaskModel({
    this.id = "",
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    required this.userId,
    this.isDone = false,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          title: json['title'],
          description: json['description'],
          category: json['category'],
          date: json['date'],
          isDone: json['isDone'],
          userId: json['userId'],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "category": category,
      "date": date,
      "userId": userId,
      "isDone": isDone,
    };
  }
}
