class TaskModel {
  String id;
  String title;
  String description;
  String category;
  int date;
  bool isDone;

  TaskModel({
    this.id = "",
    required this.title,
    required this.description,
    required this.category,
    required this.date,
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
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "category": category,
      "date": date,
      "isDone": isDone,
    };
  }
}
