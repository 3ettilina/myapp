import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.highlight = '',
    this.fans = 0,
    this.follows = 0,
    this.reviews = 0,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  final String id;
  final String name;
  final String highlight;
  @JsonKey(name: 'image')
  final String imageUrl;
  final int fans;
  final int follows;
  final int reviews;

  @override
  List<Object?> get props => [
        id,
        name,
        highlight,
        imageUrl,
        fans,
        follows,
        reviews,
      ];
}
