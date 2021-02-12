import 'package:flutter_stacked_arch_retrofit/common/router/router.gr.dart';
import 'package:flutter_stacked_arch_retrofit/common/service/navigation_service.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/data/model/todo_model.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/domain/repository/todo_repository.dart';
import 'package:stacked/stacked.dart';

class TodoListViewModel extends BaseViewModel {

  final TodoRepository _todoRepository;
  final NavigationService _navigationService;

  TodoListViewModel(this._todoRepository, this._navigationService) {
    _loadTodos();
  }

  List<TodoModel> _todoList;
  List<TodoModel> get todoList => _todoList;

  String _errorMsg;
  String get errorMsg => _errorMsg;

  void _loadTodos() async {
    setBusy(true);

    final result = await _todoRepository.getTodos();
    result.when(success: (data) {
      _todoList = data;
      setError(false);
    }, error: (error) {
      _errorMsg = error;
      setError(true);
    });
    setBusy(false);
  }

  void onTodoItemClicked(int id) {
    _navigationService.push(Routes.todoDetailScreen, TodoDetailScreenArguments(id: id));
  }
}
