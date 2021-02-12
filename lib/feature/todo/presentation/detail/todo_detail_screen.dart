import 'package:flutter/material.dart';
import 'package:flutter_stacked_arch_retrofit/common/constant/strings.dart';
import 'package:flutter_stacked_arch_retrofit/common/locator/locator.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/data/model/todo_model.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/presentation/detail/todo_detail_view_model.dart';
import 'package:stacked/stacked.dart';

class TodoDetailScreen extends ViewModelBuilderWidget<TodoDetailViewModel> {
  final int id;

  TodoDetailScreen(this.id);

  @override
  Widget builder(
      BuildContext context, TodoDetailViewModel viewModel, Widget child) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.todoList)),
      body: _buildBody(context, viewModel),
    );
  }

  Widget _buildBody(BuildContext context, TodoDetailViewModel viewModel) {
    if (viewModel.isBusy) {
      return Center(child: CircularProgressIndicator());
    } else if (viewModel.hasError) {
      return Center(child: Text(viewModel.errorMsg));
    } else {
      return _buildListViewItem(context, viewModel.todoModel);
    }
  }

  Widget _buildListViewItem(BuildContext context, TodoModel model) {
    return ListTile(
      title: Text(model.title),
      leading: Text("${model.id}"),
      trailing: Checkbox(value: model.completed, onChanged: null),
    );
  }

  @override
  TodoDetailViewModel viewModelBuilder(BuildContext context) =>
      locator<TodoDetailViewModel>()..loadTodoDetails(id);
}
