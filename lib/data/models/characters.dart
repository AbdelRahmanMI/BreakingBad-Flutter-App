
import 'package:meta/meta.dart';
import 'dart:convert';

Character characterFromJson(String str) => Character.fromJson(json.decode(str));

String characterToJson(Character data) => json.encode(data.toJson());

class Character {
  Character({
    required this.charId,
    required this.name,
    required this.birthday,
    required this.jobs,
    required this.image,
    required this.statusIfDeadOrAlive,
    required this.nickname,
    required this.appearanceOfSeasons,
    required this.actorName,
    required this.categoryForTwoSeries,
    required this.betterCallSaulAppearance,
  });

  final int charId;
  final String name;
  final String birthday;
  final List<String> jobs;
  final String image;
  final String statusIfDeadOrAlive;
  final String nickname;
  final List<int> appearanceOfSeasons;
  final String actorName;
  final String categoryForTwoSeries;
  final List<dynamic> betterCallSaulAppearance;

  Character copyWith({
    int? charId,
    String? name,
    String? birthday,
    List<String>? jobs,
    String? image,
    String? statusIfDeadOrAlive,
    String? nickname,
    List<int>? appearanceOfSeasons,
    String? actorName,
    String? categoryForTwoSeries,
    List<dynamic>? betterCallSaulAppearance,
  }) =>
      Character(
        charId: charId ?? this.charId,
        name: name ?? this.name,
        birthday: birthday ?? this.birthday,
        jobs: jobs ?? this.jobs,
        image: image ?? this.image,
        statusIfDeadOrAlive: statusIfDeadOrAlive ?? this.statusIfDeadOrAlive,
        nickname: nickname ?? this.nickname,
        appearanceOfSeasons: appearanceOfSeasons ?? this.appearanceOfSeasons,
        actorName: actorName ?? this.actorName,
        categoryForTwoSeries: categoryForTwoSeries ?? this.categoryForTwoSeries,
        betterCallSaulAppearance: betterCallSaulAppearance ?? this.betterCallSaulAppearance,
      );

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    charId: json["char_id"],
    name: json["name"],
    birthday: json["birthday"],
    jobs : List<String>.from(json["occupation"].map((x) => x)),
    image: json["img"],
    statusIfDeadOrAlive: json["status"],
    nickname: json["nickname"],
    appearanceOfSeasons: List<int>.from(json["appearance"].map((x) => x)),
    actorName: json["portrayed"],
    categoryForTwoSeries: json["category"],
    betterCallSaulAppearance: List<dynamic>.from(json["better_call_saul_appearance"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "char_id": charId,
    "name": name,
    "birthday": birthday,
    "occupation": List<dynamic>.from(jobs.map((x) => x)),
    "img": image,
    "status": statusIfDeadOrAlive,
    "nickname": nickname,
    "appearance": List<dynamic>.from(appearanceOfSeasons.map((x) => x)),
    "portrayed": actorName,
    "category": categoryForTwoSeries,
    "better_call_saul_appearance": List<dynamic>.from(betterCallSaulAppearance.map((x) => x)),
  };
}
