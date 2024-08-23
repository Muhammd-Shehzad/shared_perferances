import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  List<String> addList = [];

  TextEditingController search = TextEditingController();

  bool ischeck = false;

  Future<void> saveList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setStringList('list', addList);
    });
  }

  Future<void> loadList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      addList = prefs.getStringList('list') ?? [];
    });
  }

  @override
  void initState() {
    loadList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'ToDo App UI',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'To-Day',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Text(
            '18 Aug 2024',
            style: TextStyle(color: Colors.white),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: addList.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 80.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                            value: ischeck,
                            onChanged: (v) {
                              setState(() {
                                ischeck = v!;
                              });
                            }),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          addList[index],
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Center(
                                      child: Text(
                                        'Add your task',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25.sp),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Icon(Icons.close)),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: TextField(
                                  controller: search,
                                  decoration: InputDecoration(
                                    hintText: 'Enter Work',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    if (search.text.isNotEmpty) {
                                      setState(() {
                                        addList.add(search.text);
                                      });
                                    }
                                  },
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20.sp),
                                  ))
                            ],
                          )
                        ],
                      );
                    },
                  );
                },
                backgroundColor: Colors.blueGrey,
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
