import 'package:blood_donor/widgets/dropDownList.dart';
import 'package:blood_donor/widgets/textFormField.dart';
import 'package:flutter/material.dart';

const List<String> hospitalList = <String>[
  'Apollo Blood Bank',
  'SRM Blood Bank',
  'Max Blood Bank',
  'MTS Blood Bank'
];
const List<String> genderlList = <String>["Male", "Female", "Other"];
const List<String> bloodGrouplList = <String>["A+", "A-", "B+", "B-", "O+" , "O-" , "AB+" , "AB-"];

class BookAppointmentScreen extends StatefulWidget {
  BookAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  String? hospitalDropdownValue;
  String? genderlDropdownValue;
  String? bloodlDropdownValue;
  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Appointments"),
        leading: const Icon(Icons.calendar_month_rounded),
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
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset('assests/images/appIcon.png',
                  width: 100, height: 140),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  controller: nameController,
                  hintText: "Name",
                  keyboardType: TextInputType.text,
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              DropDownList(
                  dropDownValue: hospitalDropdownValue,
                  list: hospitalList,
                  unboundedWidth: true,
                  hintext: "Select Blood Bank Location"),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  controller: phoneController,
                  hintText: "Phone Number",
                  keyboardType: TextInputType.phone,
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropDownList(
                      dropDownValue: bloodlDropdownValue,
                      list: bloodGrouplList,
                      unboundedWidth: false,
                      hintext: "Bllood Group"),
                  DropDownList(
                      dropDownValue: genderlDropdownValue,
                      unboundedWidth: false,
                      list: genderlList,
                      hintext: "Choose Sex"),
                ],
                
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                 padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                
                ),
                height: 50,
                child: const Text("Select Date and Time",
                style: TextStyle(fontSize: 25),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
