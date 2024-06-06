// lib/features/batch/presentation/viewmodel/batch_view_model.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BatchViewModel extends StateNotifier<List<String>> {
  BatchViewModel() : super([]);

  void addBatch(String batchName) {
    if (batchName.isNotEmpty) {
      state = [...state, batchName];
    }
  }
}

final batchViewModelProvider =
    StateNotifierProvider<BatchViewModel, List<String>>((ref) {
  return BatchViewModel();
});
