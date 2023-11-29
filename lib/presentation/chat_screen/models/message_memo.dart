class MessageMemo {
  String idFrom = '';
  String idTo = '';
  String timestamp = '';
  String content = '';
  int type = 0;
  String etc1 = '';

  MessageMemo({
    required this.idFrom,
    required this.idTo,
    required this.timestamp,
    required this.content,
    required this.type,
    required this.etc1,
  });

  MessageMemo.empty();

  factory MessageMemo.fromMap(Map<String, dynamic> json) {
    return MessageMemo(
        timestamp: json['timestamp'],
        idFrom: json['idFrom'],
        idTo: json['idTo'],
        content: json['content'],
        etc1: json['etc1'],
        type: json['type']);
  }

  Map<String, dynamic> toMap() => {
        'timestamp': timestamp,
        'idFrom': idFrom,
        'idTo': idTo,
        'content': content,
        'etc1': etc1,
        'type': type
      };
}
