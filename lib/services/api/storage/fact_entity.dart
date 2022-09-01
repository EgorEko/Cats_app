import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'fact_entity.g.dart';

@HiveType(typeId: 1)
class FactEntity extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final DateTime date;

  const FactEntity(this.id, this.text, this.date);

  @override
  List<Object?> get props => [id, text, date];
}
