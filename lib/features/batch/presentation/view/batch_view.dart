import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/batch/presentation/viewmodel/batch_view_model.dart';

class BatchView extends ConsumerWidget {
  const BatchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final batchViewModel = ref.read(batchViewModelProvider.notifier);
    final batches = ref.watch(batchViewModelProvider);
    final TextEditingController batchController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: batchController,
            decoration: const InputDecoration(
              labelText: 'Batch Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              batchViewModel.addBatch(batchController.text);
              batchController.clear();
            },
            child: const Text('Add Batch'),
          ),
          const SizedBox(height: 16),
          const Text(
            'List of Batches',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: batches.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(batches[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
