
const String tableTasks = 'notes';

class TaskFields {
  static final List<String> values = [
    /// Add all fields
    id, title, description, time, colortheme,
  ];

  static const String id = '_id';
  static const String title = 'title';
  static const String description = 'description';
  static const String time = 'time';
  static const String colortheme = 'colortheme';
  // static const String isDone = 'isDone';
}

class Task {
  final int? id;
  final String title;
  final String description;
  final DateTime createdTime;
  final String colortheme;
  // final bool isDone;

  const Task(
      {this.id,
      required this.title,
      required this.description,
      required this.createdTime,
      required this.colortheme
      // required this.isDone
      }
  );

  Task copy({
    int? id,
    String? title,
    String? description,
    DateTime? createdTime,
    String? colortheme
    // bool? isDone
  }) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
        colortheme: colortheme ?? this.colortheme
        // isDone: false
      );

  static Task fromJson(Map<String, Object?> json) => Task(
    id: json[TaskFields.id] as int,
    title: json[TaskFields.title] as String,
    description: json[TaskFields.description] as String,
    createdTime: DateTime.parse(json[TaskFields.time] as String),
    colortheme: json[TaskFields.colortheme] as String
    // isDone: false
  );

  Map<String, Object?> toJson() => {
    TaskFields.id: id,
    TaskFields.title: title,
    TaskFields.description: description,
    TaskFields.time: createdTime.toIso8601String(),
    TaskFields.colortheme: colortheme
    // TaskFields.isDone: false
  };
}
