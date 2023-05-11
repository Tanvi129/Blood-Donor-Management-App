import 'package:blood_donor/widgets/appListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

class MyRecordsScreen extends StatefulWidget {
  MyRecordsScreen({Key? key}) : super(key: key);

  @override
  State<MyRecordsScreen> createState() => _MyRecordsScreenState();
}

class _MyRecordsScreenState extends State<MyRecordsScreen> {
  int? groupValue = 0;
  var displayList = [];
  var upcomingRecords = [
    ["13 May, 2023", "3:00 PM", "SRM Blood Bank"],
    ["15 June, 2023", "2:25 PM", "MAX Blood Bank"],
    ["16 July, 2023", "1:00 PM", "Apollo Blood Bank"],
    ["19 August, 2023", "4:40 PM", "SRM Blood Bank"],
    ["22 September, 2023", "1:25 PM", "Apollo Blood Bank"]
  ];
  var pastRecords = [
    ["13 March, 2023", "3:00 PM", "SRM Blood Bank"],
    ["15 February, 2023", "2:25 PM", "MAX Blood Bank"],
    ["16 January, 2023", "1:00 PM", "Apollo Blood Bank"],
  ];
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection("pastAPP").snapshots();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayList = upcomingRecords;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Records"),
        leading: const Icon(Icons.list_alt_rounded),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.red, Colors.black],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: CupertinoSlidingSegmentedControl<int>(
                    backgroundColor: CupertinoColors.white,
                    thumbColor: CupertinoColors.systemGrey,
                    padding: const EdgeInsets.all(8),
                    groupValue: groupValue,
                    children: {
                      0: buildSegment("Upcoming"),
                      1: buildSegment("Past"),
                    },
                    onValueChanged: (value) {
                      setState(() {
                        groupValue = value;
                      });
                      if (groupValue == 0) {
                        setState(() {
                          displayList = upcomingRecords;
                        });
                      } else {
                        setState(() {
                          displayList = pastRecords;
                        });
                      }
                    }),
              ),
              const SizedBox(
                height: 30,
              ),
              Flexible(
                  fit: FlexFit.loose,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection("pastAPP").snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          debugPrint("Error ${snapshot.error}");
                          print(snapshot.data);

                          return Text('Something went wrong');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text("Loading");
                        }
                        return ListView(
                          children: snapshot.data!.docs
                              .map((doc) => new AppListTile(date: doc["date"], time: doc["time"], loc: doc["loc"]))
                              .toList(),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSegment(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: 22, color: Colors.black),
      ),
    );
  }
  getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data!.docs
        .map((doc) => new AppListTile(date: doc["date"], time: doc["time"], loc: doc["loc"]))
        .toList();
  }
}
