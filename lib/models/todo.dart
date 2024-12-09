class Todo {
  final String id;
  final String title;
  final bool isComplete;

  Todo({
    required this.id,
    required this.title,
    this.isComplete = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      isComplete: json['isComplete'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isComplete': isComplete,
    };
  }
}
