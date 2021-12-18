import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_study/pages/state_management/bloc_pattern/bloc/todo_cubit.dart';
import 'package:flutter_study/pages/state_management/bloc_pattern/bloc/todo_state.dart';
import 'package:flutter_study/pages/state_management/bloc_pattern/repository/todo_repository.dart';

class BlocScreen extends StatefulWidget {
  const BlocScreen({Key? key}) : super(key: key);

  @override
  _BlocScreenState createState() => _BlocScreenState();
}

class _BlocScreenState extends State<BlocScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (_) => TodoBloc(
      //   repository: TodoRepository(),
      // ),
      create: (_) => TodoCubit(
        repository: TodoRepository(),
      ),
      child: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  String title = '';

  @override
  void initState() {
    super.initState();

    // BlocProvider.of<TodoBloc>(context).add(
    //   ListTodosEvent(),
    // );
    BlocProvider.of<TodoCubit>(context).listTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc pattern'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // context.read<TodoBloc>().add(
          //       CreateTodoEvent(title: this.title),
          //     );
          context.read<TodoCubit>().createTodo(title);
        },
        child: Icon(Icons.edit),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (val) {
                this.title = val;
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: BlocBuilder<TodoCubit, TodoState>(
                builder: (_, state) {
                  if (state is Empty) {
                    return Container();
                  } else if (state is Loaded) {
                    final items = state.todos;

                    return ListView.separated(
                      itemBuilder: (_, index) {
                        final item = items[index];
                        return Row(
                          children: [
                            Expanded(
                              child: Text(item.title),
                            ),
                            InkWell(
                              onTap: () {
                                // BlocProvider.of<TodoBloc>(context).add(
                                //   DeleteTodoEvent(todo: item),
                                // );
                                BlocProvider.of<TodoCubit>(context)
                                    .deleteTodo(item);
                              },
                              child: Icon(Icons.delete),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (_, index) => Divider(),
                      itemCount: items.length,
                    );
                  } else if (state is Error) {
                    return Container(
                      child: Text(state.message),
                    );
                  } else if (state is Loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
