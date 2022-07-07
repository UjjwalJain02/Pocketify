import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocketify/panel_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:pocketify/app_color.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> with SingleTickerProviderStateMixin {
  String expression = "";
  String amount = "0.00";
  String remark = "";
  double screenHeight = 0;
  double fabHeight = 0;
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  final DateFormat dateFormatter = DateFormat('EEE, MMM d, yyyy');
  final DateFormat timeFormatter = DateFormat('h:mm a');
  PanelController panelController = PanelController();
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    fabHeight = screenHeight * 0.025;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (picked != null && picked != time) {
      setState(() {
        time = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: getAppBar(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SlidingUpPanel(
            controller: panelController,
            minHeight: screenHeight * 0.05,
            maxHeight: screenHeight * 0.40,
            panelBuilder: (controller) => PanelWidget(
              controller: controller,
              screenWidth: MediaQuery.of(context).size.width,
              maxHeight: screenHeight * 0.35,
              callback: calculate,
            ),
            onPanelSlide: (percentage) => {
              setState(() {
                fabHeight = (((screenHeight * 0.35) * percentage) +
                    (screenHeight * 0.025));
              })
            },
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
                                GestureDetector(
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.calendar_month,
                                            size: 30),
                                        const SizedBox(width: 25),
                                        const Text(
                                          "Date",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          dateFormatter.format(date),
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _selectTime(context);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.access_time, size: 30),
                                        const SizedBox(width: 25),
                                        const Text(
                                          "Time",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          timeFormatter.format(
                                            DateTime(
                                              date.day,
                                              date.month,
                                              date.year,
                                              time.hour,
                                              time.minute,
                                            ),
                                          ),
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  child: Row(
                                    children: const [
                                      Icon(Icons.edit, size: 30),
                                      SizedBox(width: 25),
                                      Flexible(
                                        child: TextField(
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                          decoration: InputDecoration(
                                            labelText: 'Remark',
                                            labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            hintText: 'At Ajay Raj\'s Clinic',
                                            hintStyle: TextStyle(
                                              fontSize: 16,
                                            ),
                                            border: InputBorder.none,
                                          ),
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
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: fabHeight == 0 ? screenHeight * 0.025 : fabHeight,
            child: FloatingActionButton(
              backgroundColor: AppColor.fabDark,
              child: panelController.isAttached
                  ? panelController.isPanelClosed
                      ? const Text(
                          "123",
                          style: TextStyle(fontSize: 20),
                        )
                      : const Icon(
                          Icons.done,
                          size: 30,
                        )
                  : const Text(
                      "123",
                      style: TextStyle(fontSize: 20),
                    ),
              onPressed: () => {
                if (panelController.isAttached)
                  {
                    panelController.isPanelOpen
                        ? (() {
                            panelController.close();
                            setState(() {
                              amount = Calculalor.calculate(expression);
                            });
                          })()
                        : panelController.open()
                  }
              },
            ),
          )
        ],
      ),
    );
  }

  void calculate() {
    log(Calculalor.userInput);
    if (Calculalor.userInput == "<") {
      expression = expression.substring(0, expression.length - 1);
    } else {
      expression += Calculalor.userInput;
    }
  }

  AppBar getAppBar() {
    return AppBar(
      backgroundColor: AppColor.fabLight,
      toolbarHeight: AppBar().preferredSize.height,
      bottom: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: Container(
          height: AppBar().preferredSize.height,
          color: AppColor.fabLight,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Column(children: [
                        TabBar(
                          isScrollable: true,
                          controller: _tabController,
                          unselectedLabelColor: Colors.grey,
                          labelColor: AppColor.fabLight,
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          labelPadding: EdgeInsets.zero,
                          indicatorColor: AppColor.fabDark,
                          tabs: const [
                            Tab(
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 2, right: 5),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text("EXPENSES"),
                                ),
                              ),
                            ),
                            Tab(
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 2, left: 5),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text("INCOME"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: ListView(
                                  padding: const EdgeInsets.all(8),
                                  children: ListTile.divideTiles(
                                    color: Colors.grey,
                                    tiles: [
                                      for (int i = 0; i < 5; i++)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 6,
                                          ),
                                          child: ListTile(
                                            title: const Text(
                                              "Food",
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            leading: Padding(
                                              padding: const EdgeInsets.only(
                                                right: 15,
                                              ),
                                              child: Image.asset(
                                                'assets/images/food.png',
                                                width: 35,
                                                height: 35,
                                              ),
                                            ),
                                            // trailing:
                                            //     const Icon(Icons.star),
                                          ),
                                        ),
                                    ],
                                  ).toList(),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: ListView(
                                  padding: const EdgeInsets.all(8),
                                  children: ListTile.divideTiles(
                                    color: Colors.grey,
                                    tiles: [
                                      for (int i = 0; i < 5; i++)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 6,
                                          ),
                                          child: ListTile(
                                            title: const Text(
                                              "Food",
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            leading: Padding(
                                              padding: const EdgeInsets.only(
                                                right: 15,
                                              ),
                                              child: Image.asset(
                                                'assets/images/food.png',
                                                width: 35,
                                                height: 35,
                                              ),
                                            ),
                                            // trailing:
                                            //     const Icon(Icons.star),
                                          ),
                                        ),
                                    ],
                                  ).toList(),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]);
                    },
                  );
                },
                child: Image.asset(
                  'assets/images/food.png',
                  height: 40,
                  width: 40,
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        amount,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Text(
                    "$expression =",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: const Text("Edit"),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {});
          },
          icon: const Icon(Icons.done_all),
        )
      ],
    );
  }
}
