import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_am_rich/shared/components/components.dart';
import 'package:i_am_rich/shared/components/constants.dart';
import 'package:i_am_rich/shared/cubit/cubit.dart';
import 'package:i_am_rich/shared/cubit/states.dart';

class NewTasksScreen extends StatelessWidget {
  const NewTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppState>(
        listener: (context , state){},
        builder: (context , state){
          var tasks = AppCubit.get(context).newTasks;
          return taskBuilder(tasks: tasks);
        },
      );
  }
}
