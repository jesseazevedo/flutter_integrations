import 'package:uuid/uuid.dart';

class Journal {
  String id;
  String content;
  DateTime createdAt;
  DateTime updatedAt;
  int userId;

  Journal(
      {required this.id,
      required this.content,
      required this.createdAt,
      required this.updatedAt,
      required this.userId});

  Journal.empty({required int uId})
      : id = const Uuid().v1(),
        content = "",
        userId = uId,
        createdAt = DateTime.now(),
        updatedAt = DateTime.now();

  Journal.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        content = map['content'],
        createdAt = DateTime.parse(map['createdAt']),
        updatedAt = DateTime.parse(map['updatedAt']),
        userId = map['userId'];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "content": content,
      "createdAt": createdAt.toString(),
      "updatedAt": updatedAt.toString(),
      "userId": userId
    };
  }

  @override
  String toString() {
    return "$content \n $userId \ncreated_at: $createdAt\nupdated_at:$updatedAt";
  }
}
