import 'package:blood_donor/widgets/profileDisplayItem.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        leading: const Icon(Icons.person),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assests/images/Tanvi Gupta.jpg'),
                    radius: 70,
                  ),
                  const SizedBox(
                height: 10,
              ),
               Text(
                "Tanvi Gupta",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
                ],
                
              
              ),
               const SizedBox(
                height: 30,
               ) ,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileDisplayData(icon: Icons.female , tag: "Gender", tagValue: "Female",),
                   ProfileDisplayData(icon: Icons.water_drop_outlined , tag: "Blood Group", tagValue: "A+",),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              ProfileDisplayData(icon: Icons.calendar_month , tag: "Date Of Birth", tagValue: "22 April, 2003",),
              const SizedBox(
                height: 25,
              ),
              ProfileDisplayData(icon: Icons.mail_outline , tag: "Email", tagValue: "tanvigupta129@gmail.com",),
              const SizedBox(
                height: 25,
              ),
              ProfileDisplayData(icon: Icons.calendar_month , tag: "Phone Number", tagValue: "+91 9557146955",),
              const SizedBox(
                height: 25,
              ),
              ProfileDisplayData(icon: Icons.home_outlined , tag: "Address", tagValue: "Room 1334, M Block Hostel",),


            ],
          ),
        ),
      ),
    );
  }
}
