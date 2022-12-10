import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:dev_radar/shared/without_http.dart';

class StackRequests {
  static Future<List<AnswererItem>> getAnswerers(String url) async {
    final response = await http.get(
        Uri.https(gitHost, '/2.3/tags/${tagFromUrl(url)}/top-answerers/all_time', {'site': 'stackoverflow'}),
        headers: {"Content-Type": "application/json"});

    return AnswerersResponse.fromJson(response.body).items;
  }
}

String gitHost = 'api.stackexchange.com';

String tagFromUrl(String url) {
  return withoutHttps(url.substring(23));
}

class AnswerersResponse {
  List<AnswererItem> items;
  AnswerersResponse({
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory AnswerersResponse.fromMap(Map<String, dynamic> map) {
    return AnswerersResponse(
      items: List<AnswererItem>.from(map['items']?.map((x) => AnswererItem.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerersResponse.fromJson(String source) => AnswerersResponse.fromMap(json.decode(source));
}

class AnswererItem {
  Answerer user;
  int postCount;
  int score;
  AnswererItem({
    required this.user,
    required this.postCount,
    required this.score,
  });

  List<String> toRow() {
    return [
      user.displayName,
      user.link,
      score.toString(),
      postCount.toString(),
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user.toMap(),
      'post_count': postCount,
      'score': score,
    };
  }

  factory AnswererItem.fromMap(Map<String, dynamic> map) {
    return AnswererItem(
      user: Answerer.fromMap(map['user']),
      postCount: map['post_count']?.toInt() ?? 0,
      score: map['score']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswererItem.fromJson(String source) => AnswererItem.fromMap(json.decode(source));
}

class Answerer {
  String displayName;
  String profileImage;
  String link;
  Answerer({
    required this.displayName,
    required this.profileImage,
    required this.link,
  });

  Map<String, dynamic> toMap() {
    return {
      'display_mame': displayName,
      'profile_image': profileImage,
      'link': link,
    };
  }

  factory Answerer.fromMap(Map<String, dynamic> map) {
    return Answerer(
      displayName: map['display_name'] ?? '',
      profileImage: map['profile_image'] ?? '',
      link: map['link'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Answerer.fromJson(String source) => Answerer.fromMap(json.decode(source));
}
