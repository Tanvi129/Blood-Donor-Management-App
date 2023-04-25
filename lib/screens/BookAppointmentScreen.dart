import 'package:blood_donor/widgets/textFormField.dart';
import 'package:flutter/material.dart';

const List<String> hospitalList = <String>['Apollo Blood Bank', 'SRM Blood Bank', 'Max Blood Bank', 'MTS Blood Bank'];

class BookAppointmentScreen extends StatefulWidget {
  BookAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  String? hospitalDropdownValue ;
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
              Image.asset('assests/images/appIcon.png'),
              CustomTextField(
                  controller: nameController,
                  hintText: "Name",
                  keyboardType: TextInputType.text,
                  obscureText: false),
             const SizedBox(
                        height: 20,
                      ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                
                ),
                height: 65,
                child: DropdownButton<String>(
                  value: hospitalDropdownValue,
                  // icon: const Icon(Icons.arrow_downward),
                  iconSize: 30,
                  hint: Text("Select Blood Bank Location"),
                  iconEnabledColor: Colors.black,
                  elevation: 16,
                  isExpanded: true,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  underline: Container(
                    color: Colors.white,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      hospitalDropdownValue = value ?? "";
                    });
                  },
                  items: hospitalList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                        height: 20,
                      ),
              CustomTextField(
                  controller: phoneController,
                  hintText: "Phone Number",
                  keyboardType: TextInputType.phone,
                  obscureText: false),
            ],
          ),
        ),
      ),
    );
  }
}
