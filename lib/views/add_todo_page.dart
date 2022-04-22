import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/provider/todo_provider.dart';

class AddTodoPage extends ConsumerWidget {
  AddTodoPage({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "13April 4:30PM",
          style: TextStyle(
              color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0.0,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TextFormField(
                controller: _titleController,
                textCapitalization: TextCapitalization.sentences,
                cursorColor: Colors.grey,
                cursorHeight: 27.0,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title",
                    hintStyle: TextStyle(fontSize: 20, color: Colors.grey)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TextFormField(
                controller: _descriptionController,
                cursorColor: Colors.grey,
                cursorHeight: 21.0,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Notes",
                    hintStyle: TextStyle(color: Colors.grey)),
                onFieldSubmitted: (value) {
                  TodoModel todo = TodoModel(
                      id: 6,
                      title: _titleController.text,
                      description: _descriptionController.text);

                  ref.read(todoProvider.notifier).addData(todo);
                  Navigator.pop(context);
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
