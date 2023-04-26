import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget {
  DropDownList({ Key? key , required this.dropDownValue,  required this.list , required this.hintext , required this.unboundedWidth , required this.width}) : super(key: key);
  bool unboundedWidth ;
  String hintext;
  String? dropDownValue;
  double width;
  var list;
  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  @override
  Widget build(BuildContext context) {
    return  Container(
                // padding: const EdgeInsets.all(4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                
                ),
                height: 65,
                width: widget.width,
                child: DropdownButton<String>(
                  value: widget.dropDownValue,
                  // icon: const Icon(Icons.arrow_downward),
                  iconSize: 30,
                  hint: Text(widget.hintext),
                  iconEnabledColor: Colors.black,
                  elevation: 16,
                  isExpanded: widget.unboundedWidth,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      widget.dropDownValue = value ?? "";
                    });
                  },
                  items: widget.list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              );
  }
}