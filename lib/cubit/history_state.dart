part of 'history_cubit.dart';

class HistoryState extends Equatable {
  final List<FactEntity> items;

  const HistoryState(this.items);

  @override
  List<Object?> get props => [items];
}
