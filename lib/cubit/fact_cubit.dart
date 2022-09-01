import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubit/history_cubit.dart';
import '../services/api/api_service.dart';
import '../services/api/responses/fact_dto.dart';

part 'fact_state.dart';

class FactCubit extends Cubit<FactState> {
  FactCubit(this._apiService, this._historyCubit) : super(FactStateInitial());
  final ApiService _apiService;
  final HistoryCubit _historyCubit;

  Future<void> loadFact() async {
    try {
      emit(
        FactStateWaiting(),
      );

      final fact = await _apiService.getRandomFact();

      _historyCubit.record(fact);
      emit(FactStateSucceed(fact.id, fact.text, fact.date));
    } catch (e) {
      emit(FactStateFailed(e.toString()));
    }
  }
}
