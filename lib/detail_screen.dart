import 'package:flutter/material.dart';
import 'package:pocketify/app_color.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  var data = ["500.0", "Expensens", "Jan 30, 2022", "At Ajay Raj's Clinic"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.fabLight,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Detail"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          color: const Color(0xEEEEEEFF),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/food.png',
                                  width: 30,
                                  height: 30,
                                ),
                                const SizedBox(width: 25),
                                const Text(
                                  "Food",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  data[0],
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              children: [
                                const Icon(Icons.category, size: 30),
                                const SizedBox(width: 25),
                                const Text(
                                  "Category",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  data[1],
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              children: [
                                const Icon(Icons.calendar_month, size: 30),
                                const SizedBox(width: 25),
                                const Text(
                                  "Date",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  data[2],
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              children: [
                                const Icon(Icons.attach_email, size: 30),
                                const SizedBox(width: 25),
                                const Text(
                                  "Remark",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  data[3],
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.edit,
                        size: 15,
                      ),
                      label: const Text("EDIT"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColor.fabDark),
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
