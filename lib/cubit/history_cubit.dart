import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/facts_repositories.dart';
import '../services/api/responses/fact_dto.dart';
import '../services/api/storage/fact_entity.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final FactsRepository _repository;

  HistoryCubit(this._repository) : super(const HistoryState([]));

  void record(FactDTO fact) {
    final item = FactEntity(fact.id, fact.text, fact.date);
    _repository.add(item);
    emit(HistoryState([...state.items, item]));
  }

  Future<void> loadHistory() async {
    final items = await _repository.loadAll();
    emit(HistoryState(items));
  }
}
