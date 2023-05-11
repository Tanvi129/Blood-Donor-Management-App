import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppListTile extends StatelessWidget {
  AppListTile({Key? key, required this.date , required this.time , required this.loc}) : super(key: key);
  String date;
  String time;
  String loc;

  @override
  Widget build(BuildContext context) {
    return  Container(
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          date,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          time,
                                          style: const TextStyle(fontSize: 16),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      loc,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              );
  }
}