import 'package:flutter/material.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => AddNewTaskScreenState();
}

class AddNewTaskScreenState extends State<AddNewTaskScreen> {

  @override
  void initState(){
    super.initState();
  }

  TextEditingController dateController = TextEditingController();
  TextEditingController TimeController = TextEditingController();

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
                    decoration: const BoxDecoration(
                      color: Color(0xff4A3780),
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
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff4A3780),
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
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff4A3780),
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
                                icon: const Icon(
                                  Icons.close,
                                  color: Color(0xff4A3780),
                                ),
                                onPressed: () {},
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
                  decoration: InputDecoration(
                    hintText: "Task Title",
                    border: OutlineInputBorder(
                      gapPadding: 5,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
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
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffDBECF6),
                    ),
                    child: const Icon(
                      Icons.article_outlined,
                      color: Color(0xff194A66),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffE7E2F3),
                    ),
                    child: const Icon(
                      Icons.event,
                      color: Color(0xff4A3780),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFEF5D3),
                    ),
                    child: const Icon(
                      Icons.emoji_events_outlined,
                      color: Color(0xff403100),
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
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff4A3780),
                                  width: 3,
                                )
                              )
                            ),
                            onTap: (){
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
                            controller: TimeController,
                            onTap: (){
                              selectTime();
                            },
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.access_time),
                              hintText: "Time",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff4A3780),
                                      width: 3,
                                    )
                                )
                            ),
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
                  minLines: 5,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: "Notes",
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
                  width: double.infinity, // Makes the button take the full width
                  height: 50, // Sets a fixed height for the button
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff4A3780), // Set button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25), // Rounded corners
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

  Future<void>selectDate() async{
    DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(20000)
    );
    if (picked != null){
      setState((){
      dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
  Future<void>selectTime() async{
   TimeOfDay? timePicked =  await showTimePicker(context: context,
        initialTime: TimeOfDay.now());

   if (timePicked != null){
     setState((){
       TimeController.text = "${timePicked.hour} : ${timePicked.minute}";
     });
   }


  }

}


