class PostData {
  String? message;
  List<Data>? data;

  PostData({this.message, this.data});

  PostData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  String? postImage;
  List<PostComments>? postComments;
  List<PostLikes>? postLikes;

  Data(
      {this.id,
        this.title,
        this.description,
        this.postImage,
        this.postComments,
        this.postLikes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    postImage = json['post_image'];
    if (json['post_comments'] != null) {
      postComments = <PostComments>[];
      json['post_comments'].forEach((v) {
        postComments!.add(new PostComments.fromJson(v));
      });
    }
    if (json['post_likes'] != null) {
      postLikes = <PostLikes>[];
      json['post_likes'].forEach((v) {
        postLikes!.add(new PostLikes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['post_image'] = this.postImage;
    if (this.postComments != null) {
      data['post_comments'] =
          this.postComments!.map((v) => v.toJson()).toList();
    }
    if (this.postLikes != null) {
      data['post_likes'] = this.postLikes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostComments {
  String? comment;
  int? userId;

  PostComments({this.comment, this.userId});

  PostComments.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    data['user_id'] = this.userId;
    return data;
  }
}

class PostLikes {
  int? userId;

  PostLikes({this.userId});

  PostLikes.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    return data;
  }
}
