import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/views/add_todo_page.dart';
import 'package:todo_app/views/home/custom_app_bar.dart';
import 'package:todo_app/views/home/no_note.dart';
import 'package:todo_app/views/home/search_bar.dart';

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    final _todo = ref.watch(todoProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: PreferredSize(
          preferredSize: Size(300, 60),
          child: CustomAppBar(),
        ),
        drawer: Drawer(
          backgroundColor: greyColor,
          elevation: 10,
          semanticLabel: "Notes",
          child: Container(
            child: ListTile(
              title: Text("Notes"),
              //subtitle: ListTile(trailing: Icon(Icons.light)),
            ),
          ),
        ),
        body: ListView(
          children: [
            SearchBar(controller: _controller),
            if (_todo.isEmpty)
              NoNote()
            else
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
                child: GridView(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8),
                    shrinkWrap: true,
                    children: [
                      ..._todo.map(
                        ((e) => Container(
                              height: 600,
                              constraints: BoxConstraints(
                                maxHeight: double.infinity,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: greyColor),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: GridTile(
                                  header: GridTileBar(
                                    title: Text(
                                      e.title,
                                      softWrap: true,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        e.description,
                                        softWrap: true,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return AddTodoPage();
                                      }));
                                    },
                                  )),
                            )),
                      )
                    ]),
              )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddTodoPage(),
                ),
              );
            },
            backgroundColor: kSecondColor,
            child: Icon(
              Icons.add,
              size: 35,
            )),
      ),
    );
  }
}
