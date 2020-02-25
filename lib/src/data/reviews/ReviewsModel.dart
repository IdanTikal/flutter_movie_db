class ReviewsModel {
  String author;
  String content;
  String id;
  String url;

  ReviewsModel({this.author, this.content, this.id, this.url});

  ReviewsModel.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    content = json['content'];
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['content'] = this.content;
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}