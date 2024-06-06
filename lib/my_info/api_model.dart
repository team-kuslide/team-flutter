class MyPageResponse {
  final int boardId;
  final String content;
  final String image;
  final DateTime writeDate;
  final int heart;

  MyPageResponse({
    required this.boardId,
    required this.content,
    required this.image,
    required this.writeDate,
    required this.heart,
  });

  factory MyPageResponse.fromJson(Map<String, dynamic> json) {
    return MyPageResponse(
      boardId: json['boardId'],
      content: json['content'],
      image: json['image'],
      writeDate: DateTime.parse(json['writeDate']),
      heart: json['heart'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'boardId': boardId,
      'content': content,
      'image': image,
      'writeDate': writeDate.toIso8601String(),
      'heart': heart,
    };
  }
}
