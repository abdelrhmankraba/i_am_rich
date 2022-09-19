import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_am_rich/shared/components/components.dart';
import 'package:i_am_rich/shared/cubit/cubit.dart';
import 'package:i_am_rich/shared/cubit/states.dart';


class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppState>(
      listener: (context , state){},
      builder: (context , state){
        var tasks = AppCubit.get(context).archiveTasks;
        return taskBuilder(tasks: tasks);
      },
    );
  }
}