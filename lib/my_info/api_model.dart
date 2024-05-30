class MyPageModel {
  final String boardId, content, image, writeDate, heart;

  MyPageModel.fromJson(Map<String, dynamic> json)
      : boardId = json['boardId'],
        content = json['content'],
        image = json['image'],
        writeDate = json['writeDate'],
        heart = json['heart'];
}
