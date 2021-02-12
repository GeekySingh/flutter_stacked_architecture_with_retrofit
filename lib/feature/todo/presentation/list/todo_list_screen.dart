import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_stacked_arch_retrofit/common/constant/strings.dart';
import 'package:flutter_stacked_arch_retrofit/common/locator/locator.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/data/model/todo_model.dart';
import 'package:flutter_stacked_arch_retrofit/feature/todo/presentation/list/todo_list_view_model.dart';
import 'package:stacked/stacked.dart';

class TodoListScreen extends ViewModelBuilderWidget<TodoListViewModel> {
  @override
  Widget builder(
      BuildContext context, TodoListViewModel viewModel, Widget child) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.todoDetails)),
      body: _buildBody(context, viewModel),
    );
  }

  Widget _buildBody(BuildContext context, TodoListViewModel viewModel) {
    if (viewModel.isBusy) {
      return Center(child: CircularProgressIndicator());
    } else if (viewModel.hasError) {
      return Center(child: Text(viewModel.errorMsg));
    } else {
      return ListView.builder(
          itemBuilder: (context, index) =>
              _buildListViewItem(context, viewModel, viewModel.todoList[index]));
    }
  }

  Widget _buildListViewItem(BuildContext context, TodoListViewModel viewModel, TodoModel model) {
    return ListTile(
      title: Text(model.title),
      leading: Text("${model.id}"),
      trailing: Checkbox(value: model.completed, onChanged: null),
      onTap: () => viewModel.onTodoItemClicked(model.id),
    );
  }

  @override
  TodoListViewModel viewModelBuilder(BuildContext context) =>
      locator<TodoListViewModel>();
}
