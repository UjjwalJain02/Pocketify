import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocketify/app_color.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DateTime currentDate = DateTime.now();
  final DateFormat dayFormatter = DateFormat('yyyy-MM');
  String topBarTitle = "";

  @override
  Widget build(BuildContext context) {
    topBarTitle = "${dayFormatter.format(currentDate)} Balance";
    return Scaffold(
      backgroundColor: AppColor.fabLight,
      body: SafeArea(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(2),
            child: Row(
              children: [
                IconButton(
                  color: Colors.white,
                  icon: const Icon(
                    Icons.date_range,
                    size: 40,
                  ),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  topBarTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 20,
              top: 5,
              bottom: 5,
            ),
            child: const Text(
              "-666",
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 20,
              top: 5,
              bottom: 5,
            ),
            child: const Text(
              "Expense: -666",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 10,
            ),
            child: const Text(
              "Income: 0",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 25, top: 15, bottom: 5),
                            child: const Text(
                              "Budget Setting",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      width: double.infinity,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                            Colors.white,
                                            AppColor.fabLight
                                          ],
                                        ),
                                      )),
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    height: 8,
                                    color: AppColor.fabLight.withOpacity(0.2),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
