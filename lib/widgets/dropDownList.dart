import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget {
  DropDownList({ Key? key , required this.dropDownValue,  required this.list , required this.hintext , required this.unboundedWidth}) : super(key: key);
  bool unboundedWidth ;
  String hintext;
  String? dropDownValue;
  var list;
  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  @override
  Widget build(BuildContext context) {
    return  Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                
                ),
                height: 65,
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
                    fontSize: 25,
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