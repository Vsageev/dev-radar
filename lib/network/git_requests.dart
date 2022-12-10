import 'dart:convert';

import 'package:dev_radar/shared/without_http.dart';
import 'package:http/http.dart' as http;

class GitRequests {
  static Future<List<Contributor>> getContributors(String url) async {
    final response = await http.get(Uri.https(gitHost, '/repos/${gitUrlBody(url)}/contributors'),
        headers: {"Content-Type": "application/json"});

    return ContributorsResponse.fromJson(response.body).contributors;
  }
}

String gitHost = 'api.github.com';

String gitUrlBody(String url) {
  return withoutHttps(url.substring(11));
}

class ContributorsResponse {
  List<Contributor> contributors;
  ContributorsResponse({
    required this.contributors,
  });

  Map<String, dynamic> toMap() {
    return {
      'contributors': contributors.map((x) => x.toMap()).toList(),
    };
  }

  factory ContributorsResponse.fromArray(List arr) {
    return ContributorsResponse(
      contributors: List<Contributor>.from(arr.map((x) => Contributor.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ContributorsResponse.fromJson(String source) => ContributorsResponse.fromArray(json.decode(source));
}

class Contributor {
  String login;
  String avatarUrl;
  String htmlUrl;
  int contributions;
  Contributor({
    required this.login,
    required this.avatarUrl,
    required this.htmlUrl,
    required this.contributions,
  });

  List<String> toRow() {
    return [
      login,
      htmlUrl,
      contributions.toString(),
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'avatar_url': avatarUrl,
      'html_url': htmlUrl,
      'contributions': contributions,
    };
  }

  factory Contributor.fromMap(Map<String, dynamic> map) {
    return Contributor(
      login: map['login'] ?? '',
      avatarUrl: map['avatar_url'] ?? '',
      htmlUrl: map['html_url'] ?? '',
      contributions: map['contributions']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contributor.fromJson(String source) => Contributor.fromMap(json.decode(source));
}
