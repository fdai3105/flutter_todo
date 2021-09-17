import 'dart:convert';

class Todo {
  Todo({
    required this.code,
    required this.message,
    required this.data,
  });

  final int code;
  final String message;
  final List<TodoDatum> data;

  factory Todo.fromRawJson(String str) => Todo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        code: json["code"],
        message: json["message"],
        data: List<TodoDatum>.from(
            json["data"].map((x) => TodoDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TodoDatum {
  TodoDatum({
    required this.id,
    required this.todo,
    required this.desc,
    required this.complete,
    required this.color,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String todo;
  final String desc;
  final bool complete;
  final dynamic color;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory TodoDatum.fromRawJson(String str) =>
      TodoDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TodoDatum.fromJson(Map<String, dynamic> json) => TodoDatum(
        id: json["id"],
        todo: json["todo"],
        desc: json["desc"],
        complete: json["complete"],
        color: json["color"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "desc": desc,
        "complete": complete,
        "color": color,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
