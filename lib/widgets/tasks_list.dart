import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final currentTask = taskData.tasks[index];
            return TaskTile(
              isChecked: currentTask.isDone,
              taskTitle: currentTask.name,
              checkboxCallback: (checkboxState) {
                taskData.updateTaskStatus(currentTask);
              },
              longPressCallback: () {
                taskData.deleteTask(currentTask);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
