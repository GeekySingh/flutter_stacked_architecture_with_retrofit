
import 'package:flutter_stacked_arch_retrofit/common/service/navigation_service.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/data/model/todo_model.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/domain/repository/todo_repository.dart';
import 'package:stacked/stacked.dart';

class TodoDetailViewModel extends BaseViewModel {

  final TodoRepository _todoRepository;
  TodoDetailViewModel(this._todoRepository);

  TodoModel _todoModel;
  TodoModel get todoModel => _todoModel;

  String _errorMsg;
  String get errorMsg => _errorMsg;

  void loadTodoDetails(int id) async {
    setBusy(true);

    final result = await _todoRepository.getTodoDetail(id);
    result.when(success: (data) {
      _todoModel = data;
      setError(false);
    }, error: (error) {
      _errorMsg = error;
      setError(true);
    });
    setBusy(false);
  }
}