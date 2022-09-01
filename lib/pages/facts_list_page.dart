import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/history_cubit.dart';

class FactslistPage extends StatelessWidget {
  const FactslistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cats history')),
      body: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              final facts = state.items[index];
              return ListTile(
                title: Text('${facts.text} : ${facts.date}'),
              );
            },
            itemCount: state.items.length,
          );
        },
      ),
    );
  }
}
