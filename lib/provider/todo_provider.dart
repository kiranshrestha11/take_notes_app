import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/model/todo_model.dart';

final todoProvider =
    StateNotifierProvider<TodoNotifier, List<TodoModel>>((ref) {
  return TodoNotifier();
});

class TodoNotifier extends StateNotifier<List<TodoModel>> {
  TodoNotifier() : super([]) {
    loadData();
  }

  loadData() {
    state = [...state, ...todoList];
  }

  addData(TodoModel todo) {
    state = [...state..add(todo)];
  }

  removeData(TodoModel todo) {
    state = [...state..remove(todo)];
  }
}
