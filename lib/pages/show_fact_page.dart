import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/fact_cubit.dart';
import '../services/navigation_service.dart';

class ShowFactPage extends StatelessWidget {
  const ShowFactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random fact'),
        actions: [
          ElevatedButton(
            onPressed: () {
              context.read<NavigationService>().openFacts(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            child: const Text('Fact history'),
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<FactCubit, FactState>(
          builder: (context, state) {
            if (state is FactStateSucceed) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxWidth: 240, maxHeight: 320),
                    child: Text(state.fact),
                  ),
                  Text(state.localizedDate),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 320),
                    child: Image.network(
                      'https://cataas.com/cat?${state.id}',
                    ),
                  ),
                ],
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.read<FactCubit>().loadFact();
        },
        tooltip: 'Another fact',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
