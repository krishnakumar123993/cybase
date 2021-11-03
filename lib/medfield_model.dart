// To parse this JSON data, do
//
//     final modelApi = modelApiFromJson(jsonString);

import 'dart:convert';

ModelApi modelApiFromJson(String str) => ModelApi.fromJson(json.decode(str));

String modelApiToJson(ModelApi data) => json.encode(data.toJson());

class ModelApi {
  ModelApi({
    this.message,
    this.error,
    this.data,
  });

  String message;
  bool error;
  Data data;

  factory ModelApi.fromJson(Map<String, dynamic> json) => ModelApi(
    message: json["message"],
    error: json["error"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "error": error,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.bookmarkCount,
    this.banner,
    this.articles,
    this.healthVideos,
    this.category,
    this.liveUpdates,
  });

  int bookmarkCount;
  List<Banners> banner;
  List<Article> articles;
  List<Article> healthVideos;
  List<Category> category;
  LiveUpdates liveUpdates;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    bookmarkCount: json["bookmark_count"],
    banner: List<Banners>.from(json["banner"].map((x) => Banners.fromJson(x))),
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    healthVideos: List<Article>.from(json["health_videos"].map((x) => Article.fromJson(x))),
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    liveUpdates: LiveUpdates.fromJson(json["live_updates"]),
  );

  Map<String, dynamic> toJson() => {
    "bookmark_count": bookmarkCount,
    "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    "health_videos": List<dynamic>.from(healthVideos.map((x) => x.toJson())),
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
    "live_updates": liveUpdates.toJson(),
  };
}

class Article {
  Article({
    this.id,
    this.name,
    this.maincategoryId,
    this.maincategoryName,
    this.articleList,
    this.videosList,
  });

  String id;
  String name;
  String maincategoryId;
  String maincategoryName;
  List<ArticleList> articleList;
  List<VideosList> videosList;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    id: json["_id"],
    name: json["name"],
    maincategoryId: json["maincategory_id"],
    maincategoryName: json["maincategory_name"],
    articleList: json["article_list"] == null ? null : List<ArticleList>.from(json["article_list"].map((x) => ArticleList.fromJson(x))),
    videosList: json["videos_list"] == null ? null : List<VideosList>.from(json["videos_list"].map((x) => VideosList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "maincategory_id": maincategoryId,
    "maincategory_name": maincategoryName,
    "article_list": articleList == null ? null : List<dynamic>.from(articleList.map((x) => x.toJson())),
    "videos_list": videosList == null ? null : List<dynamic>.from(videosList.map((x) => x.toJson())),
  };
}

class ArticleList {
  ArticleList({
    this.id,
    this.readTime,
    this.image,
    this.createdAt,
    this.likeCount,
    this.isSaved,
    this.isLiked,
    this.title,
    this.type,
  });

  String id;
  String readTime;
  String image;
  String createdAt;
  int likeCount;
  int isSaved;
  int isLiked;
  String title;
  String type;

  factory ArticleList.fromJson(Map<String, dynamic> json) => ArticleList(
    id: json["_id"],
    readTime: json["readTime"],
    image: json["image"],
    createdAt: json["createdAt"],
    likeCount: json["like_count"],
    isSaved: json["is_saved"],
    isLiked: json["is_liked"],
    title: json["title"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "readTime": readTime,
    "image": image,
    "createdAt": createdAt,
    "like_count": likeCount,
    "is_saved": isSaved,
    "is_liked": isLiked,
    "title": title,
    "type": type,
  };
}

class VideosList {
  VideosList({
    this.id,
    this.video,
    this.thumbnail,
    this.duration,
    this.createdAt,
    this.likeCount,
    this.isSaved,
    this.isLiked,
    this.type,
    this.title,
  });

  String id;
  String video;
  String thumbnail;
  String duration;
  String createdAt;
  int likeCount;
  int isSaved;
  int isLiked;
  String type;
  String title;

  factory VideosList.fromJson(Map<String, dynamic> json) => VideosList(
    id: json["_id"],
    video: json["video"],
    thumbnail: json["thumbnail"],
    duration: json["duration"],
    createdAt: json["createdAt"],
    likeCount: json["like_count"],
    isSaved: json["is_saved"],
    isLiked: json["is_liked"],
    type: json["type"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "video": video,
    "thumbnail": thumbnail,
    "duration": duration,
    "createdAt": createdAt,
    "like_count": likeCount,
    "is_saved": isSaved,
    "is_liked": isLiked,
    "type": type,
    "title": title,
  };
}

class Banners {
  Banners({
    this.id,
    this.redirectType,
    this.image,
  });

  String id;
  String redirectType;
  String image;

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
    id: json["_id"],
    redirectType: json["redirect_type"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "redirect_type": redirectType,
    "image": image,
  };
}

class Category {
  Category({
    this.image,
    this.name,
  });

  String image;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    image: json["image"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "name": name,
  };
}

class LiveUpdates {
  LiveUpdates({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory LiveUpdates.fromJson(Map<String, dynamic> json) => LiveUpdates(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}
