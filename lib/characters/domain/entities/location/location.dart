
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class LocationEntity extends Equatable {
  final String name;
  final String url;
  const LocationEntity({
    required this.name,
    required this.url,
  });

  @override
  List<Object?> get props => [
        name,
        url,
      ];
  factory LocationEntity.fromJson(Map<String, dynamic> json) =>
      _$LocationEntityFromJson(json);

   Map<String, dynamic> toJson() => _$LocationEntityToJson(this);
}
