part of 'tasks_bloc.dart';

sealed class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}


class GetAllTasksEvent extends TasksEvent{}


class RefreshTasksEvent extends TasksEvent{}