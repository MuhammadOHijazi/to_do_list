import 'package:flutter/material.dart';
import 'package:to_do_list/modules/my_to_do_list_screen.dart';
import '../Shared/Components/constant.dart';
import '../utils/database.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => AddNewTaskScreenState();
}

class AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  var category = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration:  BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.rectangle,
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add New Task",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: -100,
                    bottom: -90,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white10,
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: -50,
                    top: -15,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white10,
                          ),
                        ),
                        Container(
                          height: 65,
                          width: 65,
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.all(10),
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: IconButton(
                                icon:  Icon(
                                  Icons.close,
                                  color: primaryColor,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyToDoList()));
                                },
                              ),
                            ),
                            const SizedBox(width: 75),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsetsDirectional.all(20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Task Title",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                      hintText: "Task Title",
                      border: OutlineInputBorder(
                        gapPadding: 5,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: primaryColor,
                        width: 3,
                      ))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Task Must Have a name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Category",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        category = "article";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: category == "article"
                          ? const Color(0xffDBECF6)
                          : Colors.white, // Set button color
                      shape: const CircleBorder(),
                    ),
                    child: Icon(
                      Icons.article_outlined,
                      color: articleColor,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        category = "task";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: category == "task"
                          ? const Color(0xffE7E2F3)
                          : Colors.white,
                      shape: const CircleBorder(),
                    ),
                    child: Icon(
                      Icons.event,
                      color: primaryColor,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        category = "goal";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: category == "goal"
                          ? const Color(0xffFEF5D3)
                          : Colors.white,
                      shape: const CircleBorder(),
                    ),
                    child:  Icon(
                      Icons.emoji_events_outlined,
                      color: eventColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Date",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: dateController,
                            decoration: InputDecoration(
                                hintText: "Date",
                                suffixIcon: const Icon(Icons.date_range),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: primaryColor,
                                  width: 3,
                                ))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Task Must Have a Date';
                              }
                              return null;
                            },
                            onTap: () {
                              selectDate();
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Time",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Task Must Have a Time';
                              }
                              return null;
                            },
                            controller: timeController,
                            onTap: () {
                              selectTime();
                            },
                            decoration: InputDecoration(
                                suffixIcon: const Icon(Icons.access_time),
                                hintText: "Time",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: primaryColor,
                                  width: 3,
                                ))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.all(20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Notes",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: notesController,
                  minLines: 5,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: "Notes",
                    focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(
                      color: primaryColor,
                      width: 3,
                    )),
                    border: OutlineInputBorder(
                      gapPadding: 5,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.all(20),
                child: SizedBox(
                  width:
                      double.infinity, // Makes the button take the full width
                  height: 50, // Sets a fixed height for the button
                  child: ElevatedButton(
                    onPressed: () async {
                      if (titleController.text.isNotEmpty &&
                          dateController.text.isNotEmpty &&
                          timeController.text.isNotEmpty) {
                        // Insert data into the database
                        await ToDoDataBase()
                            .insertToDatabase(
                          titleController.text,
                          category, // You can modify this to select categories
                          dateController.text,
                          timeController.text,
                          notesController.text,
                          "0",
                        )
                            .then((value) async {
                          await ToDoDataBase().getDataFromDatabase();
                        });
                      }
                      setState(() {
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyToDoList()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                           primaryColor, // Set button color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(25), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context, firstDate: DateTime.now(), lastDate: DateTime(20000));
    if (picked != null) {
      setState(() {
        dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> selectTime() async {
    TimeOfDay? timePicked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (timePicked != null) {
      setState(() {
        timeController.text =
            "${timePicked.hourOfPeriod} : ${timePicked.minute}  ${timePicked.period.name}";
      });
    }
  }
}
