import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fact_dto.g.dart';

@JsonSerializable()
class FactDTO extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  @JsonKey(name: 'text')
  final String text;
  @JsonKey(name: 'updatedAt')
  final DateTime date;

  const FactDTO({required this.id, required this.text, required this.date});

  factory FactDTO.fromJson(Map<String, dynamic> json) =>
      _$FactDTOFromJson(json);

  @override
  List<Object?> get props => [id, text, date];
}
