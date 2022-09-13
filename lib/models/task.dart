const String tableTasks = 'notes';

class TaskFields {
  static final List<String> values = [
    /// Add all fields
    id, title, description, time
  ];

  static const String id = '_id';
  static const String title = 'title';
  static const String description = 'description';
  static const String time = 'time';
}

class Task {
  final int? id;
  final String title;
  final String description;
  final DateTime createdTime;

  const Task(
      {this.id,
      required this.title,
      required this.description,
      required this.createdTime}
  );

  Task copy({
    int? id,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static Task fromJson(Map<String, Object?> json) => Task(
    id: json[TaskFields.id] as int,
    title: json[TaskFields.title] as String,
    description: json[TaskFields.description] as String,
    createdTime: DateTime.parse(json[TaskFields.time] as String)
  );

  Map<String, Object?> toJson() => {
    TaskFields.id: id,
    TaskFields.title: title,
    TaskFields.description: description,
    TaskFields.time: createdTime.toIso8601String()
  };
}
