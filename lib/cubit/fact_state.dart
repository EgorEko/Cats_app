part of 'fact_cubit.dart';

DateFormat _localFormat = DateFormat();

abstract class FactState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FactStateInitial extends FactState {
  FactStateInitial();
}

class FactStateWaiting extends FactState {}

class FactStateSucceed extends FactState {
  final String id;
  final String fact;
  final DateTime date;

  String get localizedDate => _localFormat.format(date);

  FactStateSucceed(this.id, this.fact, this.date);

  @override
  List<Object?> get props => [id, fact, date];
}

class FactStateLoadedFacts extends FactState {
  final List<FactDTO> facts;

  FactStateLoadedFacts(this.facts);

  @override
  List<Object?> get props => [facts];
}

class FactStateFailed extends FactState {
  final String error;

  FactStateFailed(this.error);

  @override
  List<Object?> get props => [error];
}
