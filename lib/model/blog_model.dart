class BlogModel {
  bool? success;
  int? count;
  List<Data>? data;

  BlogModel({this.success, this.count, this.data});

  BlogModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? authorEmail;
  String? imageUrl;
  String? description;
  int? timeStamp;
  String? title;
  String? authorId;

  Data(
      {this.id,
        this.authorEmail,
        this.imageUrl,
        this.description,
        this.timeStamp,
        this.title,
        this.authorId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authorEmail = json['authorEmail'];
    imageUrl = json['imageUrl'];
    description = json['description'];
    timeStamp = json['timeStamp'];
    title = json['title'];
    authorId = json['authorId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['authorEmail'] = this.authorEmail;
    data['imageUrl'] = this.imageUrl;
    data['description'] = this.description;
    data['timeStamp'] = this.timeStamp;
    data['title'] = this.title;
    data['authorId'] = this.authorId;
    return data;
  }
}
