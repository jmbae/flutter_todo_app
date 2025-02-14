class Todo {
  String title;
  bool completed;

  Todo({
    required this.title,
    this.completed = false,
  });

  //  toJson() is the conventional name
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'completed': completed,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(title: json['title'], completed: json['completed']);
  }
}
