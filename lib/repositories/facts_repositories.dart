import 'package:hive/hive.dart';

import '../services/api/storage/fact_entity.dart';

class FactsRepository {
  Future<List<FactEntity>> loadAll() async {
    final box = await Hive.openBox<FactEntity>('factsBox');
    final todos = box.values;
    await Hive.close();

    return todos.toList();
  }

  Future<FactEntity> add(FactEntity fact) async {
    final box = await Hive.openBox<FactEntity>('factsBox');

    await box.add(fact);
    await Hive.close();

    return fact;
  }
}
