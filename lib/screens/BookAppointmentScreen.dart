import 'package:blood_donor/widgets/dropDownList.dart';
import 'package:blood_donor/widgets/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';

const List<String> hospitalList = <String>[
  'Apollo Blood Bank',
  'SRM Blood Bank',
  'Max Blood Bank',
  'MTS Blood Bank'
];
const List<String> genderlList = <String>["Male", "Female", "Other"];
const List<String> bloodGrouplList = <String>[
  "A+",
  "A-",
  "B+",
  "B-",
  "O+",
  "O-",
  "AB+",
  "AB-"
];

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
  String _valueChanged3 = '';
  String _valueToValidate3 = '';
  String _valueSaved3 = '';
  late TextEditingController _controller3;
  var timeSlots = [
    "10:00 AM",
    "11:00 AM",
    "11:30 AM",
    "12:30 PM",
    "1:45 PM",
    "2:00 PM",
    "3:15 PM"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Intl.defaultLocale = 'pt_BR';
    _controller3 = TextEditingController(text: DateTime.now().toString());
  }

  int _selectedIndex = 0;
  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            mainAxisSize: MainAxisSize.min,
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
                  width: MediaQuery.of(context).size.width,
                  unboundedWidth: false,
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
                      width: 160,
                      hintext: "Bllood Group"),
                  DropDownList(
                      dropDownValue: genderlDropdownValue,
                      unboundedWidth: false,
                      list: genderlList,
                      width: 160,
                      hintext: "Choose Sex"),
                ],
              ),
              const SizedBox(
                height: 20,
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
                child: const Text(
                  "Select Date and Time",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              DateTimePicker(
                type: DateTimePickerType.date,
                //dateMask: 'yyyy/MM/dd',
                controller: _controller3,
                style: TextStyle(
                  color: Colors.white,
                  // backgroundColor: Colors.white,
                  decorationColor: Colors.white,
                  fontSize: 25,
                ),
                //initialValue: _initialValue,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                icon: Icon(
                  Icons.event,
                  color: Colors.white,
                  size: 25,
                ),
                dateLabelText: 'Date',
                locale: Locale('en', 'IN'),
                onChanged: (val) => setState(() => _valueChanged3 = val),
                validator: (val) {
                  setState(() => _valueToValidate3 = val ?? '');
                  return null;
                },
                onSaved: (val) => setState(() => _valueSaved3 = val ?? ''),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 4),
                    ),
                    itemCount: timeSlots.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            // Toggle light when tapped.
                            _onSelected(index);
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: _selectedIndex != null &&
                                    _selectedIndex == index
                                ? Colors.blue
                                : Colors.white,
                          ),
                          height: 10,
                          child: Center(child: Text(timeSlots[index])),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text('Appointment Book'),
                              
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: Text('OK'),
                                ),
                              ]);
                        });
                  },
                  child: const Text(
                    "Book Appointment",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      fixedSize:
                          MaterialStateProperty.all<Size>(const Size(150, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
