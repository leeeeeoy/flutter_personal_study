import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/pages/state_management/bloc_pattern/model/todo.dart';

@immutable
abstract class TodoState extends Equatable {}

class Empty extends TodoState {
  @override
  List<Object> get props => [];
}

class Loading extends TodoState {
  @override
  List<Object> get props => [];
}

class Error extends TodoState {
  final String message;

  Error({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class Loaded extends TodoState {
  final List<Todo> todos;

  Loaded({
    required this.todos,
  });

  @override
  List<Object> get props => [todos];
}
